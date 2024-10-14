import 'package:first_flutter/consts/consts.dart';
import 'package:first_flutter/views/category_screen/category_screen.dart';
import 'package:get/get.dart';

Widget homeButtons({height, width,String? title, icon, onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon, width: 26),
        10.heightBox,
        title!.text.fontFamily(semibold).color(darkFontGrey).make(),
      ],
  ).box.rounded.white.size(width, height).shadowSm.make().onTap((){
    Get.to(const CategoryScreen());
  });
}
