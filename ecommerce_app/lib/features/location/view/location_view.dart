import 'package:ecommerce_app/features/location/cubit/location_cubit.dart';
import 'package:ecommerce_app/features/location/cubit/location_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit()..getCurrentLocation(),
      child: Scaffold(
        body: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            if (state is LocationLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LocationSuccess) {
              return SizedBox.expand(
                child: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          state.position.latitude,
                          state.position.longitude,
                        ),
                        zoom: 15,
                      ),
                      markers: LocationCubit.get(context).markers,
                      onTap: (LatLng newPosition) {
                        
                        LocationCubit.get(context).updateMarker(newPosition);
                      },
                    ),
                  ],
                ),
              );
            } else if (state is Locationfailure) {
              return Text(state.message);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
