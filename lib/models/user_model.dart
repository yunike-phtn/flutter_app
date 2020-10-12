class UserModel {
  String password;
  String firstName;
  String lastName;
  String username;
  String email;

  //BUAT CONSTRUCTOR AGAR KETIKA CLASS INI DILOAD, MAKA DATA YANG DIMINTA HARUS DIPASSING SESUAI TIPE DATA YANG DITETAPKAN
  UserModel(
      {this.password,
      this.firstName,
      this.lastName,
      this.username,
      this.email});

  //FUNGSI INI UNTUK MENGUBAH FORMAT DATA DARI JSON KE FORMAT YANG SESUAI DENGAN EMPLOYEE MODEL
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      email: json['email']);
}
