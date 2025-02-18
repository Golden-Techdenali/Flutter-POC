import 'package:first_flutter/consts/consts.dart';

class FirestoreServices {

//get user data
  static getUser(uid) {
    return firestore.collection(usersCollection).where('id', isEqualTo: uid).snapshots();
  }

  //get products according to category
  static getProducts(category) {
    return firestore.collection(productsCollection).where('p_category', isEqualTo: category).snapshots();
  }

  //get cart
  static getCart(uid) {
    return firestore.collection(cartCollection).where('added_by', isEqualTo: uid).snapshots();
  }

  //delete item
  static deleteDocument(docId) {
    return firestore.collection(cartCollection).doc(docId).delete();
  }

}