import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testproject/models/brew.dart';
import 'package:testproject/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference dilankaCollection =
      Firestore.instance.collection("testusers");

  Future updateUserData(String sugars, String name, int strength) async {
    return await dilankaCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

//brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data['name'] ?? '', //doesnt hava a name print empty stream
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0',
      );
    }).toList();
  }

  //userdata from snapshot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength']
    );
  }

//get brews sream
  Stream<List<Brew>> get dila {
    return dilankaCollection.snapshots().map(_brewListFromSnapshot);
  }

//get user doc stream

  Stream<UserData> get userData {
    return dilankaCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }
}
