import 'package:flutter/material.dart';
import 'package:foodorderproject/ui/shared/colors.dart';
import 'package:foodorderproject/ui/shared/custum_widget/custm_button.dart';
import 'package:foodorderproject/ui/shared/utils.dart';
import 'package:foodorderproject/ui/views/cart_view/cart_view_cntroller.dart';
import 'package:get/get.dart';


class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return Column(
            children: [
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              controller
                                  .removeFromCart(controller.cartList[index]);
                            },
                            icon: Icon(Icons.delete)),
                        Column(
                          children: [
                            Text(
                              controller.cartList[index].meal?.name ?? '',
                              style: TextStyle(fontSize: screenWidth(10)),
                            ),
                            Text(
                              controller.cartList[index].meal!.price.toString(),
                              style: TextStyle(fontSize: screenWidth(10)),
                            ),
                            Row(
                              children: [
                                CustumButton(
                                    text: '-',
                                    onPressed: () {
                                      controller.changeCount(
                                          false, controller.cartList[index]);
                                    }),
                                CustumButton(
                                    text: '+',
                                    onPressed: () {
                                      controller.changeCount(
                                          true, controller.cartList[index]);
                                    })
                              ],
                            ),
                            Text(
                              controller.cartList[index].total.toString(),
                              style: TextStyle(fontSize: screenWidth(10)),
                            )
                          ],
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      width: screenWidth(1),
                      height: 2,
                      color: AppColors.mainOrangeColor,
                    );
                  },
                  itemCount: controller.cartList.length),
              CustumButton(
                  text: 'subtotal',
                  onPressed: () {
                  }),

            ],
          );
        }),

      ),
    );
  }
}
