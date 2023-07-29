import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodorderproject/core/enums/message_type.dart';
import 'package:foodorderproject/ui/shared/colors.dart';
import 'package:foodorderproject/ui/shared/utils.dart';

class CustumToast{
  static showMessage(
  {

    required String message,
    MessageType? messageType = MessageType.INFO
}){
  String imageName = 'info';
  Color shadowColor =AppColors.mainOrangeColor;
  switch(messageType)

{
    case MessageType.REJECTED:
      imageName:'rejected-01';
      shadowColor:'AppColors.mainOrangeColor';
      // TODO: Handle this case.
      break;
    case MessageType.SUCSSES:
      // TODO: Handle this case.
      imageName:'approved1-01';
      shadowColor:'AppColors.mainOrangeColor';
      break;
    case MessageType.INFO:
      // TODO: Handle this case.
    imageName:'rejected-01';
    shadowColor:'AppColors.mainOrangeColor';
      break;
    case MessageType.WARNING:
      // TODO: Handle this case.
    imageName:'warning';
    shadowColor:'AppColors.mainOrangeColor';
      break;
      default:null;
    break;
  }
  BotToast.showCustomText(
      duration:Duration(seconds: 15),
  toastBuilder:(value){
        return Container(
        width:screenWidth(75),
  decoration:BoxDecoration(
  color: AppColors.mainWhiteColor,
  borderRadius: BorderRadius.circular(20),
  boxShadow: [
    BoxShadow(
  color: shadowColor.withOpacity(0.5),
  spreadRadius: 5,
  blurRadius: 7,
  offset: Offset(0,3),),
  ]
  ),

         child : Column(mainAxisAlignment: MainAxisAlignment.center,
           mainAxisSize: MainAxisSize.min,
           children: [ SizedBox(height:screenWidth(6)),
    SvgPicture.asset(
    'images/$imageName.svg',
    width:screenWidth(1),
    height:screenWidth(1),
    ),
    SizedBox(height:screenWidth(1),),
    Text(message,   textAlign: TextAlign.center,),

    ],

  ),
    );} );

    }
}
