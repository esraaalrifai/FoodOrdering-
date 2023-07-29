import 'package:flutter/material.dart';
import 'package:foodorderproject/core/enums/notification_type.dart';
import 'package:foodorderproject/core/services/base_controller.dart';
import 'package:foodorderproject/ui/shared/colors.dart';
import 'package:foodorderproject/ui/shared/utils.dart';
import 'package:get/get.dart';

class LandingViewController extends BaseController{
  Rx<Color> buttonColor =AppColors.mainOrangeColor.obs;
  @override
  void onInit(){
    notificationService.notifcationStream.stream.listen((event) {
      if (event.notifctionType == NotificationType.CHANGECOLOR.name) {
        buttonColor.value = AppColors.blacktextColor;
      }
    });
    super.onInit();
  }
}