import 'package:flutter/material.dart';
import 'package:testproject/models/user.dart';
import 'package:testproject/service/database.dart';
import 'package:testproject/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String _currantName;
  String _currantSugars;
  int _currantStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;

          if (snapshot.hasData) {
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    "Update your brew Settings",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) {
                      setState(() => _currantName = val);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  // drop down
                  DropdownButtonFormField(
                    decoration: textInputDecoration,
                    value: _currantSugars ?? userData.sugars,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text('$sugar sugars'),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() => _currantSugars = val);
                    },
                  ),
                  Slider(

                    value: (_currantStrength ?? userData.strength).toDouble(),
                    activeColor: Colors.blueGrey[_currantStrength ?? 100],
                    inactiveColor: Colors.blueGrey[_currantStrength ?? 100],
                    min: 100.0,
                    max: 900.0,
                    divisions: 8,
                    onChanged: (val) {
                      setState(() => _currantStrength = val.round());
                    },
                  ),
                  RaisedButton(
                      color: Colors.pink[300],
                      child: new Text(
                        "Update",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currantSugars ?? userData.sugars,
                              _currantName ?? userData.name,
                              _currantStrength ?? userData.strength);
                          Navigator.pop(context);
                        }
                        // print(_currantName);
                        // print(_currantSugars);
                        // print(_currantStrength);
                      }),
                ],
              ),
            );
          }
        });
  }
}
