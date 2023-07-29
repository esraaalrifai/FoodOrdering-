import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:foodorderproject/core/enums/connectivitystatus.dart';

class ConnectivityService {
  StreamController<ConnectivityStatus>//<حالة الاتصال يعني نوع الكونترولر >
  connectivityStatusController =
  StreamController<ConnectivityStatus>.broadcast();//وقت يصير تغيير معين بيتحسس لأي تغيير

  ConnectivityService() {
    final Connectivity connectivity = Connectivity();

    connectivity.onConnectivityChanged.listen((event) {
      connectivityStatusController.add(getStatus(event));//بضيف أي تغيير عم بصير بحالة الاتصال
    });
  }

  ConnectivityStatus getStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.bluetooth:
        return ConnectivityStatus.ONLINE;

      case ConnectivityResult.wifi:
        return ConnectivityStatus.ONLINE;

      case ConnectivityResult.ethernet:
        return ConnectivityStatus.ONLINE;
      case ConnectivityResult.mobile:
        return ConnectivityStatus.ONLINE;
      case ConnectivityResult.none:
        return ConnectivityStatus.OFFLINE;
      case ConnectivityResult.vpn:
        return ConnectivityStatus.ONLINE;
      case ConnectivityResult.other:
        return ConnectivityStatus.ONLINE;
    }
  }
}