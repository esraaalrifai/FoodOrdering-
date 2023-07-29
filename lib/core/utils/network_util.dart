// import 'dart:convert';
//
// import 'package:foodorderproject/core/enums/request_type.dart';
// import 'package:http/http.dart'as http;
// class NetworkUtil{
//   static String baseUrl='training.owner-tech.com';
//   static var client=http.Client();
//   static Future<dynamic> sendRequest(
//   {
//   required RequestType type,
//   required String url,
//     Map<String,String>?headers,
//     Map<String,dynamic>?body,
//     Map<String,dynamic>?params,
//
// }
//       )
//   async{
//     try{
//       //!Requiered for request
//       //*Make full api url
//       var uri=Uri.https(baseUrl,url,params);
//
//       //?To save api response
//       late http.Response response;
//       //?to save api status code
//       int statusCode=0;
//       //!Required convert api response to map
//       String strResponse='';
//       Map<String,dynamic>jsonResponse={};
//       //*Make call correct request type
//       switch(type)
//
// {
//         case RequestType.POST:
//           response=await client.post(uri, headers: headers,body: jsonEncode(body));
//           break;
//         case RequestType.PUT:
//           response=await client.put(uri,body:jsonEncode(body),headers: headers);
//           break;
//         case RequestType.DELETE:
//           response=await client.delete(uri,body:jsonEncode(body),headers: headers);
//           break;
//         case RequestType.GET:
//           response=await client.get(uri,headers: headers);
//           break;
//       }
//       statusCode=response.statusCode;
//     strResponse=Utf8Codec().decode(response.bodyBytes);
//     jsonResponse.putIfAbsent('response',()=>jsonDecode(strResponse));
//     jsonResponse.putIfAbsent('statusCode',()=>statusCode);
//     return jsonResponse;
//
//   }
//   catch(e){
//     print(e);
//   }
// }}

import 'dart:convert';
import 'package:http_parser/http_parser.dart';

import 'package:foodorderproject/core/enums/request_type.dart';

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class NetworkUtil {
  static String baseUrl = 'training.owner-tech.com';
  //static String baseUrl = 'fakestoreapi.com';
 // static String baseUrl = 'electra-space-api';
  //static String baseUrl = 'jsonplaceholder.typicode.com';
  static var client = http.Client();

  static Future<dynamic> sendRequest({
    required RequestType type,
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
  }) async {
    try {
      //!--- Required for request ----
      //*--- Make full api url ------
      var uri = Uri.https(baseUrl, url, params);

      //?--- To Save api response ----
      late http.Response response;
      //?--- To Save api status code ----

      //!--- Required convert api response to Map ----
      Map<String, dynamic> jsonResponse = {};

      //*--- Make call correct request type ------
      switch (type) {
        case RequestType.GET:
          response = await client.get(uri, headers: headers);
          break;
        case RequestType.POST:
          response =
          await client.post(uri, body: jsonEncode(body), headers: headers);
          break;
        case RequestType.PUT:
          response =
          await client.put(uri, body: jsonEncode(body), headers: headers);
          break;
        case RequestType.DELETE:
          response = await client.delete(uri,
              body: jsonEncode(body), headers: headers);
          break;
      // case RequestType.MULTIPART:
      //   // TODO: Handle this case.
      //   break;
        case RequestType.MULTIPART:
          // TODO: Handle this case.
          break;
      }

      dynamic result;

      try {
        result = jsonDecode(Utf8Codec().decode(response.bodyBytes));
      } catch (e) {}

      jsonResponse.putIfAbsent(
          'response',
              () =>
          result == null
              ?
          {'title': Utf8Codec().decode(response.bodyBytes)}
              : jsonDecode(Utf8Codec().decode(response.bodyBytes)));
      jsonResponse.putIfAbsent('statusCode', () => response.statusCode);

      print(jsonResponse);
      return jsonResponse;
    } catch (e) {
      print(e);
    }
  }

  // static Future<dynamic> postMultipart({
  //   required String url,
  //   Map<String, String>? headers = const {},
  //   Map<String, String>? fields = const {},
  //   Map<String, String>? files = const {},
  //   Map<String, dynamic>? params,
  // }) async {
  //   try {
  //     var request =
  //     http.MultipartRequest('POST', Uri.https(baseUrl, url, params));
  //
  //     var _filesKeyList = files!.keys.toList();
  //     var _filesNameList = files.values.toList();
  //
  //     for (int i = 0; i < _filesKeyList.length; i++) {
  //       if (_filesNameList[i].isNotEmpty) {
  //         var multipartFile = http.MultipartFile.fromPath(
  //           _filesKeyList[i],
  //           _filesNameList[i],
  //           filename: path.basename(_filesNameList[i]),
  //           contentType: getContentType(_filesNameList[i]),
  //         );
  //         request.files.add(await multipartFile);
  //       }
  //     }
  //     request.headers.addAll(headers!);
  //     request.fields.addAll(fields!);
  //
  //     var response = await request.send();
  //
  //     Map<String, dynamic> responseJson = {};
  //     var value = await response.stream.bytesToString();
  //     ;
  //     responseJson.putIfAbsent('statusCode', () => response.statusCode);
  //     responseJson.putIfAbsent('response', () => jsonDecode(value));
  //
  //     return responseJson;
  //   } catch (error) {
  //     print(error.toString());
  //   }
  // }
  //
  // static MediaType getContentType(String name) {
  //   var ext = name.split('.').last;
  //   if (ext == "png" || ext == "jpeg") {
  //     return MediaType.parse("image/jpg");
  //   } else if (ext == 'pdf') {
  //     return MediaType.parse("application/pdf");
  //   } else {
  //     return MediaType.parse("image/jpg");
  //   }
  // }
  static Future<dynamic> sendMultipartRequest({
    required RequestType type,
    required String url,
    Map<String, String>? headers = const {}, //key+vule بتطلع مع --> request
    Map<String, String>? fields = const {}, //key +value --> string (مو file)
    Map<String, String>? files = const {
    }, //value string ( لمرق path ---> الصورة)
    Map<String, dynamic>? params,
  }) async {
    // assert(
    //   type == RequestType.GET || type == RequestType.MULTIPART,
    //   'Focus pls');
    try {
      //*---upload file to server
      var request =
      http.MultipartRequest(type.toString(), Uri.https(baseUrl, url, params));

      //!-- all list (files)

      var _filesKeyList = files!.keys.toList(); //(name file)
      var _filesNameList = files.values.toList(); //(مسار الملف)

      //?---
      for (int i = 0; i < _filesKeyList.length; i++) {
        if (_filesNameList[i].isNotEmpty) {
          var multipartFile = http.MultipartFile.fromPath(
            _filesKeyList[i],
            _filesNameList[i], // path
            filename: path.basename(_filesNameList[i]),
            // بترجع اسم الملف الي بجهاز المستخدم
            contentType: getContentType(_filesNameList[i]),
          );
          request.files.add(await multipartFile);
        }
      }
      request.headers.addAll(headers!);
      request.fields.addAll(fields!);

      var response = await request.send();

      Map<String, dynamic> responseJson = {};

      var value = await response.stream
          .bytesToString(); //convert byte to string
      responseJson.putIfAbsent('statusCode', () => response.statusCode);
      responseJson.putIfAbsent('response', () => jsonDecode(value));

      return responseJson;
    } catch (error) {
      print(error.toString());
    }
  }

  static MediaType getContentType(String name) {
    var ext = name
        .split('.')
        .last;
    if (ext == "png" || ext == "jpeg") {
      return MediaType.parse("image/jpg");
    } else if (ext == 'pdf') {
      return MediaType.parse("application/pdf");
    } else {
      return MediaType.parse("image/jpg");
    }
  }

}

// void test() async {
//   var response = await client.post(Uri.https(baseUrl, 'api/web/user/login'),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode(
//           {"userName": "Test@gmail.com", "password": "Test@1234"}));
//
//   var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
// }
