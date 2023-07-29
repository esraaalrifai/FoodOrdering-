import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodorderproject/ui/shared/colors.dart';
import 'package:foodorderproject/ui/shared/custum_widget/custm_button.dart';
import 'package:foodorderproject/ui/shared/utils.dart';
import 'package:foodorderproject/ui/views/landing_view/custum_clip_path.dart';
import 'package:foodorderproject/ui/views/landing_view/landing_controller.dart';
import 'package:foodorderproject/ui/views/login_view/login_view.dart';
import 'package:foodorderproject/ui/views/map_view/map_view.dart';
import 'package:foodorderproject/ui/views/signin_view/signin_view.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';


class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  LandingViewController controller =Get.put(LandingViewController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body:ListView(
          children: [


               Stack(
                children: [

                  CustomPaint(  painter: ClipShadowShadowPainter(
                    clipper: CustomClipPath(),
                    shadow: Shadow(blurRadius: 12),
                  ),
                    child: ClipRRect(borderRadius: BorderRadiusDirectional.only(
                        bottomEnd:Radius.circular(30), bottomStart: Radius.circular(30)
                    ),

                      child:ClipPath(
                        clipper: CustomClipPath(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.mainOrangeColor,

                        ),


                          height:size.width*0.79,
                          width: size.width,


                        ),
                      ),
                    ),
                  ),

                  SvgPicture.asset('images/Background objects.svg'),

                  Align(//alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: size.height*0.30),
                      child: SvgPicture.asset('images/Logo.svg'),
                    ),
                  ),
                ],
              ),


            Center(
              child: Padding(
                padding:  EdgeInsets.only(top: size.height*0.03,),
                child: Column(
                  children: [
                    Text('Discover the best foods from over 1,000 ',
                    style: TextStyle(
                      color:AppColors.greytextColor,
                    ),),
                    Text('restaurants and fast delivery to your doorstep',
                      style: TextStyle(
                        color: AppColors.greytextColor,
                      ),),
                    Padding(
                      padding:  EdgeInsets.only(top: size.width*0.10,
                      bottom: size.width*0.06),
                      child:CustumButton(backgroundColor: controller.buttonColor.value,
                        onPressed: ()
                     {
                        Navigator.push(context,
                            MaterialPageRoute(
                              builder:(context)=>LoginView(),
                            ) );},


                          text:'Login' ,

                      ),
                    ),
                    CustumButton(text: 'Create an Account',

                    onPressed: ()async {LocationData?currentLocation=await locationService.getUserCurrentLocation();
    if(currentLocation!=null)Get.to(MapView(currentLocation:currentLocation));},
                    textColor: AppColors.mainOrangeColor,
                    backgroundColor: AppColors.mainWhiteColor,),

                  ],
                ),
              ),
            ),



          ],

        ),
      ),
    );
  }
}
