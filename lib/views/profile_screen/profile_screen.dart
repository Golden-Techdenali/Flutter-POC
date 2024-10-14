import 'package:first_flutter/consts/consts.dart';
import 'package:first_flutter/controllers/auth_controller.dart';
import 'package:first_flutter/views/auth_screen/login_screen.dart';
import 'package:first_flutter/widgets_common/bg_widget.dart';
import 'package:first_flutter/widgets_common/my_button.dart';
import 'package:get/get.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      body: Center(
        child: myButton(color: redColor,textColor: whiteColor, onPress: () async {
                    await Get.put(AuthController()).signoutMethod(context);
                    Get.offAll(() => const LoginScreen());
                  }, title: logout).box.width(context.screenWidth - 50).make(),
      ),
    ));
  }
}
