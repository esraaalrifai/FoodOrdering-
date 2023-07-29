import 'package:flutter/material.dart';
import 'package:foodorderproject/core/enums/profile_view.dart';
import 'package:foodorderproject/ui/shared/colors.dart';
import 'package:foodorderproject/ui/views/main_view/home_view/home_view.dart';
import 'package:foodorderproject/ui/views/main_view/main_view_widget/bottom_navigation_widget.dart';
import 'package:foodorderproject/ui/views/main_view/menu_view/menu_view.dart';
import 'package:foodorderproject/ui/views/main_view/more_view/more.dart';
import 'package:foodorderproject/ui/views/main_view/offers_view/offers.dart';
import 'package:foodorderproject/ui/views/main_view/profile_view/profile.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  BottomNavigationEnum selected=BottomNavigationEnum.HOME;
  PageController controller=PageController(initialPage:2);
  GlobalKey<ScaffoldState>scaffoldKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      key:scaffoldKey ,
      endDrawer:Container(
        width: size.width*0.5,
        color:AppColors.mainWhiteColor,
        child: Column(
          children: [
            Text('option 1'),
            Text('option 2'),
          ],
        ),
      ) ,
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
          MenuView(),
          OffersView(),
          HomeView(onPressed: (){},
         //  onMenuTap:  scaffoldKey.currentState.openEndDrawer,
          ),
          ProfileView(),
          MoreView(),
        ],
      ),
    ));
  }
}
