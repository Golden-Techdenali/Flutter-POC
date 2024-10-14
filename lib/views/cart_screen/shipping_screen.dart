import 'package:first_flutter/consts/consts.dart';
import 'package:first_flutter/controllers/cart_controller.dart';
import 'package:first_flutter/views/cart_screen/payment_method.dart';
import 'package:first_flutter/widgets_common/custom_textfields.dart';
import 'package:first_flutter/widgets_common/my_button.dart';
import 'package:get/get.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Shipping Info".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: myButton(
          onPress: (){
            if (controller.addressController.text.length > 3) {
              Get.to(() => PaymentMethods());
            }else{
              VxToast.show(context, msg: "Please fill address properly");
            }
          },
          color: redColor,
          textColor: whiteColor,
          title: "Continue"
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            customTextField(hint: "Address", title: "Address", controller: controller.addressController),
            customTextField(hint: "City",title: "City", controller: controller.cityController),
            customTextField(hint: "State",title: "State", controller: controller.stateController),
            customTextField(hint: "Postal Code", title: "Postal Code", controller: controller.postalCodeController),
            customTextField(hint: "Phone", title: "Phone", controller: controller.phoneController),
          ],
        ),
      ),
    );
  }
}