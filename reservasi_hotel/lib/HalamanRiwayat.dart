import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservasi_hotel/main.dart';

class HalamanRiwayat extends StatelessWidget {
  const HalamanRiwayat({Key? key}) : super(key: key);

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
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Anda Belum Melakukan Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Silahkan Login Terlebih Dahulu !!',
                style: TextStyle(
                    color: Colors.white, decoration: TextDecoration.underline),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
