import 'package:flutter/material.dart';
import 'package:reservasi_hotel/cardMenu.dart';

class HalamanHome extends StatefulWidget {
  HalamanHome({Key? key}) : super(key: key);

  @override
  State<HalamanHome> createState() => _HalamanHomeState();
}

class _HalamanHomeState extends State<HalamanHome> {
  List<String> urls = [
    "pict/hotel1.jpg",
    "pict/hotel2.jpg",
    "pict/hotel3.jpg",
    "pict/hotel4.jpg",
    "pict/hotel5.jpg",
    "pict/hotel6.jpg",
    "pict/hotel7.jpg",
    "pict/hotel8.jpg",
    "pict/hotel9.jpg",
    "pict/hotel10.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 106, 104),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Selamat Datang',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Pilih Hotel Anda',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  )),
              SizedBox(
                height: 20,
              ),
              Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(30.0),
                shadowColor: Color(0x55434343),
                child: TextField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      hintText: "Cari Hotel...",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black54,
                      ),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DefaultTabController(
                  length: 3,
                  child: Expanded(
                    child: Column(children: [
                      TabBar(
                          indicatorColor: Colors.white,
                          unselectedLabelColor: Color(0xFF5555555),
                          labelColor: Colors.white,
                          labelPadding: EdgeInsets.symmetric(horizontal: 8),
                          tabs: [
                            Tab(
                              text: "Trending",
                            ),
                            Tab(
                              text: "Terbaik",
                            ),
                            Tab(
                              text: "All Hotel",
                            ),
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 300,
                        child: TabBarView(
                          children: [
                            Container(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  CardMenu(
                                      context,
                                      urls[0],
                                      "OYO Townhouse 2",
                                      "Jl. Ahmad Yamin",
                                      5,
                                      "Diboking",
                                      "8,5",
                                      400000,
                                      "Supperior"),
                                  CardMenu(
                                      context,
                                      urls[2],
                                      "OYO Flagship 755 Appart",
                                      "Jl. Pramuka",
                                      3,
                                      "Tersedia",
                                      "8,5",
                                      500000,
                                      "VIP"),
                                  CardMenu(
                                      context,
                                      urls[6],
                                      "OYO 258 The Enviro",
                                      "Jl. Perjuangan",
                                      4,
                                      "Tersedia",
                                      "8,5",
                                      350000,
                                      "Standar"),
                                  CardMenu(
                                      context,
                                      urls[1],
                                      "OYO 210 Amethyst",
                                      "Jl. Sutomo",
                                      3,
                                      "Tersedia",
                                      "8,5",
                                      600000,
                                      "VVIP")
                                ],
                              ),
                            ),
                            Container(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  CardMenu(
                                      context,
                                      urls[8],
                                      "OYO 1088 Mega Sentosa",
                                      "Jl. Segiri",
                                      5,
                                      "Tersedia",
                                      "8,5",
                                      400000,
                                      "Supperior"),
                                  CardMenu(
                                      context,
                                      urls[9],
                                      "OYO 1633 Darma Nusantara",
                                      "Jl. Pleno 3",
                                      3,
                                      "Diboking",
                                      "8,5",
                                      500000,
                                      "VIP"),
                                ],
                              ),
                            ),
                            Container(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  CardMenu(
                                      context,
                                      urls[0],
                                      "OYO Townhouse 2",
                                      "Jl. Ahmad Yamin",
                                      5,
                                      "Diboking",
                                      "8,5",
                                      400000,
                                      "Supperior"),
                                  CardMenu(
                                      context,
                                      urls[3],
                                      "OYO Flagship 755 Appart",
                                      "Jl. Pramuka",
                                      3,
                                      "Tersedia",
                                      "8,5",
                                      500000,
                                      "VIP"),
                                  CardMenu(
                                      context,
                                      urls[6],
                                      "OYO 258 The Enviro",
                                      "Jl. Perjuangan",
                                      4,
                                      "Tersedia",
                                      "8,5",
                                      350000,
                                      "Standar"),
                                  CardMenu(
                                      context,
                                      urls[7],
                                      "OYO 210 Amethyst",
                                      "Jl. Sutomo",
                                      3,
                                      "Tersedia",
                                      "8,5",
                                      600000,
                                      "VVIP"),
                                  CardMenu(
                                      context,
                                      urls[8],
                                      "OYO 1088 Mega Sentosa",
                                      "Jl. Segiri",
                                      5,
                                      "Tersedia",
                                      "8,5",
                                      400000,
                                      "Supperior"),
                                  CardMenu(
                                      context,
                                      urls[9],
                                      "OYO 1633 Darma Nusantara",
                                      "Jl. Pleno 3",
                                      3,
                                      "Diboking",
                                      "8,5",
                                      500000,
                                      "VIP"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ))
            ]),
      ),
    );
  }
}
