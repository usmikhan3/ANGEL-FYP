import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';



class ManageData extends ChangeNotifier{


  Future<void> fetchData(String collection) async{
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      QuerySnapshot querySnapshot = await firebaseFirestore.collection(collection).get();
      return querySnapshot.docs;
  }
}