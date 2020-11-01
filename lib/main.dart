import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
void main() => runApp(UserApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My App',
      home: new UserApp(),
    );
  }
}

class UserApp extends StatefulWidget {
  @override
  _UserAppState createState() => _UserAppState();
}
class _UserAppState extends State<UserApp> {
  @override
  Widget build(BuildContext context) {
    final EmailController = TextEditingController();
    final PasswordController = TextEditingController();
    return Container(
      child: Column(
        children: [
          TextField(
            controller: EmailController,
          ),
          TextField(
            controller: PasswordController,
          ),
          RaisedButton(
            onPressed: ()=>{
              checkUserCredentials(EmailController.text,PasswordController.text)
            },
          )
        ],
      ),
    );
  }
}
checkUserCredentials(String email, String password) {
 //Steps to proceed :
 //Send email and password to the API if the status code is 200
 //Navigate user to the details screen
 //else show Error text
  var data = {email, password};
  String api = 'https://cplasma.infikeypro.tech/public/api/login';
  http.post(
      api,
      headers:{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: json.encode(data)
  )
      .then((resp) {
        if(resp.statusCode == 200){
          //Navigate to the next screen
          BuildContext context;
          Navigator.push(context, MaterialPageRoute(builder: (context) => UserLatestScreen(token: resp.body,)));
        }else{
          //show Error Message
          print("You are not authorized for this page");
        }
  });
}

class UserLatestScreen extends StatelessWidget {
  String token;
  UserLatestScreen({Key key, @required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String api = 'https://cplasma.infikeypro.tech/public/api/doner';
    http.get(
        api,
        headers:{
          'Content-Type': 'application/json; charset=UTF-8'
        },
    ).then((value) => {
      print(value.body)
    });
    return Container(
      child: Text('this is the authentiacted screen'),
    );
  }
}

