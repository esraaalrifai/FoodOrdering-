import 'package:bot_toast/bot_toast.dart';
import 'package:foodorderproject/ui/shared/utils.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;

class LocationService {
  Location location = new Location();
//هي الفانكشن بترجع locationdata
  //هي كانت ترجع return فاضي لحالا لذلك عملناها nullable مشان ترضى ترجع null

  Future<LocationData?> getUserCurrentLocation({bool hideLoader = true}) async {
    LocationData _locationData;

    if (!await isLocationEnabeld()) return null;

    if (!await isPermissionGranted()) return null;

    customLoader();

    _locationData = await location.getLocation();

    if (hideLoader) BotToast.closeAllLoading();

    return _locationData;
  }
//فانكشن بمرقلا locationdata بترجعلي placemarkوحدي
  //حطينا geoبالimport لانو في كلمات متشابهة بين مكتبة ال location ومكتبة   geocoding
  Future<geo.Placemark?> getAddressInfo(LocationData locationData,
      {bool showLoader = true}) async {
    if (showLoader) customLoader();

    List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        locationData.latitude ?? 0.0, locationData.longitude ?? 0.0);

    BotToast.closeAllLoading();

    if (placemarks.isNotEmpty) {
      //اذا ال list مانا فاضي رجعلي اول item منا
      return placemarks[0];
    } else {
      return null;
    }
  }

  Future<geo.Placemark?> getCurrentAddressInfo() async {
    return await getAddressInfo(
        await getUserCurrentLocation(hideLoader: false) ??
            LocationData.fromMap({}),
        showLoader: false);
  }
//فانكشن بترجع bool رح اختبر فيا اذا serviceenabledولا لا
  //لانو احيانا مابكون بدي جيب location المستخدم بس بدي شوفو اذا مشغل اللوكيشن او لا
  //بالdependency injection دائما الفانكشن بتتنفذ وقت الاستدعاء وال var وقت البناء
  Future<bool> isLocationEnabeld() async {
    bool _serviceEnabled;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        //!-- Message to show --
        return false;
      }
    }
    return _serviceEnabled;
  }
  //بترجعbool
  Future<bool> isPermissionGranted() async {
    PermissionStatus _permissionGranted;

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        //!-- Message to show --
        return false;
      }
    }

    return _permissionGranted == PermissionStatus.granted;
  }
}
