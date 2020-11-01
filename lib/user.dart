class user{
  String name;
  String id;
  String mobile_no;
  String age;
  String address;
  String blood_group;
  int donation_count;
  String location;
  String avail_time;
  user({
    this.id,this.name, this.address,this.age,this.mobile_no,
    this.location, this.blood_group,this.donation_count,this.avail_time
  });

  factory user.fromJson(Map<String, dynamic> json){
    return user(
      id: json["id"],
      name: json["name"],
      address: json["age"],
      mobile_no: json["mobile_no"],
      location: json["location"],
      blood_group: json["blood_group"],
      donation_count: json["donation_count"],
      avail_time: json["avail_time"],
    );
  }

  // String get defined_name{
  //   return name;
  // }
  //
  // set setname(String name){
  //   this.name = name;
  // }
}