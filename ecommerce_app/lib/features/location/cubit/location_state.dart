import 'package:geolocator/geolocator.dart';

sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationSuccess extends LocationState {
  final Position position;
  LocationSuccess(this.position);
}

final class Locationfailure extends LocationState {
  final String message;
  Locationfailure(this.message);
}
