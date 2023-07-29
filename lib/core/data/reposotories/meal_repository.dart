import 'package:dartz/dartz.dart';
import 'package:foodorderproject/core/data/models/apis/meal_model.dart';
import 'package:foodorderproject/core/data/models/common_respons.dart';
import 'package:foodorderproject/core/data/network/endpoints/meal_endpoints.dart';
import 'package:foodorderproject/core/data/network/network_config.dart';
import 'package:foodorderproject/core/enums/request_type.dart';
import 'package:foodorderproject/core/utils/network_util.dart';

class MealRepository {
  Future<Either<String, List<MealModel>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: MealEndpoints.getAll,
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<MealModel> result = [];
          commonResponse.data!.forEach(
                (element) {
              result.add(MealModel.fromJson(element));
            },
          );
          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}