import 'package:flutter_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProvider extends ChangeNotifier {
  //DEFINISIKAN PRIVATE VARIABLE DENGAN TYPE List dan VALUENYA MENGGUNAKAN FORMAT EMPLOYEEMODEL
  //DEFAULTNYA KITA BUAT KOSONG
  List<UserModel> _data = [];
  //KARENA PRIVATE VARIABLE TIDAK BISA DIAKSES OLEH CLASS/FILE LAINNYA, MAKA DIPERLUKAN GETTER YANG BISA DIAKSES SECARA PUBLIC, ADAPUN VALUENYA DIAMBIL DARI _DATA
  List<UserModel> get dataUser => _data;

  //BUAT FUNGSI UNTUK MELAKUKAN REQUEST DATA KE SERVER / API
  Future<List<UserModel>> getUser() async {
    final url =
        'https://flutter-gnc-user.firebaseio.com//users.json?print=pretty';
    final response = await http.get(url); //LAKUKAN REQUEST DATA
    print(response);

    //JIKA STATUSNYA BERHASIL ATAU = 200
    if (response.statusCode == 200) {
      //MAKA KITA FORMAT DATANYA MENJADI MAP DENGNA KEY STRING DAN VALUE DYNAMIC
      final result = json.decode(response.body).cast<Map<String, dynamic>>();
      //KEMUDIAN MAPPING DATANYA UNTUK KEMUDIAN DIUBAH FORMATNYA SESUAI DENGAN EMPLOYEEMODEL DAN DIPASSING KE DALAM VARIABLE _DATA
      _data =
          result.map<UserModel>((json) => UserModel.fromJson(json)).toList();
      print(_data);
      return _data;
    } else {
      print('error');
      throw Exception();
    }
  }
}
