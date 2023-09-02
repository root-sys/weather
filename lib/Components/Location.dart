
import 'package:geolocator/geolocator.dart';

class Location{
   double ? latitude;
 double ? longitude;

  Future<void> getLocations() async{
try {
  LocationPermission permission = await Geolocator.requestPermission();
  if (LocationPermission.whileInUse == permission ||
      LocationPermission.always == permission) {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    latitude = position.latitude;
    longitude = position.longitude;
  }
}
catch(e){
  print(e);
}

}


  }
