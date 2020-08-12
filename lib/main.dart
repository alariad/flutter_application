import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/screens.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder> {
          '/SignIn': (BuildContext context) => SignIn(),
          '/SignUp' : (BuildContext context) => SignUp(),
          '/Home' : (BuildContext context) => Home(),
//          '/Loading' : (BuildContext context) => Loading()
        },
        home: SignIn());

  }
}

