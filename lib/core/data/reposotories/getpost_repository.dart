import 'package:dartz/dartz.dart';
import 'package:foodorderproject/core/data/models/apis/getphoto_model.dart';
import 'package:foodorderproject/core/data/models/apis/getpost_model.dart';
import 'package:foodorderproject/core/data/models/common_respons.dart';
import 'package:foodorderproject/core/data/network/endpoints/allpost_endpoint.dart';
import 'package:foodorderproject/core/data/network/endpoints/category_endpoints.dart';
import 'package:foodorderproject/core/data/network/network_config.dart';
import 'package:foodorderproject/core/enums/request_type.dart';
import 'package:foodorderproject/core/utils/network_util.dart';

class GetPostRepository {
  Future<Either<String, List<GetPost>>> getAllPost() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: AllPostEndpoints.getAllPost,
        headers: NetworkConfig.getHeaders(needAuth: false ,type: RequestType.GET),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {

          List<GetPost>resultList=[];
          commonResponse.data!.forEach(
                (element)
            { resultList.add(GetPost.fromJson(element));
            },
          );
          return Right(resultList);}
        else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
  Future<Either<String, List<GetphotoModel>>> getAllphoto(
      {
      required int id,
}
      ) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: //('${AllPostEndpoints.getAllphoto}$id/photos'),
          NetworkConfig.getFullApiRoute('/albums/$id/photos'),
        headers: NetworkConfig.getHeaders(needAuth: false ,type: RequestType.GET),
         // params:{ "id":id,}
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {

          List<GetphotoModel>resultList=[];
          commonResponse.data!.forEach(
                (element)
            { resultList.add(GetphotoModel.fromJson(element));
            },
          );
          return Right(resultList);}
        else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
  Future<Either<String, List<GetphotoModel>>> delAllphoto(
      {
        required int id,
      }
      ) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.DELETE,
        url: //('${AllPostEndpoints.getAllphoto}$id/photos'),
        NetworkConfig.getFullApiRoute('/posts/$id'),
        headers: NetworkConfig.getHeaders(needAuth: false ,type: RequestType.DELETE),
        // params:{ "id":id,}
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {

          List<GetphotoModel>resultList=[];
          commonResponse.data!.forEach(
                (element)
            { resultList.remove(GetphotoModel.fromJson(element));
            },
          );
          return Right(resultList);}
        else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}

class GetphotoRepository {

}