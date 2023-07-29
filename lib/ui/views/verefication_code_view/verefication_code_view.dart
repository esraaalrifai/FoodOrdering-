import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:foodorderproject/core/enums/message_type.dart';
import 'package:foodorderproject/ui/shared/colors.dart';
import 'package:foodorderproject/ui/shared/custum_widget/custm_button.dart';
import 'package:foodorderproject/ui/shared/custum_widget/customtoast.dart';
import 'package:foodorderproject/ui/shared/custum_widget/custom_form.dart';
import 'package:foodorderproject/ui/views/login_view/login_view.dart';
import 'package:foodorderproject/ui/views/new_password/new_password.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VereficationCodeView extends StatefulWidget {
  const VereficationCodeView({Key? key}) : super(key: key);

  @override
  State<VereficationCodeView> createState() => _VereficationCodeViewState();
}

class _VereficationCodeViewState extends State<VereficationCodeView> {
 // TextEditingController controller =TextEditingController();
  var otpcontroller=List.generate(4, (index) => TextEditingController());
  var isotpsent=false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              (size.height/20).ph,
              Text('We have sent an OTP to\nyour Mobile',textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.blacktextColor,
                  fontSize: size.height/25,
                  fontWeight: FontWeight.w500,

                ),),
              (size.height/50).ph,
              Text('Please check your mobile number 071*****12 continue to reset your password',textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.greytextColor,
                  fontSize: size.height/40,
                ),),
              (size.height/13).ph,

              // PinCodeTextField(
              //   length: 4,
              //   obscureText: true,
              //   animationType: AnimationType.fade,
              //   pinTheme: PinTheme(
              //     shape: PinCodeFieldShape.box,
              //     borderRadius: BorderRadius.circular(5),
              //     fieldHeight: 50,
              //     fieldWidth: 40,
              //     activeFillColor: Colors.white,
              //   ),
              //   animationDuration: Duration(milliseconds: 300),
              //   backgroundColor: Colors.blue.shade50,
              //   enableActiveFill: true,
              //   onChanged: (value) {
              //     print(value);
              //   },
              //   beforeTextPaste: (text) {
              //     print("Allowing to paste $text");
              //     //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //     //but you can show anything you want here, like your pop up saying wrong paste format or etc
              //     return true;
              //   }, appContext: context,
              // ),
              Visibility(visible:isotpsent,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) => SizedBox(width: 50,
                  child: TextFormField(
                    controller: otpcontroller[index],
                    onChanged: (value){
                      if(value.length==1&&index<=3){
                        FocusScope.of(context).nextFocus();
                      }else if(value.isEmpty&&index>0){
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: '*',
                    ),
                  ),))
                ),
              ),
              (size.height/13).ph,
              CustumButton(text: 'Next',
              onPressed: (){isotpsent=true;
                CustumToast.showMessage(
                message:'sss',
                messageType:MessageType.SUCSSES,);},),
              (size.height/20).ph,
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn\'t Receive? ',  style: TextStyle(
          color: AppColors.greytextColor,
          fontSize: size.height/40,
        ),),
                  TextButton(onPressed:(){Navigator.push(context,
                      MaterialPageRoute(
                        builder:(context)=>NewPasswordView(),
                      ) );},
                      child: Text('Click Here',
                        style: TextStyle(
                          color: AppColors.mainOrangeColor,
                          fontSize: size.height/45,
                        ),) ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//OtpTextField(
//numberOfFields: 4,
//hasCustomInputDecoration: true,
//keyboardType: TextInputType.number,
//decoration:  InputDecoration(
//fillColor: AppColors.textFormColor,
//filled: true,
//border: InputBorder.none,
//hintText: '*',
//hintStyle: TextStyle(color: AppColors.mainOrangeColor),
//),
//),
//Padding(
//padding: EdgeInsets.symmetric(horizontal: 40),
//child: PinCodeTextField(appContext: context, length: 4, onChanged: (value){} ,
//enableActiveFill: true,hintCharacter: '*',
//hintStyle: TextStyle(
//fontSize: size.width/13,

//),
//pinTheme: PinTheme(
//shape: PinCodeFieldShape.box,
//borderRadius: BorderRadius.circular(8),
//fieldWidth: 50,
//inactiveFillColor: AppColors.textFormColor,
//inactiveColor: AppColors.textFormColor,
//activeFillColor: AppColors.mainOrangeColor,
//selectedFillColor: AppColors.mainOrangeColor,
//selectedColor: AppColors.mainOrangeColor,
//),),
//),
