import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testproject/models/brew.dart';
import 'package:testproject/screens/home/brew_tile.dart';

class DilaList extends StatefulWidget {
  @override
  _DilaListState createState() => _DilaListState();
}

class _DilaListState extends State<DilaList> {
  @override
  Widget build(BuildContext context) {
    final dila = Provider.of<List<Brew>>(context) ?? [];
    // print(dila.documents);
    // dila.forEach((dn) {
    //   print(dn.name);
    //   print(dn.sugars);
    //   print(dn.strength);
    // });

  return ListView.builder(
    itemCount: dila.length,
    itemBuilder: (context, index){
      return BreTile(brew : dila[index]);
    }
    );

  }
}
