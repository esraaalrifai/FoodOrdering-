import 'package:foodorderproject/core/data/models/apis/meal_model.dart';
import 'package:get/get.dart';

class MealDetailsController extends GetxController{
MealDetailsController(MealModel mealModel){
 model=mealModel;
}

MealModel model=MealModel();
RxInt count=1.obs;
 void changeCount(bool incress){
  if(incress)
   count++;
  else{
   if(count>1){
    count--;
   }
  }
 }
 double calcTotal(){
  return(count.value*model.price!).toDouble();
 }

}