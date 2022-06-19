import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservasi_hotel/HalamanAkunUser.dart';
import 'package:reservasi_hotel/HalamanHome.dart';
import 'package:reservasi_hotel/HalamanLogin.dart';
import 'package:reservasi_hotel/HalamanRiwayat.dart';
import 'package:reservasi_hotel/HalamanRiwayat2.dart';
import 'package:reservasi_hotel/ctrl/splashScreen.dart';
import 'package:reservasi_hotel/landingPage.dart';


final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    navigatorKey: navigatorKey,
  ));
}






class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashScreenController spc = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("pict/Splash Screen.png"),
        fit: BoxFit.cover,
        scale: 2,
      )),
    ));
  }
}

class Navigasi extends StatefulWidget {
  int Halaman = 0;
  bool StatusLogin = false;
  Navigasi({Key? key, required this.Halaman, required this.StatusLogin})
      : super(key: key);

  @override
  State<Navigasi> createState() =>
      _NavigasiState(Halaman: Halaman, StatusLogin: StatusLogin);
}

class _NavigasiState extends State<Navigasi> {
  int Halaman = 0;
  bool StatusLogin = false;
  _NavigasiState({Key? key, required this.Halaman, required this.StatusLogin});

  // ignore: non_constant_identifier_names
  void _NavBarDitekan(int index) {
    setState(() {
      Halaman = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Icon IKKON = Icon(Icons.person);

    List listHalaman = [
      HalamanHome(),
      HalamanRiwayat(),
      HalamanLogin(),
    ];
    if (StatusLogin == true) {
      setState(() {
        listHalaman[1] = HalamanRiwayat2();
        listHalaman[2] = HalamanAkunUser();
        IKKON = Icon(Icons.logout);
      });
    } else if (StatusLogin == false) {
      setState(() {
        listHalaman[1] = HalamanRiwayat();
        listHalaman[2] = HalamanLogin();
        IKKON = Icon(Icons.person);
      });
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: IKKON,
            color: Colors.red,
            onPressed: () => {
              if (StatusLogin == true)
                {
                  submitLogout(
                    context,
                  ),
                }
            },
          ),
        ],
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
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "Transaksi"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Akun"),
          ]),
    );
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
