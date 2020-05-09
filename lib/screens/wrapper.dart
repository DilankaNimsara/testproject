import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testproject/screens/authenticate/authenticate.dart';
import 'package:testproject/screens/home/home.dart';
import 'package:testproject/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) { final user = Provider.of<User>(context);
   
    if (user == null) {
      return Authenticate();
    }else{
      return Home();
    }
  }
}
