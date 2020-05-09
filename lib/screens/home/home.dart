import 'package:flutter/material.dart';
import 'package:testproject/screens/home/settings_form.dart';
import 'package:testproject/service/auth.dart';
import 'package:testproject/service/database.dart';
import 'package:provider/provider.dart';
import 'package:testproject/screens/home/dilanka_list.dart';
import 'package:testproject/models/brew.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().dila,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: new AppBar(
          title: new Text("Dilanka"),
          elevation: 0.0,
          backgroundColor: Colors.brown[400],
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: new Text("Logout"),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              onPressed: () => showSettingsPanel(),
              icon: Icon(Icons.settings),
              label: Text("Settings"),
            )
          ],
        ),
        // body: DilaList(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/cc.jpg'),
              fit: BoxFit.cover,
            )
          ),
          child: DilaList(),
        ),
      ),
    );
  }
}
