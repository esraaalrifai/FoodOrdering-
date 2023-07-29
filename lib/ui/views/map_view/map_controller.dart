import 'dart:async';

import 'package:foodorderproject/core/data/models/apis/mapmodel.dart';
import 'package:foodorderproject/core/services/base_controller.dart';
import 'package:foodorderproject/core/utils/map_util.dart';
import 'package:foodorderproject/ui/shared/utils.dart';
import 'package:foodorderproject/ui/views/map_view/country.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapController extends BaseController {
  MapController(this.currentLocation);

  late LocationData currentLocation;

  final Completer<GoogleMapController> controller =
  Completer<GoogleMapController>();

  late CameraPosition currentPosition;

  RxSet<Marker> markers = <Marker>{}.obs;

  late LatLng selecteLocation;

  RxString streetName = ''.obs;

  @override
  void onInit() {
    currentPosition = CameraPosition(
      target: LatLng(currentLocation.latitude ?? 37.42796133580664,
          currentLocation.longitude ?? -122.085749655962),
      zoom: 14.4746,
    );
    selecteLocation = LatLng(currentLocation.latitude ?? 37.42796133580664,
        currentLocation.longitude ?? -122.08574965596);
    super.onInit();
    GetAllCountry();
  }

  void addMarker({
    required LatLng position,
    required String id,
    String? imageName,
    String? imageUrl,
  }) async {
    BitmapDescriptor markerIcon = imageName != null
        ? await MapUtil.getImageFromAsset(imageName: imageName)
        : imageUrl != null
        ? await MapUtil.getImageFromNetwork(imageUrl: imageUrl)
        : BitmapDescriptor.defaultMarker;

    markers.add(
        Marker(markerId: MarkerId(id), position: position, icon: markerIcon));
    getStreetName();
    update();
  }

  void getStreetName() async {
    runLoadingFutuerFunction(
        function: locationService
            .getAddressInfo(
            showLoader: false,
            LocationData.fromMap({
              'latitude': selecteLocation.latitude,
              'longitude': selecteLocation.longitude
            }))
            .then((value) {
          streetName.value = value?.street ?? 'No Info Found';
          update();
        }));
  }

  void GetAllCountry(){
    List<MapModel>resultList=[];
    country.forEach(
            (element)
        { resultList.add(MapModel.fromJson(element));
        });
    resultList.forEach(
            (element)
        { addMarker(position:  LatLng(element.latitude.toDouble(),
            element.longitude.toDouble()),id:element.country.toString() );
        });
  }
}