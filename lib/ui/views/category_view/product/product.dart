import 'package:flutter/material.dart';
import 'package:foodorderproject/ui/shared/custum_widget/custm_button.dart';

class CategoryView1 extends StatefulWidget {
  const CategoryView1({Key? key}) : super(key: key);

  @override
  State<CategoryView1> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('prudact'),
          //  CustumButton(text: )
        ],
      ),
    ));
  }
}