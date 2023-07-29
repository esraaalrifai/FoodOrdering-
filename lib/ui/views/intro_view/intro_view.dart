
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodorderproject/ui/shared/colors.dart';
import 'package:foodorderproject/ui/shared/custum_widget/custm_button.dart';
import 'package:foodorderproject/ui/views/landing_view/landing_view.dart';
import 'package:foodorderproject/ui/views/login_view/login_view.dart';

class IntroView extends StatefulWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  List<String> titleList = [
    'Find Food You Love',
    'Fast Delivery',
    'Live Tracking'
  ];
  List<String> descriptionList = [
    'Discover the best foods from over 1,000 \n restaurants and fast delivery to your doorstep',
    'Fast food delivery to your home, office \n wherever you are',
    'Real time tracking of your food on the app \n once you placed the order,'
  ];
  int currentindex=0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      body: Center(
        child: Column(
          children: [
            SvgPicture.asset('images/intro$currentindex.svg'),
            (size.height/70).ph,
        DotsIndicator(
            dotsCount:3,decorator:
        DotsDecorator(color: AppColors.textFormColor,
        activeColor: AppColors.mainOrangeColor),
        position:currentindex.toDouble()),
            Text(titleList[currentindex],style: TextStyle(
              color: AppColors.blacktextColor,
              fontSize: size.height/20,
              fontWeight:FontWeight.bold,
            )),
            (size.height/25).ph,
            Text(descriptionList[currentindex],  style: TextStyle(
              color: AppColors.greytextColor,
              fontSize: size.height/40,
            ),
            textAlign:TextAlign.center,),
            (size.height/9).ph,
            CustumButton(text:currentindex!=2? 'Next':'finish',onPressed: (){
              if(currentindex!=2){
                setState(() {
                  currentindex+=1;
                });
              }
              else
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {return LandingView();},));
            },),
          ],
        ),
      ),
    ),);
  }
}
