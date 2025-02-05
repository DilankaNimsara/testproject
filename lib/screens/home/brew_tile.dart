import 'package:flutter/material.dart';
import 'package:testproject/models/brew.dart';

class BreTile extends StatelessWidget {

final Brew brew;
BreTile({this.brew});

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: EdgeInsets.only(top:8.0),
     child: Card(
       margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
       child: ListTile(
         leading: CircleAvatar(
           radius: 25.0,
           backgroundColor: Colors.deepPurple[brew.strength] ,
           backgroundImage: AssetImage('assets/cup.png'),
         ),
         title: Text(brew.name),
         subtitle: Text('Takes ${brew.sugars} sugar(s)'),
       ),
     ),
   );
  }
}