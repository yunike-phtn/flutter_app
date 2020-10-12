import 'package:flutter/material.dart';
import 'package:flutter_app/navigationDrawer.dart';
import '../../constants/constants.dart' as Constants;

void main() {
  runApp(CartPage());
}

class CartPage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            color: Colors.grey[200],
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.search, color: Colors.grey),
                                border: InputBorder.none,
                                hintText: Constants.SEARCH_TEXT,
                                hintStyle: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w500),
                              ),
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ),
                          Center(
                              child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 70.0, bottom: 10.0),
                                child: Text('Your Cart is Empty',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700)),
                              ),
                              FlatButton(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.chevron_left,
                                          color: Colors.black),
                                      Text('BACK TO SHOPPING',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 28.0, bottom: 500),
                                child: Image(
                                    image:
                                        AssetImage('assets/icon-cart-red.png'),
                                    width: 220,
                                    height: 80),
                              ),
                            ],
                          )),
                        ])))));
  }
}
