import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControllerHotel extends GetxController {
  TextEditingController urlgambarCtrl = TextEditingController();
  TextEditingController nama_hotelCtrl = TextEditingController();
  TextEditingController alamat_hotelCtrl = TextEditingController();
  TextEditingController ratingCtrl = TextEditingController();
  TextEditingController statusCtrl = TextEditingController();
  TextEditingController viewsCtrl = TextEditingController();
  TextEditingController hargaCtrl = TextEditingController();
  TextEditingController jenis_kamarCtrl = TextEditingController();

  void onClose(){
    urlgambarCtrl.dispose();
    nama_hotelCtrl.dispose();
    alamat_hotelCtrl.dispose();
    ratingCtrl.dispose();
    statusCtrl.dispose();
    viewsCtrl.dispose();
    hargaCtrl.dispose();
    jenis_kamarCtrl.dispose();
    print("Text Controller sudah terhapus");
    super.onClose();
  }
}