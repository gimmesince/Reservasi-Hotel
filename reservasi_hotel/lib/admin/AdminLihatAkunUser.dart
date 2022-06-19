import 'package:flutter/material.dart';

class AdminLihatAkunUser extends StatelessWidget {
  const AdminLihatAkunUser({Key? key}) : super(key: key);

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
                  'List Akun User',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        )
      ]),
    );
  }
}
