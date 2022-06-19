import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreController extends GetxController {
  // Disini kita membuat collection (atau Table) bernama users
  var hotel = FirebaseFirestore.instance.collection("hotel").obs;
  var users = FirebaseFirestore.instance.collection("pengguna").obs;
  var transaki = FirebaseFirestore.instance.collection("transaksi").obs;
}