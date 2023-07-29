import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:foodorderproject/core/enums/connectivitystatus.dart';
import 'package:foodorderproject/core/translation/app_translation.dart';
import 'package:foodorderproject/ui/shared/utils.dart';
import 'package:foodorderproject/ui/views/splash_screen/splash_screen_view.dart';

//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       translations: AppTranslation(),//رح مرق فيه كلشي لغات ممكنة
//       locale: getLocal(),//كتابة الكلمات من اليسار الى اليمين او من اليمين لليسار
//       fallbackLocale: getLocal(),//الlocal بيقرا اول مرة بشغل المشروع اما هي بيقراها هو والمشروع شغال بتعمل ابديت للغة بال runtimeبالواجهة يلي هيي فيا
//       title: 'Flutter Demo',
//      builder: BotToastInit(),
//       navigatorObservers: [
//         BotToastNavigatorObserver()
//       ],
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),debugShowCheckedModeBanner: false,
//       home: LoginView(),
//       // translations: ,//الترجمة
//       // locale: ,//من اليمين ليسار (الاتجاهات)
//       // fallbackLocale: ,
//     );
//   }
// }
// Locale getLocal() {
//   if (storage.getAppLanguage() == 'ar') {
//     return Locale('ar', 'SA');
//   } else {
//     return Locale('en', 'US');
//   }
// }

import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
        initialData: ConnectivityStatus.ONLINE,
        create: (context) =>
        connectivityService.connectivityStatusController.stream,
        child: GetMaterialApp(
            defaultTransition: Transition.circularReveal,
            transitionDuration: Duration(milliseconds: 12),
            title: 'Flutter Demo',
            builder: BotToastInit(),
            locale: getLocal(),
            fallbackLocale: getLocal(),
            translations: AppTranslation(), //1. call BotToastInit
            navigatorObservers: [BotToastNavigatorObserver()],
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SplashScreenView()));
  }
}

Locale getLocal() {
  if (storage.getAppLanguage() == 'ar') {
    return Locale('ar', 'SA');
  } else if (storage.getAppLanguage() == 'tr') {
    return Locale('tr', 'TR');
  } else {
    return Locale('en', 'US');
  }
}