import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:foodorderproject/core/data/models/apis/category_model.dart';
import 'package:foodorderproject/core/data/models/apis/meal_model.dart';
import 'package:foodorderproject/core/data/reposotories/category_repository.dart';
import 'package:foodorderproject/core/data/reposotories/meal_repository.dart';
import 'package:foodorderproject/core/enums/connectivitystatus.dart';
import 'package:foodorderproject/core/enums/message_type.dart';
import 'package:foodorderproject/core/enums/operation_type.dart';
import 'package:foodorderproject/core/enums/request_status.dart';
import 'package:foodorderproject/core/services/base_controller.dart';
import 'package:foodorderproject/ui/shared/custum_widget/customtoast.dart';
import 'package:foodorderproject/ui/shared/utils.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends BaseController{
 RxList<CategoryModels> categoryList = <CategoryModels>[].obs;
  RxList<MealModel> mealList = <MealModel> [].obs;
  Rx<Color> color = Colors.blue.obs;

 bool get isCategoryLoading =>
     RequestStatus == RequestStatus.LOADING &&
         OpertionType == OpertionType.CATEGORY;

 bool get isMealLoading =>
     RequestStatus == RequestStatus.LOADING &&
         OpertionType == OpertionType.MEAL;




 RxBool isOnlne = true.obs;

 @override
 void onInit() {
   getAllCategory();
   getAllMeal();
   // checkConnection();
   super.onInit();
 }

 @override
 void onReady() {
   checkConnection();
   super.onReady();
 }

 void checkConnection() {
   connectivityService.connectivityStatusController.stream.listen((event) {
     isOnlne.value = event == ConnectivityStatus.ONLINE;
   });
 }
 void getAllCategory(){
   runLoadingFutuerFunction(function:
  CategoryRepository().getAll().then((value){
    value.fold((l) {
      CustumToast.showMessage(

          message: l,
          messageType: MessageType.REJECTED);
    }, (r) {

      categoryList .addAll(r);
    });
  }),
       type: OpertionType.CATEGORY);
 }

 void getAllMeal(){
   runLoadingFutuerFunction(function:
   MealRepository().getAll().then((value){
     value.fold((l) {
       CustumToast.showMessage(

           message: l,
           messageType: MessageType.REJECTED);
     }, (r) {

       mealList .addAll(r);
     });
   }),
       type: OpertionType.MEAL );


 }
}