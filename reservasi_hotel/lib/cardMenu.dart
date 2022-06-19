import 'package:flutter/material.dart';
import 'package:reservasi_hotel/KamarDetail.dart';

Widget CardMenu(
    BuildContext context,
    String imgUrl,
    String hotelName,
    String location,
    int rating,
    String status,
    String review,
    int harga,
    String vip) {
  var warnaStatus = Colors.white;
  if (status == "Tersedia") {
    warnaStatus = Colors.green;
  } else if (status == "Diboking") {
    warnaStatus = Colors.red;
  }
  return Card(
    margin: EdgeInsets.only(right: 22),
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    elevation: 0,
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => KamarDetail(
                imgUrl: imgUrl,
                hotelName: hotelName,
                location: location,
                rating: rating,
                status: status,
                review: review,
                harga: harga,
                vip: vip,
              ),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(imgUrl),
          fit: BoxFit.cover,
          scale: 2,
        )),
        width: 200,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    for (var i = 0; i < rating; i++)
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    for (var i = 5; i > rating; i--)
                      Icon(
                        Icons.star_border,
                        color: Colors.yellow,
                      ),
                  ],
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hotelName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      location,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                          color: warnaStatus,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ))
              ]),
        ),
      ),
    ),
  );
}

//
// //
//



