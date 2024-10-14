import 'package:first_flutter/controllers/auth_controller.dart';
import 'package:first_flutter/views/home_screen/home.dart';
import 'package:first_flutter/widgets_common/applogo_widget.dart';
import 'package:first_flutter/widgets_common/bg_widget.dart';
import 'package:first_flutter/widgets_common/custom_textfields.dart';
import 'package:first_flutter/widgets_common/my_button.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter/consts/consts.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = true;
  var controller = Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Create Account for $appname"
                .text
                .fontFamily(bold)
                .size(20)
                .white
                .make(),
            15.heightBox,
            Obx(()=>
              Column(
                children: [
                  customTextField(
                      title: name, hint: nameHint, controller: nameController),
                  10.heightBox,
                  customTextField(
                      title: email, hint: emailHint, controller: emailController),
                  10.heightBox,
                  customTextField(
                      title: password,
                      hint: passwordHint,
                      controller: passwordController),
                  10.heightBox,
                  customTextField(
                      title: retypePassword,
                      hint: passwordHint,
                      controller: passwordRetypeController),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: forgetPassword.text.make())),
                  5.heightBox,
                  Row(
                    children: [
                      Checkbox(
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });
                        },
                        checkColor: whiteColor,
                        activeColor: redColor,
                      ),
                      10.widthBox,
                      Expanded(
                        child: RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: 'I agree to the ',
                              style: TextStyle(
                                fontFamily: regular,
                                color: fontGrey,
                              )),
                          TextSpan(
                              text: termsAndCond,
                              style: TextStyle(
                                fontFamily: regular,
                                color: redColor,
                              )),
                          TextSpan(
                              text: '& ',
                              style: TextStyle(
                                fontFamily: regular,
                                color: fontGrey,
                              )),
                          TextSpan(
                              text: privacyPolicy,
                              style: TextStyle(
                                fontFamily: regular,
                                color: redColor,
                              )),
                        ])),
                      )
                    ],
                  ),
                  5.heightBox,
                  controller.isLoading.value ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ) : myButton(
                          color: isCheck == true ? redColor : lightGolden,
                          textColor: whiteColor,
                          onPress: () async {
                            if (isCheck != false) {
                              controller.isLoading(true);
                              try {
                                await controller
                                    .signupMethod(
                                        context: context,
                                        email: emailController.text,
                                        password: passwordController.text)
                                    .then((onValue) {
                                  return controller.storeUserData(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text);
                                }).then((onValue) {
                                  VxToast.show(context,
                                      msg: "Logged In Successfully");
                                  Get.offAll(() => Home());
                                });
                              } catch (e) {
                                auth.signOut();
                                VxToast.show(context, msg: e.toString());
                                controller.isLoading(false);
                              }
                            }
                            else {
                              VxToast.show(context, msg: "Agree the terms");
                            }
                          },
                          title: signup)
                      .box
                      .width(context.screenWidth - 50)
                      .make(),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      alreadyJoined.text.color(fontGrey).make(),
                      login.text
                          .color(redColor)
                          .fontFamily(bold)
                          .make()
                          .onTap(() {
                        Get.back();
                      })
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
