import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reservasi_hotel/HalamanHome.dart';
import 'package:reservasi_hotel/HalamanLogin.dart';
import 'package:reservasi_hotel/admin/AdminDashboard.dart';
import 'package:reservasi_hotel/controller_firestore.dart';
import 'package:reservasi_hotel/main.dart';

class AuthController extends GetxController {
  RxBool isHiddenpassword = true.obs;
  FirestoreController fsc = Get.put(FirestoreController());
  String STAT = "Login Gagal";
  String STATADMIN = "Login Admin Gagal";
  late TextEditingController userID = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController ReguserID = TextEditingController();
  late TextEditingController Regpassword = TextEditingController();
  User? _user;

  User get user => _user ?? user;

  Future<void> register() async {
    try {
      final userCredentialData =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: ReguserID.text,
        password: Regpassword.text,
      );
      _user = userCredentialData.user;
      await isNewUser(_user) ? await addUser(_user) : print("Udah ada");
      Get.snackbar("Akun berhasil ditambahkan", "${(ReguserID.text)}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Eror", "Password Terlalu Sedikit");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
            "Eror", "Email Sudah di gunakan silahkan gunakan email yang lain");
      }
    } catch (e) {
      print(e);
    }
  }

  void setSTAT(ayam) {
    this.STAT = ayam;
  }

  String getSTAT() {
    return this.STAT;
  }

  void setSTATADMIN(ayam) {
    this.STATADMIN = ayam;
  }

  String getSTATADMIN() {
    return this.STATADMIN;
  }

  Future<void> login() async {
    try {
      if (userID.text.toString() == "admin_hotel@gmail.com" &&
          password.text.toString() == "admin_hotel") {
        print('berhasil Login dengan akun');
        setSTATADMIN("Login Admin Berhasil");
      } else {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userID.text,
          password: password.text,
        );
        print('berhasil Login dengan akun');
        setSTAT("Login Berhasil");
        _user = credential.user;
        await isNewUser(_user) ? await addUser(_user) : print("Udah ada");
      }

      Future<String> getCurrentUID() async {
        return (await FirebaseAuth.instance.currentUser!.uid);
      }

      Future getCurrentUser() async {
        return (await FirebaseAuth.instance.currentUser!.uid);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Email tidak ditemukan", "${(userID.text)}");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Password dengan  ${(userID.text)} tidak ditemukan",
            "Silahkan chek kembali password");
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    var akun = await FirebaseAuth.instance.signInWithCredential(credential);

    print(akun.user!.displayName);
    Get.snackbar(
        "berhasil login dengan akun", akun.user!.displayName.toString());

    return akun;
  }

  Future<bool> isNewUser(User? user) async {
    QuerySnapshot res =
        await fsc.users.value.where("email", isEqualTo: user!.email).get();
    final List<DocumentSnapshot> docs = res.docs;
    return docs.isEmpty ? true : false;
  }

  Future<void> addUser(User? user) async {
    fsc.users.value.doc(user!.uid).set({
      'email': user.email,
    });
  }
}
