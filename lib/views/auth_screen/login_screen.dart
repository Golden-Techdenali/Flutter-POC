import 'package:first_flutter/consts/lists.dart';
import 'package:first_flutter/controllers/auth_controller.dart';
import 'package:first_flutter/views/auth_screen/signup_screen.dart';
import 'package:first_flutter/views/home_screen/home.dart';
import 'package:first_flutter/widgets_common/applogo_widget.dart';
import 'package:first_flutter/widgets_common/bg_widget.dart';
import 'package:first_flutter/widgets_common/custom_textfields.dart';
import 'package:first_flutter/widgets_common/my_button.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter/consts/consts.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    var emailController = TextEditingController();
  var passwordController = TextEditingController();

    return bgWidget(Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Login to $appname".text.fontFamily(bold).size(20).white.make(),
            15.heightBox,
            Obx(() =>
              Column(
                children: [
                  customTextField(
                      title: email,
                      hint: emailHint,
                      controller: emailController),
                  10.heightBox,
                  customTextField(
                      title: password,
                      hint: passwordHint,
                      controller: passwordController),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: forgetPassword.text.make())),
                  5.heightBox,
                  controller.isLoading.value ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ) : myButton(
                          color: redColor,
                          textColor: whiteColor,
                          onPress: () async {
                            controller.isLoading(true);
                            await controller
                                .loginMethod(context: context, email: emailController.text, password: passwordController.text)
                                .then((onValue) {
                              if (onValue != null) {
                                VxToast.show(context,
                                    msg: "Logged In Successfully");
                                Get.offAll(() => const Home());
                              }else{
                                controller.isLoading(false);
                              }
                            });
                          },
                          title: login)
                      .box
                      .width(context.screenWidth - 50)
                      .make(),
                  5.heightBox,
                  createAccount.text.color(fontGrey).fontFamily(semibold).make(),
                  5.heightBox,
                  myButton(
                      title: signup,
                      color: lightGolden,
                      textColor: redColor,
                      onPress: () {
                        Get.to(() => const SignupScreen());
                      }).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                          3,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: lightGrey,
                                  child: Image.asset(
                                    socialIconList[index],
                                    width: 30,
                                  ),
                                ),
                              ))
                    ],
                  )
                ],
              )
                  .box
                  .rounded
                  .padding(EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .white
                  .shadowSm
                  .make(),
            ),
          ],
        ),
      ),
    ));
  }
}
