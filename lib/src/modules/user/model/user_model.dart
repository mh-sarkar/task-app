class UserModel {
  String? pk;
  String? username;
  String? email;
  String? firstName;
  String? lastName;

  UserModel(
      {this.pk, this.username, this.email, this.firstName, this.lastName});

  UserModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'].toString() == 'null'? '':json['pk'].toString() ;
    username = json['username'].toString() == 'null'? '':json['username'].toString() ;
    email = json['email'].toString() == 'null'? '':json['email'].toString() ;
    firstName = json['first_name'].toString() == 'null'? '':json['first_name'].toString() ;
    lastName = json['last_name'].toString() == 'null'? '':json['last_name'].toString() ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pk'] = pk;
    data['username'] = username;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    return data;
  }
}
