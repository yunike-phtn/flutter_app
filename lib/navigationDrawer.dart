import 'package:flutter/material.dart';
import 'constants/constants.dart' as Constants;
import 'widgets/createDrawerHeader.dart';
import 'widgets/createDrawerBodyItem.dart';

void main() {
  runApp(NavigationDrawer());
}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(icon: Icons.home, text: 'Home'),
          createDrawerBodyItem(icon: Icons.account_circle, text: 'Account'),
          createDrawerBodyItem(icon: Icons.person, text: 'Profile'),
          createDrawerBodyItem(icon: Icons.shopping_cart, text: 'Cart'),
          Divider(),
          createDrawerBodyItem(
              icon: Icons.notifications_active, text: 'Notifications'),
          createDrawerBodyItem(icon: Icons.contact_phone, text: 'Contact Info'),
          ListTile(
            title: Text('App version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
