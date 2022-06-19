import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservasi_hotel/auth.dart';
import 'package:reservasi_hotel/cardMenu.dart';
import 'package:reservasi_hotel/controller_firestore.dart';

class KamarDetail extends StatefulWidget {
  String imgUrl = "",
      hotelName = "",
      location = "",
      status = "",
      review = "",
      vip = "";
  int harga = 0, rating = 0;

  KamarDetail(
      {Key? key,
      required this.imgUrl,
      required this.hotelName,
      required this.location,
      required this.rating,
      required this.status,
      required this.review,
      required this.harga,
      required this.vip})
      : super(key: key);

  @override
  State<KamarDetail> createState() => _KamarDetailState();
}

class _KamarDetailState extends State<KamarDetail> {
  AuthController _authController = Get.put(AuthController());
  AuthController authController = Get.find();
  FirestoreController fsc = Get.find();
  User? _user;
  User get user => _user ?? user;
  // Variable/State untuk mengambil tanggal
  DateTime selectedDateCekin = DateTime.now();
  DateTime selectedDateCekout = DateTime.now();
//  Initial SelectDate FLutter
  Future<Null> _Cekin(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDateCekin,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDateCekin)
      setState(() {
        selectedDateCekin = picked;
      });
  }

  Future<Null> _Cekout(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDateCekout,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDateCekout)
      setState(() {
        selectedDateCekout = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 106, 104),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                  height: 260,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(widget.imgUrl),
                    fit: BoxFit.cover,
                    scale: 2,
                  ))),
              Align(
                alignment: Alignment.topCenter,
                child: AppBar(
                  backgroundColor: Color.fromARGB(48, 255, 3, 3),
                  elevation: 0,
                  centerTitle: true,
                  title: Text(
                    "DETAIL",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  // leading: Icon(Icons.menu),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.only(
                      top: 150,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.hotelName,
                            style: TextStyle(
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 3.0,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ],
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            widget.location,
                            style: TextStyle(
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 3.0,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ],
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(widget.review + " View"),
                              ),
                              Spacer(),
                              IconButton(
                                  color: Colors.white,
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_border))
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          /////
                          ///    /////
                          ///     /////     /////
                          /////
                          /////
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              for (var i = 0;
                                                  i < widget.rating;
                                                  i++)
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                ),
                                              for (var i = 5;
                                                  i > widget.rating;
                                                  i--)
                                                Icon(
                                                  Icons.star_border,
                                                  color: Colors.yellow,
                                                ),
                                            ],
                                          )
                                        ],
                                      )),
                                      Column(
                                        children: [
                                          Text("Rp " + widget.harga.toString()),
                                          Text("/Malam")
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),



                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.grey.shade400,
                                                width: 1))),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 5,),
                                        Text("Check in",style: TextStyle(
                                            color: Colors.blue[300],
                                          ),),
                                        Row(
                                          children: [
                                            
                                            Text(
                                              "${selectedDateCekin.toLocal()}"
                                                  .split(' ')[0],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                  color: Colors.blue[300]),
                                            ),
                                            IconButton(
                                              
                                              icon: Icon(
                                                Icons.calendar_month,
                                                color: Colors.blue[300],
                                              ),
                                              onPressed: () => {
                                                _Cekin(context),
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),




                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.grey.shade400,
                                                width: 1))),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 5,),
                                        Text("Check out",style: TextStyle(
                                            color: Colors.blue[300],
                                          ),),
                                        Row(
                                          children: [
                                            
                                            Text(
                                              "${selectedDateCekout.toLocal()}"
                                                  .split(' ')[0],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                  color: Colors.blue[300]),
                                            ),
                                            IconButton(
                                              
                                              icon: Icon(
                                                Icons.calendar_month,
                                                color: Colors.blue[300],
                                              ),
                                              onPressed: () => {
                                                _Cekin(context),
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),


                                  Container(
                                    height: 55,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.grey.shade400,
                                                width: 1))),
                                    child: Row(
                                      children: [
                                        Text(
                                            "jumlah hari : ${selectedDateCekout.difference(selectedDateCekin).inDays}",style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                  color: Colors.blue[300])),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.grey.shade400,
                                                width: 1))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          " " + widget.vip + " FASILITAS",
                                          style: TextStyle(
                                            color: Colors.blue[300],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Card(
                                                    color: Colors.blue[300],
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              7.0),
                                                      child: Icon(
                                                        Icons.wifi,
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                                Text(
                                                  "Wi-fi",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.blue[300],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Card(
                                                    color: Colors.blue[300],
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Icon(
                                                        Icons.pool_rounded,
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                                Text(
                                                  "Jacuzzi",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.blue[300],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Card(
                                                    color: Colors.blue[300],
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Icon(
                                                        Icons.breakfast_dining,
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                                Text(
                                                  "Breakfast",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.blue[300],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Card(
                                                    color: Colors.blue[300],
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Icon(
                                                        Icons.dinner_dining,
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                                Text(
                                                  "Dinner",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.blue[300],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Card(
                                                    color: Colors.blue[300],
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Icon(
                                                        Icons.smoke_free,
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                                Text(
                                                  "Smoke Free",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.blue[300],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 40,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(
                                      255, 255, 255, 255), // Background color
                                ),
                                child: Text(
                                  'Pesan Sekarang',
                                  style: TextStyle(color: Colors.red[600]),
                                ),
                                onPressed: () {
                                  fsc.transaki.value.add({
                                    'nama_hotel': widget.hotelName,
                                    'alamat_hotel': widget.location,
                                    'harga': widget.harga,
                                    'fasilitas': widget.vip,
                                  });
                                },
                              )),
                        ]),
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// List Fasilitas = {};
