import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    try {
      return await FirebaseFirestore.instance
          .collection("User")
          .doc(id)
          .set(userInfoMap);
    } catch (e) {
      print("Error adding user details: $e"); // Log the error
      throw e; // Re-throw the error for further handling if necessary
    }
  }

  Future<Stream<QuerySnapshot>> getUserDetails() async {
    return await FirebaseFirestore.instance.collection("User").snapshots();
  }
}
