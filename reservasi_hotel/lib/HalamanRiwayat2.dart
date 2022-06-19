import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservasi_hotel/main.dart';

class HalamanRiwayat2 extends StatelessWidget {
  const HalamanRiwayat2({Key? key}) : super(key: key);

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
                  'Transaksi Anda',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 30),
                )),
            SizedBox(
              height: 80,
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Anda Belum Pernah Melakukan Transaksi',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                )),
          ],
        )
      ]),
    );
  }
}
