import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:news_app/feature/location/cubit/location_state.dart';
import 'package:news_app/feature/location/repo/location_repo.dart';

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
}
