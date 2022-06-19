import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservasi_hotel/Admin/AdminCrudKamar.dart';
import 'package:reservasi_hotel/Admin/AdminLihatAkunUser.dart';
import 'package:reservasi_hotel/Admin/AdminLihatRiwayat.dart';
import 'package:reservasi_hotel/landingPage.dart';
import 'package:reservasi_hotel/main.dart';

class AdminNavigasi extends StatefulWidget {
  const AdminNavigasi({Key? key}) : super(key: key);

  @override
  State<AdminNavigasi> createState() => _AdminNavigasiState();
}

class _AdminNavigasiState extends State<AdminNavigasi> {
  int Halaman = 0;

  void _NavBarDitekan(int index) {
    setState(() {
      Halaman = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final listHalaman = [
      AdminDashboard(),
      AdminCrudKamar(),
      AdminLihatRiwayat(),
      AdminLihatAkunUser(),
    ];

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.red,
            ),
            onPressed: () => submitLogout(
              context,
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Image(
          image: AssetImage("pict/logo.png"),
          width: 90,
        ),
      ),
      body: listHalaman[Halaman],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: Halaman,
          onTap: _NavBarDitekan,
          unselectedItemColor: Color(0xFFB7B7B7),
          selectedItemColor: Color.fromARGB(255, 254, 106, 104),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: "Dashboard"),
            BottomNavigationBarItem(
                icon: Icon(Icons.meeting_room), label: "Kamar"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "Transaksi"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Akun"),
          ]),
    );
  }
}

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 254, 106, 104),
        body: Column(
          children: [
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Selamat Datang Admin Hotel !!',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ));
  }
}

void submitLogout(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: Text("Peringatan"),
    content: Container(
      child: Text("Anda Ingin Log-Out ?"),
    ),
    actions: [
      TextButton(child: Text('Ya'), onPressed: () => Get.off(LandingPage())),
      TextButton(child: Text('Tidak'), onPressed: () => {Get.back()})
    ],
  );

  showDialog(context: context, builder: (context) => alert);
  return;
}
