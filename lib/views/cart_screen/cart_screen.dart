import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_flutter/consts/consts.dart';
import 'package:first_flutter/controllers/cart_controller.dart';
import 'package:first_flutter/services/firestore_services.dart';
import 'package:first_flutter/views/cart_screen/shipping_screen.dart';
import 'package:first_flutter/widgets_common/loading_indicator.dart';
import 'package:first_flutter/widgets_common/my_button.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: "Shopping Cart"
            .text
            .color(darkFontGrey)
            .fontFamily(semibold)
            .make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getCart(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: "Cart is empty".text.color(darkFontGrey).make(),
            );
          } else {
            var data = snapshot.data!.docs;
            controller.calculate(data);
            controller.productSnapshot = data;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.network("${data[index]['img']}",width: 80,fit: BoxFit.cover,),
                            title: "${data[index]['title']} x (${data[index]['qty']})".text.fontFamily(semibold).size(16).make(),
                            subtitle: "${data[index]['tprice']}".numCurrencyWithLocale().text.fontFamily(semibold).color(redColor).size(14).make(),

                            trailing: Icon(Icons.delete, color: redColor,).onTap(() {
                              FirestoreServices.deleteDocument(data[index].id);
                            }),
                          );
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      totalPrice.text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make(),
                      Obx(
                        () => "${controller.totalP.value}"
                            .numCurrencyWithLocale()
                            .text
                            .fontFamily(semibold)
                            .color(redColor)
                            .make(),
                      ),
                    ],
                  )
                      .box
                      .padding(EdgeInsets.all(12))
                      .color(lightGolden)
                      .width(context.screenWidth - 60)
                      .roundedSM
                      .make(),
                  10.heightBox,
                  SizedBox(
                    width: context.screenWidth - 60,
                    child: myButton(
                        color: redColor,
                        onPress: () {
                          Get.to(() => ShippingDetails());
                        },
                        textColor: whiteColor,
                        title: proceedToShipping),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
