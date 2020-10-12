import 'package:flutter/material.dart';
import 'package:flutter_app/screens/account/accountPage.dart';
import 'package:flutter_app/screens/cart/cartPage.dart';
import '../../widgets/textFormFieldWidget.dart';
import '../../constants/constants.dart' as Constants;
import '../../navigationDrawer.dart';
import 'package:flutter_app/widgets/dropdownWidget.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatefulWidget {
  final String nEmail;
  final String nFirstName;
  final String nLastName;

  ProfilePage({Key key, @required this.nEmail, this.nFirstName, this.nLastName})
      : super(key: key);
  // This widget is the root of your application.
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController emailController;
  TextEditingController address1Controller;
  TextEditingController address2Controller;
  TextEditingController cityController;
  TextEditingController zipCodeController;
  TextEditingController phoneController;

  @override
  void initState() {
    print(widget.nFirstName);
    firstNameController = TextEditingController(text: widget.nFirstName);
    lastNameController = TextEditingController(text: widget.nLastName);
    emailController = TextEditingController(text: widget.nEmail);
    address1Controller = TextEditingController();
    address2Controller = TextEditingController();
    cityController = TextEditingController();
    zipCodeController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

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

  String _valCountry;
  List _country = [
    Constants.USA,
    Constants.UK,
    Constants.GER,
    Constants.INA,
    Constants.TH,
    Constants.SKR,
    Constants.CN,
    Constants.JPN,
  ];

  String _valState;
  List _state = [
    'CA',
    'FL',
    'UT',
    'NY',
    'TN',
    'HI',
  ];

  String _valMonth;
  List month = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];

  String _valDate;
  List date = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31'
  ];

  String _valYear;
  List year = [
    '1991',
    '1992',
    '1993',
    '1994',
    '1995',
    '1996',
    '1997',
    '1998',
    '1999',
    '2000',
    '2001',
    '2002'
  ];

  String _valGender;
  List gender = ['Mr.', 'Miss', 'Mrs.'];

  Widget _buildFirstName() {
    return TextFormFieldWidget(
      hintText: Constants.FIRST_NAME_TEXT,
      labelText: Constants.FIRST_NAME_TEXT + '*',
      obscureText: false,
      radius: 0,
      textInputType: TextInputType.visiblePassword,
      actionKeyboard: TextInputAction.done,
      functionValidate: commonValidation,
      controller: firstNameController,
      onSubmitField: () {},
      focusedBorderColor: Colors.green,
      enabledBorderColor: Colors.black,
    );
  }

  Widget _buildLastName() {
    return TextFormFieldWidget(
      hintText: Constants.LAST_NAME_TEXT,
      labelText: Constants.LAST_NAME_TEXT + '*',
      obscureText: false,
      radius: 0,
      textInputType: TextInputType.visiblePassword,
      actionKeyboard: TextInputAction.done,
      functionValidate: commonValidation,
      controller: lastNameController,
      onSubmitField: () {},
      focusedBorderColor: Colors.green,
      enabledBorderColor: Colors.black,
    );
  }

  Widget _buildEmail() {
    return TextFormFieldWidget(
      hintText: Constants.EMAIL_PLACEHOLDER,
      labelText: Constants.EMAIL_PLACEHOLDER,
      obscureText: false,
      radius: 0,
      textInputType: TextInputType.visiblePassword,
      actionKeyboard: TextInputAction.done,
      functionValidate: commonValidation,
      controller: emailController,
      onSubmitField: () {},
      emptyValidate: Constants.ERROR_EMAIL_EMPTY,
      regxValidate: Constants.ERROR_INVALID_EMAIL,
      focusedBorderColor: Colors.green,
      enabledBorderColor: Colors.black,
    );
  }

  Widget _buildAddress1() {
    return TextFormFieldWidget(
      hintText: Constants.HINT_ADDRESS,
      labelText: Constants.LABEL_ADDRESS1,
      obscureText: false,
      radius: 0,
      textInputType: TextInputType.visiblePassword,
      actionKeyboard: TextInputAction.done,
      functionValidate: commonValidation,
      controller: address1Controller,
      onSubmitField: () {},
      focusedBorderColor: Colors.green,
      enabledBorderColor: Colors.black,
    );
  }

  Widget _buildAddress2() {
    return TextFormFieldWidget(
      hintText: Constants.HINT_ADDRESS,
      labelText: Constants.LABEL_ADDRESS2,
      obscureText: false,
      radius: 0,
      textInputType: TextInputType.visiblePassword,
      actionKeyboard: TextInputAction.done,
      functionValidate: commonValidation,
      controller: address2Controller,
      onSubmitField: () {},
      focusedBorderColor: Colors.green,
      enabledBorderColor: Colors.black,
    );
  }

  Widget _buildCity() {
    return TextFormFieldWidget(
      hintText: Constants.HINT_CITY,
      labelText: Constants.LABEL_CITY,
      obscureText: false,
      radius: 0,
      textInputType: TextInputType.visiblePassword,
      actionKeyboard: TextInputAction.done,
      functionValidate: commonValidation,
      controller: cityController,
      onSubmitField: () {},
      focusedBorderColor: Colors.green,
      enabledBorderColor: Colors.black,
    );
  }

  Widget _buildZipCode() {
    return TextFormFieldWidget(
      hintText: Constants.HINT_ZIPCODE,
      labelText: Constants.LABEL_ZIPCODE,
      obscureText: false,
      radius: 0,
      textInputType: TextInputType.visiblePassword,
      actionKeyboard: TextInputAction.done,
      functionValidate: commonValidation,
      controller: zipCodeController,
      onSubmitField: () {},
      focusedBorderColor: Colors.green,
      enabledBorderColor: Colors.black,
    );
  }

  Widget _buildPhone() {
    return TextFormFieldWidget(
      hintText: Constants.HINT_PHONE,
      labelText: Constants.LABEL_PHONE,
      obscureText: false,
      radius: 0,
      textInputType: TextInputType.visiblePassword,
      actionKeyboard: TextInputAction.done,
      functionValidate: commonValidation,
      controller: phoneController,
      onSubmitField: () {},
      focusedBorderColor: Colors.green,
      enabledBorderColor: Colors.black,
    );
  }

  Widget _buildDropdownCountry() {
    return DropDownWidget(
        hintText: Constants.USA,
        width: 400,
        height: 60,
        filled: true,
        fillColor: Colors.white,
        value: _valCountry,
        labelText: Constants.LABEL_COUNTRY,
        items: _country,
        onChanged: (value) {
          setState(
            () {
              _valCountry = value;
            },
          );
        });
  }

  Widget _buildDropdownState() {
    return DropDownWidget(
        hintText: Constants.STATE_DROPDOWN,
        width: 400,
        height: 60,
        filled: true,
        fillColor: Colors.white,
        value: _valState,
        labelText: Constants.LABEL_STATE,
        items: _state,
        onChanged: (value) {
          setState(
            () {
              _valState = value;
            },
          );
        });
  }

  Widget _buildDropdownMonth() {
    return DropDownWidget(
        hintText: '00',
        width: 120,
        height: 60,
        filled: true,
        fillColor: Colors.white,
        value: _valMonth,
        labelText: Constants.MONTH_TEXT,
        items: month,
        onChanged: (value) {
          setState(
            () {
              _valMonth = value;
            },
          );
        });
  }

  Widget _buildDropdownDate() {
    return DropDownWidget(
        hintText: '00',
        width: 120,
        height: 60,
        filled: true,
        fillColor: Colors.white,
        value: _valDate,
        labelText: Constants.DATE_TEXT,
        items: date,
        onChanged: (value) {
          setState(
            () {
              _valDate = value;
            },
          );
        });
  }

  Widget _buildDropdownYear() {
    return DropDownWidget(
        hintText: '0000',
        width: 120,
        height: 60,
        filled: true,
        fillColor: Colors.white,
        value: _valYear,
        labelText: Constants.YEAR_TEXT,
        items: year,
        onChanged: (value) {
          setState(
            () {
              _valYear = value;
            },
          );
        });
  }

  Widget _buildDropdownGender() {
    return DropDownWidget(
        hintText: Constants.GENDER_TEXT,
        width: 400,
        height: 60,
        filled: true,
        fillColor: Colors.white,
        value: _valGender,
        labelText: Constants.GENDER_TEXT,
        items: gender,
        onChanged: (value) {
          setState(
            () {
              _valGender = value;
            },
          );
        });
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
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    color: Colors.grey[200],
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
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
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              width: 320,
                              height: 45,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                width: 2.0,
                                color: Colors.grey,
                              )),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    value: _valMenu,
                                    dropdownColor: Colors.white,
                                    hint: Text(
                                        Constants.PROFILE_EXPANDABLE_CONT,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black)),
                                    items: _menu.map((value) {
                                      return DropdownMenuItem(
                                        child: Text(value,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800)),
                                        value: value,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _valMenu =
                                            value; //Untuk memberitahu _valMenu bahwa isi nya akan diubah sesuai dengan value yang kita pilih
                                      });
                                      if (value ==
                                          Constants.ACCOUNT_EXPANDABLE_CONT)
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return AccountPage();
                                        }));
                                    }),
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 35.0),
                              child: Text(Constants.EDIT_ECCOUNT_TEXT,
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey[700]))),
                          Container(
                            padding: EdgeInsets.only(bottom: 15.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 4.0, color: Colors.grey))),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(Constants.CAPS_NAME_TEXT,
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 27.0, left: 5.0),
                                  child: Text(Constants.REQUIRED_TEXT,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[700])),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                            child: _buildFirstName(),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                            child: _buildLastName(),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 15.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 4.0, color: Colors.grey))),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(Constants.EMAIL_LOGIN_INFO,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 27.0, left: 5.0),
                                  child: Text(Constants.REQUIRED_TEXT,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[700])),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                            child: _buildEmail(),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 15.0),
                            margin: EdgeInsets.only(bottom: 30),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 4.0, color: Colors.grey))),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(Constants.ADDRESS_TEXT,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 27.0, left: 5.0),
                                  child: Text(Constants.REQUIRED_TEXT,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[700])),
                                ),
                              ],
                            ),
                          ),
                          _buildDropdownCountry(),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                            child: _buildAddress1(),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                            child: _buildAddress2(),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                            margin: const EdgeInsets.only(bottom: 20),
                            child: _buildCity(),
                          ),
                          _buildDropdownState(),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                            child: _buildZipCode(),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                            child: _buildPhone(),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 3.0, bottom: 10.0),
                            child: Text(Constants.EXAMPLE_PHONE,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500)),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 15.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 4.0, color: Colors.grey))),
                            child: Container(
                              width: 400,
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(Constants.MYGNC_REWARDS,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 15.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 20.0, right: 5.0),
                                    padding: EdgeInsets.only(right: 10.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                width: 4.0,
                                                color: Colors.red))),
                                    child: Image(
                                        image: AssetImage(
                                            'assets/my-gnc-rewards.png'),
                                        width: 150,
                                        height: 85),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 8.0, bottom: 5.0),
                                          width: 200,
                                          child: Text(Constants.REWARD_TEXT,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.red)),
                                        ),
                                        Container(
                                          width: 200,
                                          child: Text(Constants.EARN_TEXT2,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.red)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Text(Constants.REWARD_PROGRAM,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(Constants.SIGN_REWARD,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(Constants.ENROLL_REWARD,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400)),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 15.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 4.0, color: Colors.grey))),
                            child: Container(
                              width: 400,
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(Constants.ABOUT_YOU,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black)),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 20.0),
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Text(Constants.BIRTHDAY_TEXT,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildDropdownMonth(),
                              _buildDropdownDate(),
                              _buildDropdownYear(),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 3.0, bottom: 10.0),
                            margin: const EdgeInsets.only(bottom: 30),
                            child: Text(Constants.GNC_BIRTHDAY_GIFT,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500)),
                          ),
                          _buildDropdownGender(),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: RaisedButton(
                                color: Colors.red,
                                padding: EdgeInsets.fromLTRB(45, 15, 45, 15),
                                child: Text(Constants.PROFILE_APPLY_BUTTON,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                onPressed: () => Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return CartPage();
                                })),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(
                                    5.0, 20.0, 0, 70.0),
                                padding: EdgeInsets.only(right: 10.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 2.0, color: Colors.grey))),
                                child: Text(Constants.TERMS_CONDITIONS,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red)),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(
                                    10.0, 20.0, 10.0, 70.0),
                                child: Text(Constants.GNC_FAQ,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red)),
                              ),
                            ],
                          ),
                        ])))));
  }
}
