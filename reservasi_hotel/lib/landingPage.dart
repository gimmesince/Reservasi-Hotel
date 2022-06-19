import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservasi_hotel/main.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  var splash = [
    "pict/landing1.png",
    "pict/landing2.png",
    "pict/landing3.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 60, 47),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                aspectRatio: 16 / 9,

                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 10),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                // enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: [
                0,
                1,
                2,
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(splash[i]),
                        fit: BoxFit.cover,
                        scale: 2,
                      )),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Background color
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Get.off(Navigasi(
                    Halaman: 0,
                    StatusLogin: false,
                  ));
                },
              )),
          Container(
            height: 120,
            width: 120,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(top: 40, left: 40),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("pict/logo2.png"))),
          )
        ],
      ),
    );
  }
}
