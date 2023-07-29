// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
//
// class HomeView extends StatefulWidget {
//   const HomeView({super.key, //required this.onMenuTap,
//    });
// //final Function onMenuTap;
//   @override
//   State<HomeView> createState() => _HomeViewState();
// }
//
// class _HomeViewState extends State<HomeView> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(onTap: (){
//
//       // widget.onMenuTap();
//
//     },
//         child: Center(child: Text('home'),));
//   }
// }
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// // import 'package:food_ordering_sp1/core/data/models/apis/category_model.dart';
// // import 'package:food_ordering_sp1/core/data/repositories/category_repository.dart';
// // import 'package:food_ordering_sp1/core/data/repositories/shared_prefrence_repository.dart';
// // import 'package:food_ordering_sp1/core/enums/message_type.dart';
// // import 'package:food_ordering_sp1/ui/shared/colors.dart';
// // import 'package:food_ordering_sp1/ui/shared/custom_widgets/custom_button.dart';
// // import 'package:food_ordering_sp1/ui/shared/custom_widgets/custom_toast.dart';
// import 'package:foodorderproject/core/data/models/apis/category_model.dart';
// import 'package:foodorderproject/core/data/reposotories/category_repository.dart';
// import 'package:foodorderproject/core/enums/message_type.dart';
// import 'package:foodorderproject/ui/shared/colors.dart';
// import 'package:foodorderproject/ui/shared/custum_widget/custm_button.dart';
// import 'package:foodorderproject/ui/shared/custum_widget/customtoast.dart';
// import 'package:foodorderproject/ui/views/login_view/login_view.dart';
//
// class HomeView extends StatefulWidget {
//   //final Function() onMenuTap;
//   HomeView({Key? key, //required this.onMenuTap
//   }) : super(key: key);
//
//   @override
//   State<HomeView> createState() => _HomeViewState();
// }
//
// class _HomeViewState extends State<HomeView> {
//   List<CategoryModels> categoryList = [];
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     return Column(
//       children: [
//         Visibility(
//           visible: categoryList.length == 0,
//           child: CustumButton(
//             text: 'Get Categories',
//             onPressed: () {
//               CategoryRepository().getAll().then((value) {
//                 value.fold((l) {
//                   CustumToast.showMessage(
//                       size: size,
//                       message: l,
//                       messageType: MessageType.REJECTED);
//                 }, (r) {
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   setState(() {});
//                 });
//               });
//             },
//           ),
//         ),
//         Visibility(
//           visible: categoryList.length > 0,
//           child: Container(height: 200,
//             child: ListView.separated(
//               shrinkWrap: true,
//               itemCount: categoryList.length,
//               itemBuilder:(context, index) {
//                 return Column(
//                   children: [
//                     CachedNetworkImage(imageUrl: 'http://via.placeholder.com/350x150',
//                     placeholder: (context,url)=>CircularProgressIndicator(),
//                     errorWidget: (context,url,error)=>Icon(Icons.error),
//                     ),
//                     Text(categoryList[index].name??'',
//                     style: TextStyle(fontSize: 50),),
//                   ],
//                 );
//               },
//               separatorBuilder: (context,index) => (size.width/15).pw,
//               scrollDirection:Axis.horizontal,
//              addAutomaticKeepAlives:true ,
//               // itemBuilder: (BuildContext context, int index) {
//               //   return Text(
//               //     categoryList[index].name ?? '',
//               //     style: TextStyle(fontSize: 60),
//               //   );
//               // },
//               // separatorBuilder: (BuildContext context, int index) {
//               //   return Container(
//               //     width: 100,
//               //     height: 5,
//               //     color: AppColors.mainOrangeColor,
//               //   );
//               // },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
// Widget food()=>  Row(
//   children: [
//     Column(
//       children: [
//         Image.asset('images/photo_1.jpg',
//           height: 90,
//           width: 70,),
//         //SvgPicture.asset('images/rejected-01.svg'),
//         Text('offers'),
//       ],
//     ),
//   ],
// );

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodorderproject/core/data/models/apis/category_model.dart';
import 'package:foodorderproject/core/data/models/apis/meal_model.dart';
import 'package:foodorderproject/core/data/reposotories/category_repository.dart';
import 'package:foodorderproject/core/data/reposotories/meal_repository.dart';
import 'package:foodorderproject/core/enums/message_type.dart';
import 'package:foodorderproject/ui/shared/colors.dart';
import 'package:foodorderproject/ui/shared/custum_widget/custom_form.dart';
import 'package:foodorderproject/ui/shared/custum_widget/customtoast.dart';
import 'package:foodorderproject/ui/shared/utils.dart';
import 'package:foodorderproject/ui/views/login_view/login_view.dart';
import 'package:foodorderproject/ui/views/main_view/home_view/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  final Function onPressed;
  HomeView({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller=Get.put(HomeController());
  // List<CategoryModels> categoryList = [];
  // List<MealModel> mealList = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                //(size.height/25).pw,
                Text('Good morning Akila!',style: TextStyle(
                  color: AppColors.blacktextColor,
                  fontSize: size.width/16,)),
                (size.width/5).pw,
                IconButton(onPressed: (){},
                  icon:  Icon(Icons.shopping_cart,color: AppColors.blacktextColor,
                    size: size.width/14,),),
              ],
            ),
            Obx(() {
              return Icon(
                controller.isOnlne.value ? Icons.wifi : Icons.wifi_off,
                color: controller.isOnlne.value ? Colors.green : Colors.red,
                size: screenWidth(10),
              );
            }),
            (size.width/29).ph,
            Text('Delivering to',
              style: TextStyle(
                color: AppColors.hintTextColor,
                fontSize: size.height/50,),
            ),
            (size.width/40).ph,
            CustomForm(hinttext: 'Search food',padding: EdgeInsets.symmetric(horizontal: size.width/40,),
                prifex: Icons.search),
            (size.width/60).ph,
            Obx(() {
              return// controller.RequestStatus== RequestStatus.LOADING
                controller.isCategoryLoading
                  ? SpinKitCircle(
                color: AppColors.mainOrangeColor,
              )
                  : Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount:controller.categoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          child: CachedNetworkImage(
                            imageUrl:'https://training.owner-tech.com/Images/91b43499-de8b-4d6d-9af8-3f18872bdc5c.png',
                            // 'http://via.placeholder.com/350x150',
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          height: size.width/5,
                          width: size.width/3,
                        ),
                        Text(
                          controller.categoryList[index].name ?? '',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    );
                  },
                ),
              );
            }),
            Obx(() {
              return controller.isMealLoading
                  ? SpinKitCircle(
                color: AppColors.mainOrangeColor,
              )
                  : Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.mealList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          child: CachedNetworkImage(
                            imageUrl:'https://training.owner-tech.com/Images/91b43499-de8b-4d6d-9af8-3f18872bdc5c.png',
                            //  'http://via.placeholder.com/350x150',
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          height: size.width/2,
                          width: size.width,   ),
                        Text(
                         controller. mealList[index].name ?? '',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    );
                  },
                ),
              );
            })
          ],
        ),
        // FutureBuilder<List<dynamic>>(
        //     future: Future.wait([
        //       CategoryRepository().getAll(),
        //       MealRepository().getAll(),
        //     ]),
        //     builder: ((context, AsyncSnapshot<List<dynamic>> snapshot1) {
        //       var categories = snapshot1.data != null
        //           ? snapshot1.data![0]
        //               as dartz.Either<String, List<CategoryModels>>
        //           : null;
        //       var meals = snapshot1.data != null
        //           ? snapshot1.data![1]
        //               as dartz.Either<String, List<MealModel>>
        //           : null;
        //
        //       if (snapshot1.connectionState != ConnectionState.waiting) {
        //         categories!.fold((l) {
        //           CustumToast.showMessage(
        //
        //               message: l,
        //               messageType: MessageType.REJECTED);
        //         }, (r) {
        //           categoryList.clear();
        //           categoryList.addAll(r);
        //         });
        //
        //         meals!.fold((l) {
        //           CustumToast.showMessage(
        //
        //               message: l,
        //               messageType: MessageType.REJECTED);
        //         }, (r) {
        //           mealList.clear();
        //           mealList.addAll(r);
        //         });
        //       }
        //
        //       return Padding(
        //         padding:  EdgeInsetsDirectional.only(
        //           start: size.height/25,
        //           top: size.height/70,
        //         ),
        //         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Row(
        //               children: [
        //                 //(size.height/25).pw,
        //                 Text('Good morning Akila!',style: TextStyle(
        //                   color: AppColors.blacktextColor,
        //                   fontSize: size.width/16,)),
        //                 (size.width/5).pw,
        //                 IconButton(onPressed: (){},
        //                   icon:  Icon(Icons.shopping_cart,color: AppColors.blacktextColor,
        //                     size: size.width/14,),),
        //               ],
        //             ),
        //             (size.width/29).ph,
        //             Text('Delivering to',
        //               style: TextStyle(
        //                 color: AppColors.hintTextColor,
        //                 fontSize: size.height/50,),
        //             ),
        //             (size.width/40).ph,
        //             CustomForm(hinttext: 'Search food',padding: EdgeInsets.symmetric(horizontal: size.width/40,),
        //                 prifex: Icons.search),
        //             (size.width/60).ph,
        //             categories == null
        //                 ? SpinKitCircle(
        //                     color: AppColors.mainOrangeColor,
        //                   )
        //                 : Expanded(
        //                     child: ListView.builder(
        //                       scrollDirection: Axis.horizontal,
        //                       shrinkWrap: true,
        //                       itemCount: categoryList.length,
        //                       itemBuilder: (BuildContext context, int index) {
        //                         return Column(
        //                           children: [
        //                             Container(
        //                               child: CachedNetworkImage(
        //                                 imageUrl:'https://training.owner-tech.com/Images/91b43499-de8b-4d6d-9af8-3f18872bdc5c.png',
        //                                     // 'http://via.placeholder.com/350x150',
        //                                 placeholder: (context, url) =>
        //                                     CircularProgressIndicator(),
        //                                 errorWidget: (context, url, error) =>
        //                                     Icon(Icons.error),
        //                               ),
        //                               height: size.width/5,
        //                               width: size.width/3,
        //                             ),
        //                             Text(
        //                               categoryList[index].name ?? '',
        //                               style: TextStyle(fontSize: 30),
        //                             ),
        //                           ],
        //                         );
        //                       },
        //                     ),
        //                   ),
        //             meals == null
        //                 ? SpinKitCircle(
        //                     color: AppColors.mainOrangeColor,
        //                   )
        //                 : Expanded(
        //                     child: ListView.builder(
        //                       scrollDirection: Axis.vertical,
        //                       shrinkWrap: true,
        //                       itemCount: mealList.length,
        //                       itemBuilder: (BuildContext context, int index) {
        //                         return Column(
        //                           children: [
        //                             Container(
        //                               child: CachedNetworkImage(
        //                                 imageUrl:'https://training.owner-tech.com/Images/91b43499-de8b-4d6d-9af8-3f18872bdc5c.png',
        //                                   //  'http://via.placeholder.com/350x150',
        //                                 placeholder: (context, url) =>
        //                                     CircularProgressIndicator(),
        //                                 errorWidget: (context, url, error) =>
        //                                     Icon(Icons.error),
        //                               ),
        //                               height: size.width/2,
        //                               width: size.width,   ),
        //                             Text(
        //                               mealList[index].name ?? '',
        //                               style: TextStyle(fontSize: 30),
        //                             ),
        //                           ],
        //                         );
        //                       },
        //                     ),
        //                   ),
        //           ],
        //         ),
        //       );
        //     }))
    );
  }
}
