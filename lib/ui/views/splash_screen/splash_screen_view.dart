import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodorderproject/core/data/reposotories/shared_preference.dart';
import 'package:foodorderproject/ui/shared/colors.dart';
import 'package:foodorderproject/ui/shared/utils.dart';
import 'package:foodorderproject/ui/views/intro_view/intro_view.dart';
import 'package:foodorderproject/ui/views/landing_view/landing_view.dart';
import 'package:foodorderproject/ui/views/main_view/main_view.dart';
import 'package:foodorderproject/ui/views/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  SplashScreenController controller=Get.put(SplashScreenController());

  @override
  // void initState() {
  //   Future.delayed(Duration(seconds:6 )).then((value) {
  //     if (SharedPreferenceRepositry. getFirstLunch()){
  //     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
  //     // {return IntroView();},
  //     // ));
  //       Get.off(IntroView);
  //       }
  //     else{
  //       Get.off( SharedPreferenceRepositry().isLoggedIn?MainView():LandingView());
  //       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
  //       //   return SharedPreferenceRepositry().isLoggedIn?MainView():LandingView();
  //       // }));
  //     }
  //     SharedPreferenceRepositry.setFirstLunch(false);
  //   });
  //   super.initState();
  // }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          fit: StackFit.expand,
          children: [
            SvgPicture.asset('assets/images/bg_background.svg',
            fit: BoxFit.fill,
            width:screenWidth(1),
           ),
           Center(child: SvgPicture.asset('assets/images/Logo.svg',
          )),
            Container(
              margin: EdgeInsets.only(top: screenHieght(5)),
              height: screenWidth(5),
              child: SpinKitThreeBounce(
                color: AppColors.mainOrangeColor,

              ),
            ),


          ],
        ),
      ),
    );
  }
}
