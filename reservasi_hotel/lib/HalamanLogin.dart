import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservasi_hotel/Admin/AdminDashboard.dart';
import 'package:reservasi_hotel/auth.dart';
import 'package:reservasi_hotel/button.dart';
import 'package:reservasi_hotel/main.dart';
import 'package:google_fonts/google_fonts.dart';

class HalamanLogin extends StatefulWidget {
  const HalamanLogin({Key? key}) : super(key: key);

  @override
  State<HalamanLogin> createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthController controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 106, 104),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'OYO Reservation',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  )),
              TextFormField(
                cursorColor: Colors.black,
                controller: controller.userID,
                decoration: InputDecoration(
                  hintText: "emyail",
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontStyle: FontStyle.italic),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                "Password",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Obx(
                () => TextFormField(
                  cursorColor: Colors.black,
                  controller: controller.password,
                  obscureText: controller.isHiddenpassword.value,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () => controller.isHiddenpassword.toggle(),
                        icon: controller.isHiddenpassword.isTrue
                            ? Icon(
                                Icons.visibility_off,
                                color: Color(0xFF686868),
                              )
                            : Icon(
                                Icons.remove_red_eye_outlined,
                                color: Color(0xFF686868),
                              )),
                    hintText: "Password",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontStyle: FontStyle.italic),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Container(
                width: Get.width,
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    controller.login();
                    if(controller.getSTATADMIN() == "Login Admin Berhasil"){
                      submitLoginADMINBerhasil(context);
                    }
                    else if(controller.getSTAT() == "Login Berhasil"){
                      submitLoginBerhasil(context);
                    }
                    
                  },
                  child: Container(
                    height: Get.height * 0.06,
                    width: Get.width * 0.3,
                    child: Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF474db5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(HalamanRegistrasi());
                  },
                  child: Text(
                    'Belum memiliki akun? Daftar disini',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),

              // Container(
              //   width: Get.width,
              //   alignment: Alignment.centerRight,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       controller.signInWithGoogle();
              //     },
              //     child: Container(
              //       height: Get.height * 0.06,
              //       width: Get.width,
              //       child: Center(
              //         child: Text(
              //           'Login With Google',
              //           style: TextStyle(
              //               fontSize: 15,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white),
              //         ),
              //       ),
              //     ),
              //     style: ElevatedButton.styleFrom(
              //         primary: Color(0xFF474db5),
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(30))),
              //   ),
              // ),
            ],
          )),
    );
  }
}
//
//
//
//
//
//
//
//
//

class HalamanRegistrasi extends StatefulWidget {
  HalamanRegistrasi({Key? key}) : super(key: key);

  @override
  State<HalamanRegistrasi> createState() => _HalamanRegistrasiState();
}

class _HalamanRegistrasiState extends State<HalamanRegistrasi> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  AuthController controller = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 106, 104),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Image(
          image: AssetImage("pict/logo.png"),
          width: 90,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'OYO Reservation',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  )),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Text(
                "Username",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              TextFormField(
                cursorColor: Colors.black,
                controller: controller.ReguserID,
                decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontStyle: FontStyle.italic),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                "Password",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Obx(
                () => TextFormField(
                  cursorColor: Colors.black,
                  controller: controller.Regpassword,
                  obscureText: controller.isHiddenpassword.value,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () => controller.isHiddenpassword.toggle(),
                        icon: controller.isHiddenpassword.isTrue
                            ? Icon(
                                Icons.visibility_off,
                                color: Color(0xFF686868),
                              )
                            : Icon(
                                Icons.remove_red_eye_outlined,
                                color: Color(0xFF686868),
                              )),
                    hintText: "Password",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontStyle: FontStyle.italic),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Container(
                width: Get.width,
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    controller.register();
                  },
                  child: Container(
                    height: Get.height * 0.06,
                    width: Get.width * 0.3,
                    child: Center(
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF474db5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
            ],
          )),
    );
  }
}

void submitLogin(BuildContext context, String email, String password) {
  if (email.isEmpty || password.isEmpty) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
      content: Text("Email dan password harus diisi"),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return;
  } else if (email == "admin_hotel@gmail.com" && password == "admin_hotel") {
    AlertDialog alert = AlertDialog(
      title: Text("Login Berhasil"),
      content: Container(
        child: Text("Selamat Anda Berhasil login Admin"),
      ),
      actions: [
        TextButton(
            child: Text('Ok'),
            onPressed: () =>
                //Get.off(AdminNavigasi()))
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminNavigasi(),
                    ))),
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  } else if (email == "riadi@gmail.com" && password == "riadi") {
    AlertDialog alert = AlertDialog(
      title: Text("Login Berhasil"),
      content: Container(
        child: Text("Selamat Anda Berhasil login"),
      ),
      actions: [
        TextButton(
            child: Text('Ok'),
            onPressed: () => {
                  [
                    //Get.off(AdminNavigasi()))
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Navigasi(
                            Halaman: 0,
                            StatusLogin: true,
                          ),
                        ))
                  ]
                }),
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  } else {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
      content: Text("Email atau password Salah"),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return;
  }
}






void submitLoginBerhasil(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Login Berhasil"),
      content: Container(
        child: Text("Selamat Anda Berhasil login"),
      ),
      actions: [
        TextButton(
            child: Text('Ok'),
            onPressed: () =>
                //Get.off(AdminNavigasi()))
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Navigasi(Halaman: 0, StatusLogin: true),
                    ))),
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
}

void submitLoginADMINBerhasil(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Login Berhasil"),
      content: Container(
        child: Text("Selamat Anda Berhasil login ADMIN"),
      ),
      actions: [
        TextButton(
            child: Text('Ok'),
            onPressed: () =>
                //Get.off(AdminNavigasi()))
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminNavigasi(),
                    ))),
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
}