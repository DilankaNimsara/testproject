import 'package:flutter/material.dart';
import 'package:testproject/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:testproject/service/auth.dart';
import 'package:testproject/models/user.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
