import 'package:bot_toast/bot_toast.dart';
import 'package:foodorderproject/core/enums/operation_type.dart';
import 'package:foodorderproject/core/enums/request_status.dart';
import 'package:foodorderproject/ui/shared/utils.dart';
import 'package:get/get.dart';
//
// class BaseController extends GetxController{
// var requestStatus =RequestStatus.DEFAULT.obs;
// var operationType= OperationType.NONE.obs;
//
// set setRequestStatus (RequestStatus value){
//   requestStatus.value=value;
// }
//
// set setOperationType (OperationType  value){
//   operationType .value=value;
// }
// Future runFutureFunction({
//   required Future function,
//   OperationType? type=  OperationType.NONE
// }
// )async{
//   await function;
// }
// Future runFutureFunctionWithLoading({
//   required Future function,
//   OperationType? type=  OperationType.NONE
// })async{
//   setRequestStatus=RequestStatus.LOADING;
//   setOperationType = type!;
//   await function;
//   setRequestStatus=RequestStatus.DEFAULT;
//   setOperationType=OperationType.NONE;
//
// }
//
// Future runFullLoadingFutureFunction(
// {required Future function,
//   OperationType? type=  OperationType.NONE
// })async{
//   customLoader();
//   await function;
//   BotToast.closeAllLoading();
// }
// }


import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  var requestStatus = RequestStatus.DEFAULT.obs;
  var opertionType = OpertionType.NONE.obs;

  set setRequestStatus(RequestStatus value) {
    requestStatus.value = value;
  }

  set setOpertionType(OpertionType value) {
    opertionType.value = value;
  }

  Future runFutuerFunction({required Future function}) async {
    checkConnection(() async {
      await function;
    });
  }

  Future runLoadingFutuerFunction(
      {required Future function,
        OpertionType? type = OpertionType.NONE}) async {
    checkConnection(() async {
      setRequestStatus = RequestStatus.LOADING;
      setOpertionType = type!;
      await function;
      setRequestStatus = RequestStatus.DEFAULT;
      setOpertionType = OpertionType.NONE;
    });
  }

  Future runFullLoadingFutuerFunction(
      {required Future function,
        OpertionType? type = OpertionType.NONE}) async {
    checkConnection(() async {
      customLoader();
      await function;
      BotToast.closeAllLoading();
    });
  }
}