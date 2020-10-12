import 'dart:convert';

class AccountsModel {
  String username;
  String email;
  String password;
  String firstName;
  String lastName;

  AccountsModel(
      {this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.password});

  factory AccountsModel.fromJson(Map<String, dynamic> map) {
    return AccountsModel(
        username: map["username"],
        firstName: map["firstName"],
        lastName: map["lastName"],
        email: map["email"],
        password: map["password"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password
    };
  }

  @override
  String toString() {
    return '{username: $username, firstName: $firstName, lastName: $lastName, email: $email, password: $password}';
  }
}

List<AccountsModel> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<AccountsModel>.from(
      data.map((item) => AccountsModel.fromJson(item)));
}

String profileToJson(AccountsModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
