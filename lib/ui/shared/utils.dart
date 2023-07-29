import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodorderproject/app/my_app_controller.dart';
import 'package:foodorderproject/core/data/reposotories/shared_preference.dart';
import 'package:foodorderproject/core/enums/connectivitystatus.dart';
import 'package:foodorderproject/core/enums/file_type.dart';
import 'package:foodorderproject/core/enums/message_type.dart';
import 'package:foodorderproject/core/services/cart_service.dart';
import 'package:foodorderproject/core/services/connectivityservice.dart';
import 'package:foodorderproject/core/services/location_service.dart';
import 'package:foodorderproject/core/services/notification_service.dart';
import 'package:foodorderproject/core/services/notification_service.dart';
import 'package:foodorderproject/core/services/notification_service.dart';
import 'package:foodorderproject/core/services/notification_service.dart';
import 'package:foodorderproject/ui/shared/colors.dart';
import 'package:foodorderproject/ui/shared/custum_widget/customtoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

bool isEmail(String value) {
    RegExp regExp = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regExp.hasMatch(value);
}

bool isValidSyriaMobileNumber(String mobileNumber) {
    RegExp regex = RegExp(r'^(!?(\+|00)?(963)|0)?9\d{8}$');
    return regex.hasMatch(mobileNumber);
}

bool isValidPassword(String password, String confirmPassword) {
    RegExp regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$');
    return (password == confirmPassword) && regex.hasMatch(password);
}


bool isName(String value) {
    RegExp regExp = new RegExp(
        r'^[a-zA-Z]+(([,. -][a-zA-Z ])?[a-zA-Z]*)*$');

    return regExp.hasMatch(value);
}
class FileTypeModel{
    FileTypeEnum type;
    String path;
    FileTypeModel(this.type,this.path);
}

double screenWidth(double percent){
    return Get.size.width/percent;
}
double screenHieght(double percent){
    return Get.size.height/percent;
}

SharedPreferenceRepositry get storage=>Get.find<SharedPreferenceRepositry>();

Future claunchUrl(Uri url) async {
    if (!await launchUrl(url,
        mode: LaunchMode.externalApplication))
    {
        CustumToast.showMessage(message: 'cant launch url',
            messageType: MessageType.REJECTED);
    }
}
void customLoader()=>BotToast.showCustomLoading(toastBuilder: (context){
    return Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
        ),
        width: screenWidth(4),
        height: screenWidth(4),
        child: SpinKitCircle(
            color: AppColors.mainOrangeColor,
            size: screenWidth(8),
        ),
    );
});
CartService get cartService => Get.find<CartService>();
ConnectivityService get connectivityService => Get.find<ConnectivityService>();
NotificationService get notificationService => Get.find<NotificationService>();


bool get isOnline =>
    Get.find<MyAppController>().connectivityStatus == ConnectivityStatus.ONLINE;

bool get isOffline =>
    Get.find<MyAppController>().connectivityStatus ==
        ConnectivityStatus.OFFLINE;

void checkConnection(Function function) {
    if (isOnline)
        function();
    else
        showNoConnectionMessage();
}

void showNoConnectionMessage() {
    CustumToast.showMessage(
        message: 'Please check internet connection',
        messageType: MessageType.WARNING);
}

LocationService get locationService => Get.find<LocationService>();