import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pizzato/providers/authentication.dart';
import 'package:provider/provider.dart';

class ManageData extends ChangeNotifier {
  Future<void> fetchData(String collection) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection(collection).get();
    return querySnapshot.docs;
  }

  Future submitData(BuildContext context, dynamic data) async {
    return FirebaseFirestore.instance
        .collection('myOrders')
        .doc(Provider.of<Authentication>(context, listen: false).getUid)
        .set(data);
  }
}
