import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter/consts/colors.dart';
import 'package:first_flutter/consts/consts.dart';
import 'package:first_flutter/views/auth_screen/login_screen.dart';
import 'package:first_flutter/views/home_screen/home.dart';
import 'package:first_flutter/widgets_common/applogo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  changeScreen(){
    Future.delayed(Duration(seconds: 3),(){
      //Get.to(() => const LoginScreen());
      auth.authStateChanges().listen((User? user) {
        if (user == null ) {
          Get.to(() => const LoginScreen());
        }else{
          Get.to(() => const Home());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(icSplashBg, width: 300)),
              20.heightBox,
              applogoWidget(),
              10.heightBox,
              appname.text.fontFamily(bold).size(22).white.make(),
              5.heightBox,
              appversion.text.white.make(),
              const Spacer(),
              credits.text.fontFamily(semibold).white.size(20).make(),
              30.heightBox,
          ],
        ),
      ),
    );
  }
}