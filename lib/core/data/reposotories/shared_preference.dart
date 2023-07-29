import 'dart:convert';

import 'package:foodorderproject/core/data/models/apis/card_model.dart';
import 'package:foodorderproject/core/data/models/apis/token_info.dart';
import 'package:foodorderproject/core/enums/data_type.dart';
import 'package:foodorderproject/main.dart';
import 'package:foodorderproject/ui/shared/utils.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferenceRepositry {
   SharedPreferences globalSharedPreference=Get.find();
   String PREF_FIRST_LUNCH = 'first_lunch';
   String PREF_LOG_IN_KEY ='log_in';
   String PREF_TOKEN ='token';
   static String PREF_APP_LANG = 'app_language';
   static String PREF_CART_LIST = 'cart_list';
   String PREF_SUB_STATUS = 'sub_status';


   void setSubStatus(bool value) {
     setPreference(
       dataType: DataType.BOOL,
       key: PREF_SUB_STATUS,
       value: value,
     );
   }

   bool getSubStatus() {
     if (Get.find<SharedPreferences>().containsKey(PREF_SUB_STATUS)) {
       return getPreference(key: PREF_SUB_STATUS);
     } else {
       return true;
     }
   }
   void setCartList(List<CartModel> list) {
     setPreference(
         dataType: DataType.STRING,
         key: PREF_CART_LIST,
         value: CartModel.encode(list));
   }

   List<CartModel> getCartList() {
     if (globalSharedPreference.containsKey(PREF_CART_LIST)) {
       return CartModel.decode(getPreference(key: PREF_CART_LIST));
     } else {
       return [];
     }
   }

    setAppLanguage(String value) {
     setPreference(
       dataType: DataType.STRING,
       key: PREF_APP_LANG,
       value: value,
     );
   }

   String getAppLanguage() {
     if (globalSharedPreference.containsKey(PREF_APP_LANG)) {
       return getPreference(key: PREF_APP_LANG);
     } else {
       return 'ar';
     }
   }

   void setTokenInfo(TokenInfo value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_TOKEN,
      value: jsonEncode(value.toJson()),
    );
  }

   TokenInfo? getTokenInfo() {
    if (globalSharedPreference.containsKey(PREF_TOKEN)) {
      return TokenInfo.fromJson(
        jsonDecode(getPreference(key: PREF_TOKEN)),
      );
    } else {
      return null;
    }
  }
   bool get isLoggedIn=>getTokenInfo()!=null?true:false;

   void setFirstLunch(bool value) async{
    setPreference(
      dataType: DataType.BOOL,
      key: PREF_FIRST_LUNCH,
      value: value,
    );
  }
   bool getFirstLunch() {
    if (globalSharedPreference.containsKey(PREF_FIRST_LUNCH)) {
      return getPreference(key: PREF_FIRST_LUNCH);
    }
    else {
      return true;
    }
  }
  // static void setlogin(bool value) async{
  //   setPreference(
  //     dataType: DataType.BOOL,
  //     key: PREF_LOG_IN_KEY,
  //     value: value,
  //   );
  // }
  // static bool getlogin() {
  //   if (globalSharedPreference.containsKey(PREF_LOG_IN_KEY)) {
  //     return getPreference(key: PREF_LOG_IN_KEY);
  //   }
  //   else {
  //     return false;
  //   }
  // }


  setPreference({
    required DataType dataType,
    required String key,
    required dynamic value
  }) async {
    switch (dataType) {
      case DataType.INT:
      // TODO: Handle this case.
        await globalSharedPreference.setInt(key, value);
        break;
      case DataType.STRING:
      // TODO: Handle this case.
        await globalSharedPreference.setString(key, value);

        break;
      case DataType.BOOL:
      // TODO: Handle this case.
        await globalSharedPreference.setBool(key, value);

        break;
      case DataType.DOUBLE:
      // TODO: Handle this case.
        await globalSharedPreference.setDouble(key, value);

        break;
      case DataType.STRINGLIST:
      // TODO: Handle this case.
        await globalSharedPreference.setStringList(key, value);

        break;
    }
  }
   dynamic getPreference({required String key}){
    return globalSharedPreference.get(key);
  }
}