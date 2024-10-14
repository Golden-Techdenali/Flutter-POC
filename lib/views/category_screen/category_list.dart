import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_flutter/consts/consts.dart';
import 'package:first_flutter/controllers/product_controller.dart';
import 'package:first_flutter/services/firestore_services.dart';
import 'package:first_flutter/views/category_screen/product_description.dart';
import 'package:first_flutter/widgets_common/bg_widget.dart';
import 'package:first_flutter/widgets_common/loading_indicator.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();

    return bgWidget(Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getProducts(title),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: "No Products Available".text.color(darkFontGrey).make(),
            );
          } else {
            var data = snapshot.data!.docs;
            return Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          controller.subCat.length,
                          (index) => "${controller.subCat[index]}"
                              .text
                              .size(12)
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .makeCentered()
                              .box
                              .roundedSM
                              .white
                              .size(120, 60)
                              .margin(const EdgeInsets.symmetric(horizontal: 5))
                              .make()),
                    ),
                  ),
                  20.heightBox,
                  Expanded(
                    child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 250,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8),
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                data[index]['p_imgs'][0],
                                width: 200,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                              "${data[index]['p_name']}"
                                  .text
                                  .fontFamily(semibold)
                                  .make(),
                              10.heightBox,
                              "${data[index]['p_price']}"
                              .numCurrencyWithLocale()
                                  .text
                                  .fontFamily(bold)
                                  .color(redColor)
                                  .size(16)
                                  .make(),
                            ],
                          )
                              .box
                              .roundedSM
                              .margin(const EdgeInsets.symmetric(horizontal: 4))
                              .white
                              .outerShadowSm
                              .padding(const EdgeInsets.all(12))
                              .make()
                              .onTap(() {
                                controller.checkIfFav(data[index]);
                            Get.to(
                                () => ProductDescription(title: "${data[index]['p_name']}", data: data[index],),);
                          });
                        }),
                  )
                ],
              ),
            );
          }
        },
      ),
    ));
  }
}
