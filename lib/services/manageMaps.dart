import 'package:flutter/cupertino.dart';
import 'package:geocoder/geocoder.dart' as geoCo;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String finalAddress = 'searching address...';

class GenerateMaps extends ChangeNotifier {
  Position position;
  Position get getPosition => position;

  GoogleMapController googleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  String countryName, mainAddress = 'Mock Address';
  String get getCountryName => countryName;
  String get getMainAddress => mainAddress;
  String get getFinalAddress => finalAddress;

  Future getCurrentLocation() async {
    var positionData = await GeolocatorPlatform.instance.getCurrentPosition();
    final cords =
        geoCo.Coordinates(positionData.latitude, positionData.longitude);
    var address =
        await geoCo.Geocoder.local.findAddressesFromCoordinates(cords);
    String mainAddress = address.first.addressLine;
    print(mainAddress);
    finalAddress = mainAddress;
    notifyListeners();
  }

  getMarkers(double lat, double lng) {
    MarkerId markerId = MarkerId(lat.toString() + lng.toString());
    Marker marker = Marker(
        markerId: markerId,
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: getMainAddress, snippet: getCountryName));
    markers[markerId] = marker;
  }

  Widget fetchMaps() {
    return GoogleMap(
        mapType: MapType.hybrid,
        mapToolbarEnabled: true,
        buildingsEnabled: true,
        myLocationEnabled: true,
        onTap: (loc) async {
          final cords = geoCo.Coordinates(loc.latitude, loc.longitude);
          var address =
              await geoCo.Geocoder.local.findAddressesFromCoordinates(cords);

          countryName = address.first.countryName;
          mainAddress = address.first.addressLine;
          notifyListeners();
          getMarkers(loc.latitude, loc.longitude);
          print(loc);
          print(countryName);
          print(mainAddress);
        },
        markers: Set<Marker>.of(markers.values),
        onMapCreated: (GoogleMapController mapController) {
          googleMapController = mapController;
          notifyListeners();
        },
        initialCameraPosition:
            CameraPosition(target: LatLng(21.000, 45.000), zoom: 18.0));
  }
}
