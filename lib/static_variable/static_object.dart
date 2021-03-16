import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class StaticLocation {
  //location
  static LocationData currentLocation;
  static double myLatitude;
  static double myLongitude;
  static final CameraPosition initLocation = CameraPosition(
    target: LatLng(myLatitude, myLongitude), //กำหนดพิกัดเริ่มต้นบนแผนที่
    zoom: 15, //กำหนดระยะการซูม สามารถกำหนดค่าได้ 0-20
  );
}
