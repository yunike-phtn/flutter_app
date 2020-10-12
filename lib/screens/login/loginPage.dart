import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/screens/account/accountPage.dart';
import '../../constants/constants.dart' as Constants;
import '../../widgets/textFormFieldWidget.dart';
import '../../navigationDrawer.dart';

void main() {
  //to make potrait screen only
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(LoginPage());
  });
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

final _formKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  String nEmail, nPassword;

  Widget _buildPassword() {
    return TextFormFieldWidget(
      hintText: Constants.PASSWORD_PLACEHOLDER,
      labelText: Constants.PASSWORD_PLACEHOLDER,
      obscureText: true,
      maxLength: 12,
      radius: 10,
      textInputType: TextInputType.visiblePassword,
      actionKeyboard: TextInputAction.done,
      functionValidate: commonValidation,
      controller: pwdController,
      onSubmitField: () {},
      emptyValidate: Constants.ERROR_PASSWORD_EMPTY,
      regxValidate: Constants.ERROR_INVALID_PASSWORD,
    );
  }

  Widget _buildEmail() {
    return TextFormFieldWidget(
      hintText: Constants.EMAIL_PLACEHOLDER,
      labelText: Constants.EMAIL_PLACEHOLDER,
      obscureText: false,
      maxLength: 256,
      radius: 10,
      textInputType: TextInputType.visiblePassword,
      actionKeyboard: TextInputAction.done,
      functionValidate: commonValidation,
      controller: emailController,
      onSubmitField: () {},
      emptyValidate: Constants.ERROR_EMAIL_EMPTY,
      regxValidate: Constants.ERROR_INVALID_EMAIL,
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            title: Image(
                image: AssetImage('assets/primary-logo.png'),
                width: 120,
                height: 40),
          ),
          drawer: NavigationDrawer(),
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(Constants.LOGIN_SCREEN_TITLE,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(Constants.REQUIRED_TEXT,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Text(Constants.LOGIN_SCREEN_TEXT1,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700)),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: _buildEmail(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: _buildPassword(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  color: Colors.red,
                                  padding:
                                      EdgeInsets.fromLTRB(62.5, 15, 62.5, 15),
                                  child: Text(Constants.LOGIN_TEXT,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white)),
                                  onPressed: () {
                                    nEmail = emailController.text;
                                    nPassword = pwdController.text;

                                    if (_formKey.currentState.validate()) {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return AccountPage(
                                          email: nEmail,
                                          password: nPassword,
                                        );
                                      }));
                                      return false;
                                    }
                                  }),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return AccountPage();
                                    }));
                                  },
                                  padding: EdgeInsets.all(0),
                                  child: Text(Constants.FORGOT_PASSWORD_TEXT,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.cyan[700]))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(Constants.REGISTER_NEW_CUST,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 20.0, right: 20.0),
                          child: Text(Constants.NEW_ACCOUNT_TEXT,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40.0),
                          child: OutlineButton(
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AccountPage();
                                }));
                              },
                              borderSide: BorderSide(color: Colors.red),
                              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(Constants.CREATE_ACCOUNT_TEXT,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.pink,
                                      fontWeight: FontWeight.w700))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child: Text(Constants.LOGIN_SCREEN_TEXT2,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(Constants.LOGIN_SCREEN_TEXT3,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 30.0, right: 20.0),
                          child: Text(Constants.LOGIN_SCREEN_TEXT4,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(Constants.LOGIN_SCREEN_TEXT5,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 30.0, right: 20.0),
                          child: Text(Constants.LOGIN_SCREEN_TEXT6,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(Constants.LOGIN_SCREEN_TEXT7,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 30.0, right: 20.0),
                          child: Text(Constants.LOGIN_SCREEN_TEXT8,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
