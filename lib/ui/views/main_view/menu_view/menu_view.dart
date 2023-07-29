import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodorderproject/ui/shared/colors.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});
//final ontap
  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('menu'),
        FloatingActionButton(backgroundColor: AppColors.mainOrangeColor,
            child: Icon(Icons.add,),
            onPressed: (){setState(() { Scaffold.of(context).openEndDrawer();
             // widget.ontap();

            });
        }
        ),
      ],
    ),);
  }
}