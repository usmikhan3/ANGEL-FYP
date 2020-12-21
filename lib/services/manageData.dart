import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:pizzato/providers/authentication.dart';
import 'package:pizzato/screens/splash_screen.dart';
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

<<<<<<< HEAD
  Future deleteData(BuildContext context)  {
    return FirebaseFirestore.instance
        .collection('myOrders')
        .doc(Provider.of<Authentication>(context, listen: false).getUid == null
        ? userUid
        : Provider.of<Authentication>(context, listen: false).getUid)
=======
  Future deleteData(BuildContext context) async {
    return FirebaseFirestore.instance
        .collection('myOrders')
        .doc(Provider.of<Authentication>(context, listen: false).getUid == null
            ? userUid
            : Provider.of<Authentication>(context, listen: false).getUid)
>>>>>>> 4d8b76ed2594317a0bc20d12fb7589048c931ee0
        .delete();
  }
}
