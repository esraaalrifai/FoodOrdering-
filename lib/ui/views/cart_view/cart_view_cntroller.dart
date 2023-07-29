import 'package:foodorderproject/core/data/models/apis/card_model.dart';
import 'package:foodorderproject/core/services/base_controller.dart';
import 'package:foodorderproject/ui/shared/utils.dart';
import 'package:get/get.dart';

class CartController extends BaseController {
  RxList<CartModel> cartList = <CartModel>[].obs;
  @override
  void onInit() {
    cartList.value = storage.getCartList();
    super.onInit();
  }

  void removeFromCart(CartModel model) {
    cartList.remove(model);
    storage.setCartList(cartList);
  }

  void changeCount(bool incress, CartModel model) {
    CartModel result = cartList.firstWhere(
            (element) => element.meal!.id == model.meal!.id,
        orElse: () => CartModel());
    int index = cartList.indexOf(result);
    if (incress) {
      result.count = result.count! + 1;
      result.total = result.total! + model.meal!.price!;
    } else {
      if (result.count! > 1) {
        result.count = result.count! - 1;
        result.total = result.total! - model.meal!.price!;
      }
    }
    cartList.remove(result);
    cartList.insert(index, result);
    storage.setCartList(cartList);
  }
  double calcsubTotal() {
    return cartList.fold(0.0, (sum, element) => sum + element.total!);
  }

  double calcTax() {
    return calcsubTotal() * 0.18;
  }

  double calcDelivery() {
    return (calcTax() + calcsubTotal()) * 0.1;
  }

  double calcTotal() {
    return (calcsubTotal() + calcTax() + calcDelivery());
  }

  void changeTotals() {
    calcsubTotal();
    calcTax();
    calcDelivery();
    calcTotal();
  }

}
