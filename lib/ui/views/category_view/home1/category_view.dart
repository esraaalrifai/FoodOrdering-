import 'package:flutter/material.dart';
import 'package:foodorderproject/ui/shared/custum_widget/custm_button.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Category'),
       //  CustumButton(text: )
        ],
      ),
    ));
  }
}
