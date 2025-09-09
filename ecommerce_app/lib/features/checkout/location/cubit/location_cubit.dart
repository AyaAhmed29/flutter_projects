import 'dart:async';

import 'package:ecommerce_app/features/checkout/location/cubit/location_state.dart';
import 'package:ecommerce_app/features/checkout/location/repo/location_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  static LocationCubit get(context) => BlocProvider.of(context);
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
  Set<Marker> markers = {};

  void getCurrentLocation() async {
    LocationRepo locationRepo = LocationRepo();

    emit(LocationLoading());
    var data = await locationRepo.getLocation();
    data.fold((error) => emit(Locationfailure(error)), (position) {
      markers.add(
        Marker(
          markerId: MarkerId('current location'),
          position: LatLng(position.latitude, position.longitude),
        ),
      );
      emit(LocationSuccess(position));
    });
  }

  void updateMarker(LatLng newPosition) {
    markers.clear();
    markers.add(
      Marker(markerId: MarkerId('current location'), position: newPosition),
    );
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
  }
}
