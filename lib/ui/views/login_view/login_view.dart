
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodorderproject/app/my_app.dart';
import 'package:foodorderproject/core/data/reposotories/shared_preference.dart';
import 'package:foodorderproject/core/data/reposotories/user_repository.dart';
import 'package:foodorderproject/core/enums/message_type.dart';
import 'package:foodorderproject/core/data/reposotories/shared_preference.dart';
import 'package:foodorderproject/core/enums/request_type.dart';
import 'package:foodorderproject/core/translation/app_translation.dart';
import 'package:foodorderproject/core/utils/network_util.dart';
import 'package:foodorderproject/ui/shared/colors.dart';
import 'package:foodorderproject/ui/shared/custum_widget/custm_button.dart';
import 'package:foodorderproject/ui/shared/custum_widget/customtoast.dart';
import 'package:foodorderproject/ui/shared/custum_widget/custom_form.dart';

import 'package:foodorderproject/ui/shared/utils.dart';
import 'package:foodorderproject/ui/views/login_view/login_controller.dart';
import 'package:foodorderproject/ui/views/main_view/main_view.dart';
import 'package:foodorderproject/ui/views/reset_password_view/reset_password.dart';

import 'package:foodorderproject/ui/views/signin_view/signin_view.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {


  LoginController controller=Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
   // return GetBuilder<LoginController>(init:LoginController
    // builder:(controller){} );
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Form(
            key:controller.formKey,
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: size.height/60),
              child: Column(
                children: [
                  Text('Login',
                  style: TextStyle(
                    color: AppColors.blacktextColor,
                    fontSize: size.height/20,
                    fontWeight:FontWeight.bold,
                  ),),
                  (size.height/70).ph,
                  Text('Add your details to login',
                  style: TextStyle(
                    color: AppColors.greytextColor,
                    fontSize: size.height/40,
                  ),),
                  (size.height/25).ph,

                  CustomForm(
                    controller:controller.emailController,
                    hinttext:' Your Email',
                    textinputtype: TextInputType.emailAddress,
                    validate: (value){
                      if(value!.isEmpty || !isEmail(value)){
                        return 'please check your email';
                      }
                      return null;
                    },
                  ),
                  (size.height/40).ph,
                  CustomForm(
                    controller:controller.passwordController,
                    hinttext:'Password ',
                    textinputtype: TextInputType.visiblePassword,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your password';
                      }
                    },
                  ),
                  (size.height/40).ph,
                  IconButton(
                    icon: Icon(
                      Icons.language,
                    ),
                    onPressed: () {
                      Get.defaultDialog(
                          title: 'Change Language',
                          content: Column(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    storage.setAppLanguage(
                                        'en');
                                    Get.updateLocale(getLocal());
                                    Get.back();
                                  },
                                  child: Text('English')),
                              TextButton(
                                  onPressed: () {
                                    storage.setAppLanguage(
                                        'ar');
                                    Get.updateLocale(getLocal());
                                    Get.back();
                                  },
                                  child: Text('العربية')),
                            ],
                          ));
                    },
                  ),
                  Obx(() {
                    return controller.isLoading.value?SpinKitThreeBounce(color:AppColors.mainOrangeColor,):
                    CustumButton(text: tr("key_login"),//"key_login".tr
                      onPressed: () {controller.login();
                      //customLoader();
                        // setState(() {
                        //   controller.isLoading.value = true;
                        // });
                        // UserRepository()
                        //     .login(
                        //     email: emailController.text,
                        //     password: passwordController.text)
                        //     .then((value) {
                        //   value.fold((l) {
                        //     setState(() {
                        //       controller.isLoading.value = false;
                        //     });
                        //     CustumToast.showMessage(
                        //         messageType: MessageType.REJECTED,
                        //         size: size,
                        //         message: l);
                        //   },
                        //           (r) {
                        //     SharedPreferenceRepositry.setTokenInfo(r);
                        //    // SharedPreferenceRepositry.setisLoggedIn(true);
                        //     Navigator.pushReplacement(context,
                        //         MaterialPageRoute(
                        //           builder: (context) {
                        //             return MainView();
                        //           },
                        //         ));
                        //   });
                        // });

                        // NetworkUtil.sendRequest(  type: RequestType.POST,
                        //   url: 'api/web/user/login',                        body: {
                        //     "userName": "Test@gmail.com",                          "password": "Test@1234"
                        //   },                        headers: {
                        //     "Content-Type": "application/json"                        });
                        // if(_formKey.currentState!.validate()&&SharedPreferenceRepositry. getlogin()) {
                        //   [ CustumToast.showMessage(
                        //     size:size,
                        //     message:'sss',
                        //     messageType:MessageType.SUCSSES,
                        //   ),
                        //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                        //   {return MainView();},
                        //   )),
                        // ];
                        //
                        // } else
                        //   {[
                        //     CustumToast.showMessage(
                        //       size:size,
                        //       message:'sss',
                        //       messageType:MessageType.REJECTED,
                        //     ),
                        //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        //   return MainView();
                        //   })),
                        //   ];
                        //   }
                        // SharedPreferenceRepositry.setlogin(true);
                      },);
                  }),
                  (size.height/60).ph,
                  TextButton(onPressed:(){Navigator.push(context,
                      MaterialPageRoute(
                        builder:(context)=>ResetPasswordView(),
                      ) );},
                      child: Text('Forgot your password?',
                        style: TextStyle(
                          color: AppColors.greytextColor,
                          fontSize: size.height/45,
                        ),) ),
                  (size.height/40).ph,
                  Text('or Login With',
                    style: TextStyle(
                      color: AppColors.greytextColor,
                      fontSize: size.height/40,
                    ),),
                  (size.height/30).ph,
                  CustumButton(
                    text: 'Login with Facebook',
                    backgroundColor: AppColors.blueColor,
                    borderColor: AppColors.blueColor,
                    imageName:'Facebook.svg' ,
                  ),
                  (size.height/40).ph,
                  CustumButton(
                    text: 'Login with Google',
                    backgroundColor: AppColors.redColor,
                    borderColor: AppColors.redColor,
                    imageName:'google-plus-logo.svg',
                  ),
                  //(size.height/40).ph,
                  Spacer(),
                   Row( mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('Don\'t have an Account? ',
                         style: TextStyle(
                           color: AppColors.greytextColor,
                           fontSize: size.height/40,
                         ),),
                       TextButton(onPressed:(){Navigator.push(context,
                           MaterialPageRoute(
                             builder:(context)=>SigninView(),
                           ) );},
                           child: Text('Sign Up',
                       style: TextStyle(
                         color: AppColors.mainOrangeColor,
                         fontSize: size.height/40,
                         fontWeight: FontWeight.bold,
                       ),) ),
                     ],
                   ),
                ],
              ),
            ),
          ),
        ),
        
      ),
    );
  }
}
extension EmptyPadding on num{
  SizedBox get ph => SizedBox(height:toDouble(),);
  SizedBox get pw => SizedBox(width: toDouble(),);
}
//extension uu on BuildContext{
  //MediaQueryData get mediaQuery => MediaQuery.of(this);
  //SizedBox  sh(double value) =>  SizedBox(height:this.MediaQuery.size.height*value);
  //double get sw =>  MediaQuery.of(this).size.width;
//}
