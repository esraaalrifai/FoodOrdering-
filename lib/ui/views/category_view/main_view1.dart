import 'package:flutter/material.dart';
import 'package:foodorderproject/core/enums/profile_view.dart';
import 'package:foodorderproject/ui/shared/colors.dart';
import 'package:foodorderproject/ui/views/category_view/cart/cart_view.dart';
import 'package:foodorderproject/ui/views/category_view/home1/category_view.dart';
import 'package:foodorderproject/ui/views/category_view/product/product.dart';
import 'package:foodorderproject/ui/views/main_view/home_view/home_view.dart';
import 'package:foodorderproject/ui/views/main_view/main_view_widget/bottom_navigation_widget.dart';
import 'package:foodorderproject/ui/views/main_view/menu_view/menu_view.dart';
import 'package:foodorderproject/ui/views/main_view/more_view/more.dart';
import 'package:foodorderproject/ui/views/main_view/offers_view/offers.dart';
import 'package:foodorderproject/ui/views/main_view/profile_view/profile.dart';

class MainView1 extends StatefulWidget {
  const MainView1({Key? key}) : super(key: key);

  @override
  State<MainView1> createState() => _MainViewState();
}

class _MainViewState extends State<MainView1> {
  BottomNavigationEnum selected=BottomNavigationEnum.HOME;
  PageController controller=PageController(initialPage:2);
  GlobalKey<ScaffoldState>scaffoldKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      key:scaffoldKey ,
      bottomNavigationBar: BottomNavigationWidget(
          bottomNavigationEnum :selected,
        onTap: (selectedEnum,pageNumber){
            scaffoldKey.currentState!.openEndDrawer();
            controller.animateToPage(pageNumber,duration:Duration(milliseconds: 500,),
            curve:Curves.easeInCirc);
            setState(() {
              selected=selectedEnum;
            });
       },
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        onPageChanged: (pageNumber){
        },
        children: [
          CategoryView(),
          CategoryView1(),
          CategoryView2(),
        ],
      ),
    ));
  }
}
