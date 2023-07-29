

import 'package:foodorderproject/core/enums/request_type.dart';
import 'package:foodorderproject/ui/shared/utils.dart';


class NetworkConfig{
  static String BASE_API='api/web/';
 // static String BASE_API='products/';
  //static String BASE_API='api/v1/';
 // static String BASE_API='';


  static String getFullApiRoute(String apiroute){
    return BASE_API+ apiroute;
  }
  static Map<String,String>getHeaders({
  bool? needAuth=true,
  RequestType?type,
  Map<String,String>?extraHeaders
}){
    return {
      if(needAuth!)"Authorization":
          "Bearer ${storage.getTokenInfo()?.accessToken??''}"
        ,if (type!=RequestType.GET)
          "Content-Type" : "application/json",
      ...extraHeaders??{}
    };
  }
}