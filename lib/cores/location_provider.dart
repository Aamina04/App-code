import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:marker_icon/marker_icon.dart';

class LocationProvider extends ChangeNotifier{
  Location? _location;
  LatLng? _locationPosition;
  LatLng? taskLocation;
  final Set<Marker> _markers = <Marker>{};
  bool isLocationActive = true;
  bool isTaskReadyToSubmit = false;
  double distanceBetweenPoints = 0;
  Location? get location => _location;
  LatLng? get locationPosition => _locationPosition;
  Set<Marker> get markers => _markers;

  LocationProvider(){
    _location = Location();
  }
  void initialization() async {
    if(!isTaskReadyToSubmit){
      await getUserLocation();
    }else{}
  }
  void distanceCalculator(lt,lg){
    try{
      distanceBetweenPoints = GeolocatorPlatform.instance.distanceBetween(
        lt,
        lg,
        taskLocation!.latitude,
        taskLocation!.longitude,
      );
      notifyListeners();
    }catch(_){}
  }

  Future<void> getUserLocation() async {
    bool isServiceEnable = await location!.serviceEnabled();
    if(!isServiceEnable){
      isServiceEnable = await location!.requestService();
      if(!isServiceEnable){
        return;
      }
    }
    PermissionStatus isPermission = await location!.hasPermission();
    if(isPermission == PermissionStatus.denied){
      isPermission = await location!.requestPermission();
      if(isPermission != PermissionStatus.granted){
        return;
      }
    }

    location!.onLocationChanged.listen((data) {
      double? x = data.latitude;
        double? y = data.longitude;
        _locationPosition = LatLng(x!,y!);
        if(taskLocation != null){
          distanceCalculator(x, y);
        }
        notifyListeners();
      });

  }
  Future<void> setTaskLocation({required lat,required lng}) async {
    taskLocation = LatLng(lat, lng);
    _markers.clear();
    _markers.add(
      Marker(
        markerId: const MarkerId('000000001'),
        icon: await MarkerIcon.pictureAsset(
            assetPath: 'assets/your-location.png', width: 100.0,height: 100.0),
        position: LatLng(lat, lng),),
    );
    notifyListeners();
  }
}