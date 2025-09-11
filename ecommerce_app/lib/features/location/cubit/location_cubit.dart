import 'dart:async';

import 'package:ecommerce_app/features/location/cubit/location_state.dart';
import 'package:ecommerce_app/features/location/repo/location_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  static LocationCubit get(context) => BlocProvider.of(context);
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
  Set<Marker> markers = {};
  String? selectedLocationName;

  void getCurrentLocation() async {
    LocationRepo locationRepo = LocationRepo();

    emit(LocationLoading());
    var data = await locationRepo.getLocation();
    data.fold((error) => emit(Locationfailure(error)), (position) async {
      markers.add(
        Marker(
          markerId: MarkerId('current location'),
          position: LatLng(position.latitude, position.longitude),
        ),
      );

      await getPlaceName(LatLng(position.latitude, position.longitude));

      emit(LocationSuccess(position));
    });
  }

  Timer? _debounce;

  void updateMarker(LatLng newPosition) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 300), () async {
      markers.clear();
      markers.add(
        Marker(markerId: MarkerId('current location'), position: newPosition),
      );

      await getPlaceName(newPosition);

      emit(
        LocationSuccess(
          Position(
            latitude: newPosition.latitude,
            longitude: newPosition.longitude,
            timestamp: DateTime.now(),
            accuracy: 0,
            altitude: 0,
            heading: 0,
            speed: 0,
            speedAccuracy: 0,
            altitudeAccuracy: 0,
            headingAccuracy: 0,
          ),
        ),
      );
    });
  }

  Future<void> getPlaceName(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        selectedLocationName =
            '${place.street}, ${place.subLocality}, ${place.locality}';
      }
    } catch (e) {
      selectedLocationName = 'Unknown location';
    }
  }
}
