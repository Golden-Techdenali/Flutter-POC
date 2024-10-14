import 'package:first_flutter/consts/consts.dart';
import 'package:first_flutter/consts/lists.dart';
import 'package:first_flutter/views/category_screen/product_description.dart';
import 'package:first_flutter/views/home_screen/components/featured_button.dart';
import 'package:first_flutter/widgets_common/home_buttons.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            color: lightGrey,
            child: TextFormField(
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                filled: true,
                fillColor: whiteColor,
                hintText: searchAnything,
                hintStyle: TextStyle(color: textfieldGrey),
              ),
            ),
          ),
          10.heightBox,
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  VxSwiper.builder(
                      autoPlay: true,
                      height: 150,
                      aspectRatio: 16 / 9,
                      enlargeCenterPage: true,
                      itemCount: slidersLists.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          slidersLists[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      }),

                  10.heightBox,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...List.generate(
                          2,
                          (index) => homeButtons(
                                height: context.screenHeight * 0.15,
                                width: context.screenWidth / 2.5,
                                title: index == 0 ? todayDeal : flashSale,
                                icon: index == 0 ? icTodaysDeal : icFlashDeal,
                              )),
                    ],
                  ),
                  10.heightBox,
                  VxSwiper.builder(
                      autoPlay: true,
                      height: 150,
                      aspectRatio: 16 / 9,
                      //enlargeCenterPage: true,
                      itemCount: slidersLists2.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          slidersLists2[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      }),

                  10.heightBox,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        3,
                        (index) => homeButtons(
                              height: context.screenHeight * 0.15,
                              width: context.screenWidth / 3.5,
                              title: index == 0
                                  ? topCategories
                                  : index == 1
                                      ? brands
                                      : topSellers,
                              icon: index == 0
                                  ? icTopCategories
                                  : index == 1
                                      ? icBrands
                                      : icTopSeller,
                            )),
                  ),

                  20.heightBox,

                  Align(
                      alignment: Alignment.centerLeft,
                      child: featuredCategories.text
                          .size(18)
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make()),
                  20.heightBox,

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          3,
                          (index) => Column(
                                children: [
                                  featuredButton(
                                      icon: featuredImages1[index],
                                      title: featuredTitles1[index]),
                                  10.heightBox,
                                  featuredButton(
                                      icon: featuredImages2[index],
                                      title: featuredTitles2[index]),
                                ],
                              )),
                    ),
                  ),

                  //feature Product

                  20.heightBox,

                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: const BoxDecoration(color: redColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        featuredProduct.text.white
                            .fontFamily(bold)
                            .size(18)
                            .make(),
                        10.heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                4,
                                (index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          imgP1,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        10.heightBox,
                                        "Laptop 8GB/256GB"
                                            .text
                                            .fontFamily(semibold)
                                            .make(),
                                        10.heightBox,
                                        "\$500"
                                            .text
                                            .fontFamily(bold)
                                            .color(redColor)
                                            .size(16)
                                            .make(),
                                      ],
                                    )
                                        .box
                                        .roundedSM
                                        .margin(const EdgeInsets.symmetric(
                                            horizontal: 4))
                                        .white
                                        .padding(const EdgeInsets.all(8))
                                        .make()),
                          ),
                        ),
                      ],
                    ),
                  ),

                  20.heightBox,

                  VxSwiper.builder(
                      autoPlay: true,
                      height: 150,
                      aspectRatio: 16 / 9,
                      //enlargeCenterPage: true,
                      itemCount: slidersLists2.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          slidersLists2[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      }),

// all products sections

                  20.heightBox,
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              mainAxisExtent: 300),
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          imgP7,
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                        const Spacer(),
                                        "Ray Ban Glasses"
                                            .text
                                            .fontFamily(semibold)
                                            .make(),
                                        10.heightBox,
                                        "\$60"
                                            .text
                                            .fontFamily(bold)
                                            .color(redColor)
                                            .size(16)
                                            .make(),
                                      ],
                                    )
                                        .box
                                        .roundedSM
                                        .margin(const EdgeInsets.symmetric(
                                            horizontal: 4))
                                        .white
                                        .padding(const EdgeInsets.all(12))
                                        .make().onTap((){
                                          Get.to(ProductDescription(title: "Ray Ban Glasses"));
                                        });
                      })
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
