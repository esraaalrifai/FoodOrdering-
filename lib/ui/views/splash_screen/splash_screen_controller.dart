import 'package:foodorderproject/core/data/reposotories/shared_preference.dart';
import 'package:foodorderproject/ui/shared/utils.dart';
import 'package:foodorderproject/ui/views/intro_view/intro_view.dart';
import 'package:foodorderproject/ui/views/landing_view/landing_view.dart';
import 'package:foodorderproject/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SplashScreenController extends GetxController{
  @override
  void onInit(){
    Future.delayed(Duration(seconds:6 )).then((value) {
           if (storage. getFirstLunch()){
            Get.off(IntroView());
            }
          else{
            Get.off( storage.isLoggedIn?MainView():LandingView());
          }
          storage.setFirstLunch(false);
        });
    super.onInit();

  }

}