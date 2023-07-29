
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodorderproject/core/data/reposotories/shared_preference.dart';
import 'package:foodorderproject/core/data/reposotories/user_repository.dart';
import 'package:foodorderproject/core/enums/message_type.dart';
import 'package:foodorderproject/core/services/base_controller.dart';
import 'package:foodorderproject/ui/shared/colors.dart';
import 'package:foodorderproject/ui/shared/custum_widget/customtoast.dart';
import 'package:foodorderproject/ui/shared/utils.dart';
import 'package:foodorderproject/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class LoginController extends BaseController{
  TextEditingController emailController = TextEditingController(//text:
  );
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading =false.obs;


  void login(){
    if (formKey.currentState!.validate()){
      runFullLoadingFutuerFunction(
        function:UserRepository().login(email: emailController.text, password: passwordController.text) .then((value) {
          value.fold((l) {
            isLoading.value = false;

            CustumToast.showMessage(
                messageType: MessageType.REJECTED,

                message: l);
          },
                  (r) {
                storage.setTokenInfo(r);
                Get.off(MainView());
              });
        })
      );
      //isLoading.value = true;
      }
  }

}