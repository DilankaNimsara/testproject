import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: new HomePage1(),
    routes: <String, WidgetBuilder>{
      // "/": (BuildContext context) => new HomePage(),
      "/Secondpage": (BuildContext context) => new Secondpage()
    },
  ));
}

class Secondpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("second page"),
          backgroundColor: Colors.brown,
        ),
        body: new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new IconButton(
                    icon: Icon(Icons.home, color: Colors.blue),
                    iconSize: 70.0,
                    onPressed: () {Navigator.of(context).pushNamed("/");}
                    ),
                    new Text("Image")
              ],
            ),
          ),
        ));
  }
}
class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Home"),
          backgroundColor: Colors.brown,
        ),
        body: new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new IconButton(
                    icon: Icon(Icons.image, color: Colors.redAccent),
                    iconSize: 70.0,
                    onPressed: () {Navigator.of(context).pushNamed("/Secondpage");}
                    ),
                    new Text("Image")
              ],
            ),
          ),
        ));
  }
}


// class MyStatelessWidget extends StatelessWidget{
// @override
// Widget build(BuildContext context){
//   return new Scaffold(
// appBar: new AppBar(title: new Text("Signup"),),
// body: new Container(
//   child: new Center(
//     child: new Column(
//       children: <Widget>[
//         new Text("Dilanka Nimsara"),
//         new RaisedButton(
//           color: Colors.blue,
//           child: Text("Submit"),
//           onPressed: null)
//       ],
//     ),
//   ),
// //   padding: EdgeInsets.all(0.0),
// //   child: new Column(
// //     crossAxisAlignment: CrossAxisAlignment.stretch,
// //     children: <Widget>[
// //       new Mycard(
// //         title: new Text("Dilanka"),
// //         icon: new Icon(Icons.favorite),
// //       ),
// //       new Mycard(
// //         title: new Text("Nimsara"),
// //         icon: new Icon(Icons.feedback),
// //       ),

// //     ],),
// ),
//   );
// }
// }

// class Mycard extends StatelessWidget{
//   Mycard({this.title,this.icon});
//   final Widget title;
//   final Widget icon;
//   @override
//   Widget build(BuildContext context){
//     return new Container(
//       padding: EdgeInsets.only(bottom:1.0),
//       child: new Card(
//         child: new Column(
//           children: <Widget>[
//             this.title,
//             this.icon
//           ],
//         ),
//       ),
//     );
//   }
// }
