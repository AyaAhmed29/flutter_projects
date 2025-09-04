import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/widgets/custom_elevated_button.dart';
import 'package:news_app/core/widgets/custom_svg.dart';
import 'package:news_app/feature/location/cubit/location_cubit.dart';
import 'package:news_app/feature/location/cubit/location_state.dart';

late double lat;
late double lon;

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
              return Center(child: CircularProgressIndicator());
            } else if (state is LocationSuccess) {
              lat = state.position.latitude;
              lon = state.position.longitude;

              return Stack(
                children: [
                  SizedBox(height: 50.h),

                  SizedBox.expand(
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          state.position.latitude,
                          state.position.longitude,
                        ),
                        zoom: 5,
                      ),
                      markers: LocationCubit.get(context).markers,
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 50,
                        ),
                        child: TextField(
                          textInputAction: TextInputAction.done,
                          onSubmitted: (value) {},

                          decoration: InputDecoration(
                            fillColor: AppColors.gray.withValues(alpha: .4),
                            filled: true,
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: CustomSvg(
                                icon: Assets.assetsImagesIconsSearch,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              borderSide: BorderSide(
                                color: AppColors.blue,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CustomElevatedButton(
                          text: 'Get Started',
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.navigationViwe);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else if (state is Locationfailure) {
              return Text(state.message);
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
