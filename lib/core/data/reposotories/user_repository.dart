import 'package:dartz/dartz.dart';
import 'package:foodorderproject/core/data/models/apis/token_info.dart';
import 'package:foodorderproject/core/data/models/common_respons.dart';
import 'package:foodorderproject/core/data/network/endpoints/user_endpoints.dart';
import 'package:foodorderproject/core/data/network/network_config.dart';
import 'package:foodorderproject/core/enums/request_type.dart';
import 'package:foodorderproject/core/utils/network_util.dart';

class UserRepository {
  Future<Either<String, TokenInfo>> login({
    required String email,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: UserEndpoints.login,
          headers: NetworkConfig.getHeaders(needAuth: false
         // extraHeaders: {language:ar},
          ),
          body: {
            'userName': email,
            'password': password,
          }).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(
            commonResponse.data ?? {},
          ));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
  Future<Either<String, bool>> register({
    //required String email,
   // required String password,
    required String lastname,
    required String firstname,
   // required int age,
    required String photo,

  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(

        type: RequestType.POST,
        url: UserEndpoints.register,

        fields: {
         // 'Email': email,
          'FirstName': firstname,
          'LastName': lastname,
         // 'Password': password,
          //'Age': age.toString(),
        },
        files: {"Images":photo},
        headers: NetworkConfig.getHeaders(needAuth: false,),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message ?? ''); //رسالة الخطأ
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

}