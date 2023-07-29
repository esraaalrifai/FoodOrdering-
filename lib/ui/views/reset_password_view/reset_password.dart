import 'package:flutter/material.dart';
import 'package:foodorderproject/ui/shared/colors.dart';
import 'package:foodorderproject/ui/shared/custum_widget/custm_button.dart';
import 'package:foodorderproject/ui/shared/custum_widget/custom_form.dart';
import 'package:foodorderproject/ui/shared/utils.dart';
import 'package:foodorderproject/ui/views/login_view/login_view.dart';
import 'package:foodorderproject/ui/views/verefication_code_view/verefication_code_view.dart';


class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      body: Center(
        child: Form(key: _formKey,
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: size.height/60 ),
            child: Column(
              children: [
                Text('Reset Password',
                  style: TextStyle(
                    color: AppColors.blacktextColor,
                    fontSize: size.height/20,
                    fontWeight:FontWeight.bold,
                  ),),
                (size.height/70).ph,
                Text('Please enter your email to receive a \n''link to create a new password via email',
                  style: TextStyle(
                    color: AppColors.greytextColor,
                    fontSize: size.height/40,
                  ),),
                (size.height/25).ph,
                CustomForm(
                  hinttext:'Email ',
                  controller: emailController,
                  textinputtype: TextInputType.emailAddress,
                  validate: (value){
                    if(value!.isEmpty || !isEmail(value)){
                      return 'please check your email';
                    }
                    return null;
                  },
                ),
                (size.height/40).ph,
                CustumButton(
                  text: 'Send',
                  onPressed:(){if(_formKey.currentState!.validate()){
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder:(context)=>VereficationCodeView(),
                        ) );
                  }
                  print('value false :(');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
