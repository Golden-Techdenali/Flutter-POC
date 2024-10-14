import 'package:first_flutter/consts/consts.dart';

Widget myButton({onPress, color, textColor, String? title}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color, padding: const EdgeInsets.all(10)),
      onPressed: onPress,
      child: title!.text.color(textColor).fontFamily(bold).make());
}
