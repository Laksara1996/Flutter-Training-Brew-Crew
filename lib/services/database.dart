import 'package:brewcrew/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/brew.dart';

class DatabaseService {

  final String uid;

  DatabaseService({this.uid});

  //Collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  //brew list from snapshot
  List<Brew> _brewListFromSnapSHot (QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return Brew(
      name: doc.data['name'] ?? '',
      sugars: doc.data['sugars'] ?? '0',
      strength: doc.data['strength'] ?? 0
      );
    }).toList();
  }

  //get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
    .map(_brewListFromSnapSHot);
  }

}