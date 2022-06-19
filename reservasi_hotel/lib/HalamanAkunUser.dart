import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservasi_hotel/auth.dart';
import 'package:reservasi_hotel/controller_firestore.dart';
import 'package:reservasi_hotel/main.dart';

class HalamanAkunUser extends StatelessWidget {
  HalamanAkunUser({Key? key}) : super(key: key);
  AuthController _authController = Get.put(AuthController());
  FirestoreController fsc = Get.find();
  AuthController auth = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 106, 104),
      body: ListView(children: [
        Column(
          children: [
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Akun Anda',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 30),
                )),
            Icon(
              Icons.person,
              color: Colors.white,
              size: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Nama : Edi Ramadhan",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 25))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text("Email : edi@gmail.com",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 25, ))
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}

Widget build(BuildContext context) {
  AuthController _authController = Get.put(AuthController());
  FirestoreController fsc = Get.find();
  AuthController authController = Get.find();
  return SingleChildScrollView(
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          FutureBuilder(
            future: fsc.users.value
                .where('userId', isEqualTo: authController.user.uid)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return displayUserInformation(context, snapshot);
              } else {
                return CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    ),
  );
}

Widget displayUserInformation(context, snapshot) {
  final user = snapshot.data;

  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Email: ${user.email ?? 'Anonymous'}",
          style: TextStyle(fontSize: 20),
        ),
      ),
    ],
  );
}
