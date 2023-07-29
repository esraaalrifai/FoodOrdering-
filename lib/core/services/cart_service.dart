
import 'package:foodorderproject/core/data/models/apis/card_model.dart';
import 'package:foodorderproject/core/data/models/apis/meal_model.dart';
import 'package:foodorderproject/ui/shared/utils.dart';

class CartService {
  List<CartModel> cartList = storage.getCartList();
  void addToCart({
    required MealModel model,
    required int count,
    //كل كبسة واحد
    Function? afterAdd,
    //بعد مايضيف شو بدي ياه يعمل
  }) {
    double mealTotal = calcMealTotal(
      count: count,
      model: model,
    );
    if (getCartModel(model) != null) {
      //موجود
      int index = getIndex(getCartModel(model)!);
      //جبت اندكس
      //اسند لمتحول اذا اكتر من مرة منشان التعديل وهالقصص
      cartList[index].count = cartList[index].count! + count;
      cartList[index].total = cartList[index].total! + mealTotal;
    } else {
      cartList.add(CartModel(
        count: count,
        total: mealTotal,
        meal: model,
      ));
    }

    storage.setCartList(cartList);
    if (afterAdd != null) afterAdd();
    // Get.to(CartView());
  }

  void removeFromCartList(CartModel model) {
    cartList.remove(model);
    storage.setCartList(cartList);
  }

//حساب القيمة
  double calcMealTotal({
    required MealModel model,
    required int count,
  }) {
    return (model.price! * count).toDouble();
  }

  CartModel? getCartModel(MealModel model) {
    //اذا عندي الاوبجيكت كامل بتحل الوضع موجودة والاندكس
    //ممكن ما يكون موجود
    //يطلب شي ما موجود اساسا
    try {
      return cartList.firstWhere((element) => element.meal!.id == model.id);
    } catch (e) {
      //بتعمل اكسبشن بدونا
      return null;
    }
    //اور يليس لاتقبل نل
  }

//كاونت كل الميل
  int getCartCount() {
    //قيمة ابتدائية
    return cartList.fold(
        0, (previousValue, element) => previousValue + element.count!);
  }

  int getIndex(CartModel model) => cartList.indexOf(model);
//الاندكس منشان ما ضل اكتبا
}
//بعد كل عملية بدي اجفظ وعدل
//سرفس هي بتستعي وبتحفظ وبروح اعملا غيت