import 'package:first_flutter/consts/consts.dart';
import 'package:first_flutter/controllers/home_controller.dart';
import 'package:first_flutter/views/cart_screen/cart_screen.dart';
import 'package:first_flutter/views/category_screen/category_screen.dart';
import 'package:first_flutter/views/home_screen/home_screen.dart';
import 'package:first_flutter/views/profile_screen/profile_screen.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(HomeController());

    var navBarItems = [
      BottomNavigationBarItem(icon: Image.asset(icHome, width: 26,),label: home),
      BottomNavigationBarItem(icon: Image.asset(icCategories, width: 26,),label: categories),
      BottomNavigationBarItem(icon: Image.asset(icCart, width: 26,),label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile, width: 26,),label: account),
    ];

    var navBodies = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(child: navBodies.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(() =>
        BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: redColor,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          onTap: (value){
            controller.currentNavIndex.value = value;
          },
          items: navBarItems),
      ),
    );
  }
}