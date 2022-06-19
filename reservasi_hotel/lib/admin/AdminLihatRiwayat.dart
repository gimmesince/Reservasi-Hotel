import 'package:flutter/material.dart';

class AdminLihatRiwayat extends StatelessWidget {
  const AdminLihatRiwayat({Key? key}) : super(key: key);

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
                  'List Riwayat User',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        )
      ]),
    );
  }
}
