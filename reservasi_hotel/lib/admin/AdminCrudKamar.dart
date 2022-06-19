import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservasi_hotel/controller_firestore.dart';
import 'package:reservasi_hotel/controller_hotel.dart';

class AdminCrudKamar extends StatelessWidget {
  AdminCrudKamar({Key? key}) : super(key: key);
  FirestoreController fsc = Get.put(FirestoreController());
  ControllerHotel htl = Get.put(ControllerHotel());
Widget builder(context, snapshot) {
    return (snapshot.hasData)
        ? Column(
            children: snapshot.data!.docs
                .map<Widget>(
                  (e) => MyListTile(
                    leadingText: e.get('laptop'),
                    title: e.get('namaDepan'),
                    subtitle: e.get('namaBelakang'),
                    onTap: () {
                      htl.id(e.id);
                      htl.nama(e.get('namaDepan'));
                      htl.namaBelakang(e.get('namaBelakang'));
                      htl.laptop(e.get('laptop'));
                      htl.to(() => Order2(
                            isUpdate: true,
                          ));
                    },
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (_) => CustomAlert(
                          id: e.id,
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          );
  }
  looping() {
    return StreamBuilder<QuerySnapshot>(
      stream: fsc.users.value.orderBy('nama_hotel').snapshots(),
      builder: builder,
    );
  }
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
                  'Atur Kamar Hotel',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
        Container(
            child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('hotel').snapshots(),builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );

              }; return ItemBarang(listBarang: snapshot.data.,);
              
            })
            ),
      ]),
    );
  }
}

class ItemBarang extends StatelessWidget {
  ItemBarang({Key? key, required this.listBarang}) : super(key: key);
  final List<DocumentSnapshot> listBarang;
  @override
  Widget build(BuildContext context) {
      return ListView.builder(
        itemCount:  listBarang == null ?0:listBarang.length,
        itemBuilder: (context, i) {
          String kodebarang = listBarang[i].data["nama_hotel"].toString();
          return Text(kodebarang);
        }
    );
  }
}