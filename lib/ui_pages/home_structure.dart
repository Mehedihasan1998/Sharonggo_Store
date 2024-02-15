import 'package:fake_store/constants/constants.dart';
import 'package:fake_store/custom_widget/custom_cart.dart';
import 'package:fake_store/custom_widget/custom_drawer.dart';
import 'package:fake_store/ui_pages/cart_page.dart';
import 'package:fake_store/ui_pages/favourite_page.dart';
import 'package:fake_store/ui_pages/home.dart';
import 'package:fake_store/ui_pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeStructure extends StatefulWidget {
  const HomeStructure({super.key});

  @override
  State<HomeStructure> createState() => _HomeStructureState();
}

class _HomeStructureState extends State<HomeStructure> {
  int _currentIndex = 0;
  final tabs = [
    HomePage(),
    SearchPage(),
    FavouritePage()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text("Sharongo Store", style: myStyle1(22, Colors.white, ),),
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          // backgroundColor: Color(0xff512DA8),
          backgroundColor: appBarColor,
          surfaceTintColor: Colors.transparent,
          elevation: 5,
          actions: [
            InkWell(
                onTap: (){
                  Get.to(CartPage(), transition: Transition.rightToLeft);
                },
                child: CustomCart(),
            ),
            SizedBox(width: 8,),
          ],
        ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          // backgroundColor: Color(0xff512DA8),
          backgroundColor: bottomNavBarColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
          selectedFontSize: 15,
          iconSize: 22,
          elevation: 5,
          // showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "Favourite",
              icon: Icon(Icons.favorite_outline),
            ),
          ],
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },

        ),
      ),
    );
  }
}
