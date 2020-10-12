import 'package:flutter_app/screens/cart/cartPage.dart';
import 'package:flutter_app/screens/home/homePage.dart';
import 'package:flutter_app/screens/profile/profilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/view_models/accounts_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/constants.dart' as Constants;
import '../../navigationDrawer.dart';

void main() {
  runApp(new MaterialApp(
    home: new AccountPage(),
    theme: ThemeData(
      primarySwatch: Colors.indigo,
    ),
  ));
}

class AccountPage extends StatefulWidget {
  final String email;
  final String password;

  AccountPage({Key key, @required this.email, this.password}) : super(key: key);

  @override
  AccountPageState createState() => new AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  List data;
  String _valMenu;
  List _menu = [
    Constants.ACCOUNT_EXPANDABLE_CONT,
    Constants.PROFILE_EXPANDABLE_CONT,
    Constants.REWARDS_EXPANDABLE_CONT,
    Constants.ADDRESSES_EXPANDABLE_CONT,
    Constants.PURCHASE_EXPANDABLE_CONT,
    Constants.PAYMENT_EXPANDABLE_CONT,
    Constants.LIST_EXPANDABLE_CONT,
    Constants.AUTODELIVER_EXPANDABLE_CONT
  ];

  String email = '';
  String userName = '';
  String name = '';
  String firstName = '';
  String lastName = '';

  /// instance SharedPreferences service
  Future<SharedPreferences> spService = SharedPreferences.getInstance();
  SharedPreferences sp;

  @override
  void initState() {
    super.initState();
    instanceSP();
    _validateUserLogin();
  }

  void instanceSP() async {
    sp = await spService;
  }

  void _validateUserLogin() async {
    List result =
        await AccountsViewModel().getAccounts().then((value) => value);
    var check = result
        .where((item) =>
            item.email == widget.email && item.password == widget.password)
        .toList();
    if (check.length == 1) {
      print(check);
      setState(() {
        email = check[0].email;
        userName = check[0].username;
        name = check[0].firstName + ' ' + check[0].lastName;
        firstName = check[0].firstName;
        lastName = check[0].lastName;
      });
    } else {
      print('login not valid: $check');
    }
  }

  String whichView = '';
  final _dropdown = [
    {'name': Constants.PROFILE_EXPANDABLE_CONT, 'viewVisible': false},
    {'name': Constants.ADDRESSES_EXPANDABLE_CONT, 'viewVisible': false},
    {'name': Constants.PURCHASE_EXPANDABLE_CONT, 'viewVisible': false},
    {'name': Constants.PAYMENT_EXPANDABLE_CONT, 'viewVisible': false},
    {'name': Constants.LIST_EXPANDABLE_CONT, 'viewVisible': false},
    {'name': Constants.AUTODELIVER_EXPANDABLE_CONT, 'viewVisible': false},
  ];

  void showWidget(int value) {
    print(value);
    int data = value;
    if (value == data) {
      setState(() {
        _dropdown[value]['viewVisible'] = !_dropdown[value]['viewVisible'];
      });
    }
  }

  Widget _myListView(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _dropdown.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey, width: 2.0),
                ),
              ),
              width: 320,
              height: 50,
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(_dropdown[index]['name'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w700)),
                    Icon(
                        _dropdown[index]['viewVisible'] == false
                            ? Icons.add
                            : Icons.remove,
                        color: Colors.black),
                  ],
                ),
                onPressed: () => showWidget(index),
                color: Colors.white,
              ),
            ),
            Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: _dropdown[index]['viewVisible'],
                child: Container(
                    height: _dropdown[index]['viewVisible'] == false ? 0 : 200,
                    width: 320,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0, left: 18),
                          child: Text(Constants.NAME_TEXT,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 13)),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 15.0, left: 18),
                          child: Text(name,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 13)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0, left: 18),
                          child: Text(Constants.USERNAME_TEXT,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 13)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.0, left: 18),
                          child: Text(userName,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 13)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0, left: 18),
                          child: Text(Constants.EMAIL_TEXT,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 13)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.0, left: 18),
                          child: Text(email,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 13)),
                        ),
                      ],
                    )))
          ],
        );
      },
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey[200],
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              children: <Widget>[
                Container(
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      hintText: Constants.SEARCH_TEXT,
                      hintStyle:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  width: 320,
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 2.0,
                    color: Colors.grey,
                  )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField(
                      value: _valMenu,
                      hint: Text(Constants.ACCOUNT_EXPANDABLE_CONT,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Colors.black)),
                      items: _menu.map((value) {
                        return DropdownMenuItem(
                          child: Text(value,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w800)),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _valMenu =
                              value; //Untuk memberitahu _valMenu bahwa isi nya akan diubah sesuai dengan value yang kita pilih
                        });
                        print(email);
                        if (value == Constants.PROFILE_EXPANDABLE_CONT) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ProfilePage(
                                nFirstName: firstName,
                                nLastName: lastName,
                                nEmail: email);
                          }));
                        }
                      },
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    color: Colors.white,
                    width: 320,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Image(
                              image: AssetImage('assets/my-gnc-rewards.png'),
                              width: 180,
                              height: 60),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 40, 30, 10),
                          child: Text(Constants.REWARD_TEXT,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(Constants.EARN_REWARD_TEXT,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(Constants.CASHBACK_REWARD_TEXT,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: RaisedButton(
                            color: Colors.red,
                            padding: EdgeInsets.fromLTRB(32.5, 15, 32.5, 15),
                            child: Text(Constants.JOIN_TEXT,
                                style: TextStyle(color: Colors.white)),
                            onPressed: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomePage();
                            })),
                          ),
                        )
                      ],
                    )),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: SizedBox(
                            height: 800.0, child: _myListView(context))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
