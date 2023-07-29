import 'package:flutter/material.dart';
import 'package:foodorderproject/core/data/models/apis/meal_model.dart';
import 'package:foodorderproject/ui/shared/colors.dart';
import 'package:foodorderproject/ui/shared/custum_widget/custm_button.dart';
import 'package:foodorderproject/ui/views/meal_details/meal_detail_controller.dart';
import 'package:get/get.dart';

class MealDetails extends StatefulWidget {
  final MealModel model;
  const MealDetails({Key? key, required this.model}) : super(key: key);

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  late MealDetailsController controller;

  @override
  void initState() {
 controller = Get.put(MealDetailsController(widget.model));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
   body:Column(
     children: [
       Text('price:${widget.model.price ??'1000'}'),
       Obx(() {
         return Row(
           children: [
             ElevatedButton(onPressed: (){controller.changeCount(false);}, child: Text('-'),
               style: ElevatedButton.styleFrom(backgroundColor:controller.count==1
                   ?AppColors.greytextColor
                   :AppColors.mainOrangeColor, ),),
             CustumButton(text:controller.count.value.toString()),

           ],
         );
       })
     ],
   ),
    ));
  }
}
