import 'package:flutter/material.dart';
import 'package:foodorderproject/ui/shared/custum_widget/custm_button.dart';

class CategoryView2 extends StatefulWidget {
  const CategoryView2({Key? key}) : super(key: key);

  @override
  State<CategoryView2> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('cart'),
          //  CustumButton(text: )
        ],
      ),
    ));
  }
}