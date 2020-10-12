import 'package:flutter/material.dart';
import 'package:flutter_app/navigationDrawer.dart';
import 'package:flutter_app/screens/cart/cartPage.dart';
import 'package:flutter_app/screens/profile/profilePage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/providers/user_provider.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.menu),
                  onPressed: () => _scaffoldKey.currentState.openDrawer(),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.place, color: Colors.grey),
                  onPressed: () {},
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 5, 40, 10),
                  child: Image(
                      image: AssetImage('assets/primary-logo.png'),
                      width: 120,
                      height: 40),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(35, 0, 0, 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CartPage();
                        }));
                      },
                      icon: Icon(Icons.add_shopping_cart),
                    ))
              ],
            ),
          ),
          drawer: NavigationDrawer(),
          body: RefreshIndicator(
            //ADAPUN FUNGSI YANG DIJALANKAN ADALAH getUser() DARI EMPLOYEE_PROVIDER
            onRefresh: () =>
                Provider.of<UserProvider>(context, listen: false).getUser(),
            color: Colors.red,
            child: Container(
              margin: EdgeInsets.all(10),
              //KETIKA PAGE INI DIAKSES MAKA AKAN MEMINTA DATA KE API
              child: FutureBuilder(
                //DENGAN MENJALANKAN FUNGSI YANG SAMA
                future:
                    Provider.of<UserProvider>(context, listen: false).getUser(),
                builder: (context, snapshot) {
                  //JIKA PROSES REQUEST MASIH BERLANGSUNG
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    //MAKA KITA TAMPILKAN INDIKATOR LOADING
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  //SELAIN ITU KITA RENDER ATAU TAMPILKAN DATANYA
                  //ADAPUN UNTUK MENGAMBIL DATA DARI STATE DI PROVIDER
                  //MAKA KITA GUNAKAN CONSUMER
                  return Consumer<UserProvider>(
                    builder: (context, data, _) {
                      //KEMUDIAN LOOPING DATANYA DENGNA LISTVIEW BUILDER
                      return ListView.builder(
                        //ADAPUN DATA YANG DIGUNAKAN ADALAH REAL DATA DARI GETTER dataUser
                        itemCount: data.dataUser.length,
                        itemBuilder: (context, i) {
                          return Card(
                            elevation: 8,
                            child: ListTile(
                              title: Text(
                                //DAN DATA YANG DITAMPILKAN JG DIAMBIL DARI GETTER DATAEMPLOYEE
                                //SESUAI INDEX YANG SEDANG DILOOPING
                                data.dataUser[i].username,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('Umur: ${data.dataUser[i].email}'),
                              trailing: Text("\$${data.dataUser[i].password}"),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ));
  }
}
