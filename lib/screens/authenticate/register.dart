import 'package:flutter/material.dart';
import 'package:testproject/service/auth.dart';
import 'package:testproject/shared/constants.dart';
import 'package:testproject/shared/lording.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return loading ? Loading():  Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: new AppBar(
        title: new Text("Sign up"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: new Text("Sign in"),
              onPressed: () {
                widget.toggleView();
              })
        ],
      ),
      body: new Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Form(
                key: _formKey,
                child: new Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Enter your Email'),
                      validator: (val) =>
                          val.isEmpty ? 'Enter your email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Enter your password'),
                      validator: (val) => val.length < 6
                          ? 'Your password should mare than six characters'
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                        color: Colors.pink[300],
                        child: new Text(
                          "Register",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .registerWithEmailandpassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Plese enter a valid email';
                                loading = false;
                              });
                              // setState(() => error = 'Plese enter a valid email');
                            }
                          }
                        }),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ],
                )),

            // child: RaisedButton(
            //   child: new Text("Sign in anon"),
            //   onPressed: () async{
            //     dynamic result = await _auth.signInAnon();
            //     if(result==null){
            //       print("Error Signing in");
            //     }else{
            //       print("signed in");
            //       print(result.uid);
            //     }
            //   }
            //   ),
          ],
        ),
      ),
    );
  }
}
