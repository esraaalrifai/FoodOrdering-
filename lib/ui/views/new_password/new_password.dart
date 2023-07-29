

import 'package:flutter/material.dart';
import 'package:foodorderproject/ui/shared/colors.dart';
import 'package:foodorderproject/ui/shared/custum_widget/custm_button.dart';
import 'package:foodorderproject/ui/shared/custum_widget/custom_form.dart';
import 'package:foodorderproject/ui/shared/utils.dart';
import 'package:foodorderproject/ui/views/login_view/login_view.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({Key? key}) : super(key: key);

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}  TextEditingController passwordController = TextEditingController();
TextEditingController confirmController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _NewPasswordViewState extends State<NewPasswordView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height/60),
          child: Form(key: _formKey,
            child: Column(
              children: [
                Text('New Password',
                  style: TextStyle(
                    color: AppColors.blacktextColor,
                    fontSize: size.height/20,
                    fontWeight:FontWeight.bold,
                  ),),
                (size.height/70).ph,
                Text('Please enter your email to receive a \n link to create a new password via email',textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.greytextColor,
                    fontSize: size.height/40,
                  ),),
                (size.height/25).ph,
                CustomForm(
                  hinttext:'New Password ',
                  textinputtype: TextInputType.visiblePassword,
                  controller: passwordController,
                  validate: (value){
                    if(value!.isEmpty || !isValidPassword(value,value)){
                      return 'please check your password';
                    }
                    return null;
                  },
                ),
                (size.height/60).ph,
                CustomForm(
                  hinttext:'Confirm Password ',
                  controller: confirmController,
                  textinputtype: TextInputType.visiblePassword,
                  validate: (value){
                    if(value!.isEmpty || !isValidPassword(value,value)){
                      return 'please check your password';
                    }
                    return null;
                  },
                ),
                (size.height/40).ph,
                CustumButton(text: 'Next',onPressed:(){Navigator.push(context,
                    MaterialPageRoute(
                      builder:(context)=>LoginView(),
                    ) );},),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
