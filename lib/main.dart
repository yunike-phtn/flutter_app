import 'package:flutter/material.dart';
import 'package:flutter_app/routes/pageRoute.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/providers/user_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserProvider(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: Routes.login,
          routes: Routes.routes,
        ));
  }
}
