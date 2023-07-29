import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:foodorderproject/ui/views/login_view/login_view.dart';
import 'package:image_picker/image_picker.dart';
import '../../shared/colors.dart';
import '../../shared/custum_widget/custm_button.dart';
import '../../shared/custum_widget/custom_form.dart';
import '../../shared/utils.dart';

class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobilenoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool showOption = false;
  FileTypeModel? selectedFile;
   //XFile? choosedImage;
  final ImagePicker picker = ImagePicker();
  // FilePickerResult? result ;
  // File? file;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Form(key: _formKey,
              child: Column(
                children: [
                  Stack(alignment: Alignment.bottomCenter,
                    children: [
              //         InkWell(
              //
              //         onTap: choosedImage==null?(){
              //         setState(() {
              //   showoption=true;
              //         });
              //         }:null,
              //           child: CircleAvatar(backgroundColor: AppColors.mainOrangeColor,
              //             child:
              //               choosedImage==null&& result==null?
              //                 Icon(Icons.image,color: Colors.white,)
              //                   : choosedImage!=null
              //                   ?ClipOval(child: Image.file( width: double.infinity,height:double.infinity,fit:BoxFit.cover,
              //                 File(choosedImage!.path,)))
              //                   : Icon(Icons.file_copy,color: Colors.white,),
              //
              // radius: 50.0,
              //            // child: Image(),
              //           ),
              //         ),
              //         Visibility(visible:choosedImage!=null ,
              //           child: InkWell(onTap: (){
              //             setState(() {
              //               showoption=true;
              //             });
              //           },
              //             child: Padding(
              //               padding: EdgeInsets.only(top: 7.0,
              //               left: 50.0),
              //               child: CircleAvatar(backgroundColor: AppColors.mainOrangeColor,
              //                 radius: 20,
              //                 child:  Icon(Icons.edit,color: AppColors.mainWhiteColor) ,
              //               ),
              //             ),
              //           ),
              //         ),
                    InkWell ( onTap:selectedFile == null
                       ? () {
                       setShowOption(true);
                        }
                        : null,
                        child: CircleAvatar(
                          radius:50.0 ,
                          backgroundColor: AppColors.mainOrangeColor,
                          child:  selectedFile == null || selectedFile!.path.isEmpty
                           ? Icon(Icons.image)
                        : selectedFile!.type != FileType.FILE
                           ? Image.file(File(selectedFile!.path))
                          : Icon(Icons.file_copy),
                        ),
                      ),
                      Visibility(visible:selectedFile!=null ,
                        child: InkWell(onTap: (){ setShowOption(true);},
                          child: CircleAvatar(

                            radius:20.0 ,
                            backgroundColor: AppColors.mainOrangeColor,
                          ),
                        ),
                      ),
                    ],
                  ),
               Visibility(visible: showOption,
                 child: Column(
                   children: [
                     CustumButton(text: 'camera', onPressed: () {
                       pickFile(FileType.CAMERA)
                           .then((value) => selectedFile = value);
                     },),
                     CustumButton(text: 'gallery',onPressed: () {
                       pickFile(FileType.GALLERY)
                           .then((value) => selectedFile = value);
                     },),
                     CustumButton(text: 'file',onPressed: () {
                       pickFile(FileType.FILE)
                           .then((value) => selectedFile = value);
                     },),],),
               ),
    //            Visibility(visible: showoption,
    //              child: Column(
    //                children: [
    //                  CustumButton(text: 'gallery',onPressed: ()async{ choosedImage  = await picker.pickImage(source: ImageSource.gallery);
    //                    setState(() {
    //                      showoption=false;
    //
    //                    });
    // },),
    //                  CustumButton(text: 'camera',onPressed: ()async{choosedImage=
    //                      await picker.pickImage(source: ImageSource.camera);setState(() {
    //
    //                   showoption=false;
    //                  });},),
    //                  CustumButton(text: 'file',
    //                    onPressed: ()async{                       result= await FilePicker.platform.pickFiles();
    //                  if (result != null) {
    //                    file = File(result!.files.single.path!);
    //                    setState(() {
    //                      choosedImage=null;
    //                      showoption=false;
    //
    //                    });
    //                  }
    //
    //
    //                  },),
    //                ],
    //              ),
    //            ),
    //               Stack(children: [
    //                 InkWell(
    //                   onTap: choosedImage == null
    //                       ? () {
    //                     setState(() {
    //                       showoption = true;
    //                     });
    //                   }
    //                       : null,
    //                   child: ClipOval(
    //                     child: CircleAvatar(
    //                         backgroundColor: AppColors.mainOrangeColor,
    //                         child: choosedImage == null
    //                             ? Icon(
    //                           Icons.image,
    //                         )
    //                             : ClipOval(
    //                           child: Image.file(File(choosedImage!.path)),
    //                         ),
    //                         radius: 80),
    //                   ),
    //                 ),
    //                 Visibility(
    //                     visible: choosedImage != null,
    //                     child: InkWell(
    //                       onTap: (() {
    //                         setState(() {
    //                           showoption = true;
    //                         });
    //                       }),
    //                       child: CircleAvatar(
    //                           radius: 40,
    //                           backgroundColor: AppColors.mainOrangeColor,
    //                           child: Icon(Icons.edit)),
    //                     ))
    //               ]),
    //               Visibility(
    //                 visible: showoption,
    //                 child: Column(
    //                   children: [
    //                     // Image.file(choosedimage),
    //                     CustumButton(
    //                       text: "camera",
    //                       onPressed: () async {
    //                         choosedImage =
    //                         await picker.pickImage(source: ImageSource.camera);
    //                         setState(() {
    //                           showoption = false;
    //                         });
    //                       },
    //                     ),
    //                     // =>
    //                     // choosedimage = ImagePicker()
    //                     //     .pickImage(source: ImageSource.camera)),
    //                     CustumButton(
    //                       text: "gallery",
    //                       onPressed: () {
    //                         setState(() {
    //                           showoption = false;
    //                         });
    //                       },
    //                     ),
    //                   ],
    //                 ),
    //               ),
                  Text('Sign Up',
                    style: TextStyle(
                      color: AppColors.blacktextColor,
                      fontSize: size.height/20,
                      fontWeight:FontWeight.bold,
                    ),),
                  (size.height/70).ph,
                  Text('Add your details to sign up',
                    style: TextStyle(
                      color: AppColors.greytextColor,
                      fontSize: size.height/40,
                    ),),
                  (size.height/30).ph,
                  CustomForm(
                    hinttext:'Name ',
                    controller: nameController,
                    textinputtype: TextInputType.name,
                    validate: (value){
                      if(value!.isEmpty || !isName(value)){
                        return 'please check your name';
                      }
                      return null;
                    },
                  ),
                  (size.height/60).ph,
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
                  (size.height/60).ph,
                  CustomForm(
                    hinttext:'Mobile No ',
                    controller: mobilenoController,
                    textinputtype: TextInputType.number,
                    validate: (value){
                      if(value!.isEmpty || !isValidSyriaMobileNumber(value)){
                        return 'please check your number';
                      }
                      return null;
                    },

                  ),
                  (size.height/60).ph,
                  CustomForm(
                    hinttext:'Address ',
                    controller:addressController,
                    textinputtype: TextInputType.visiblePassword,
                  ),
                  (size.height/60).ph,
                  CustomForm(
                    hinttext:'Password ',
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
                  (size.height/60).ph,
                  CustumButton(
                    text: 'Sign Up',
                    onPressed:(){if(_formKey.currentState!.validate()){
                      print('value true');
                    }
                    print('value false :(');
                    },
                  ),
                  (size.height/60).ph,
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an Account?',
                        style: TextStyle(
                          color: AppColors.greytextColor,
                          fontSize: size.height/40,
                        ),),

                      TextButton(onPressed:(){Navigator.push(context,
                          MaterialPageRoute(
                            builder:(context)=>LoginView(),
                          ) );},
                          child: Text('Login',
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

    ));
  }
  Future <FileTypeModel>pickFile(FileType type)async{


    String?path;
    switch(type){

      case FileType.CAMERA:
        await picker.pickImage(source: ImageSource.camera).then((value) => path = value?.path ?? '');
        break;
      case FileType.GALLERY:
        await picker.pickImage(source: ImageSource.gallery).then((value) => path = value?.path ?? '');
        break;
      case FileType.FILE:
        await FilePicker.platform
            .pickFiles()
            .then((value) => path = value?.paths[0] ?? '');
        break;
    }
    setShowOption(false);
    return FileTypeModel(type, path??'');
  }

  void setShowOption(bool value) {
    setState(() {
      showOption = value;
    });
  }


}
//extension EmptyPadding on num{
  //SizedBox get ph => SizedBox(height:toDouble(),);
  //SizedBox get pw => SizedBox(width: toDouble(),);
//}


enum FileType {
  CAMERA,
  GALLERY,
  FILE,
}

class FileTypeModel{
  FileType type;
  String path;
  FileTypeModel(this.type,this.path);
}
