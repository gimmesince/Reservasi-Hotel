import 'dart:async';
import 'package:get/get.dart';
import 'package:reservasi_hotel/landingPage.dart';
import 'package:reservasi_hotel/main.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 1), () {
      // Get.off(Navigasi());
      Get.off(LandingPage());
    });
  }
}
