import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/feature/auth/data/model/user_model.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    
    final extra = GoRouterState.of(context).extra;
    final user = extra != null ? extra as UserModel : null;
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
            child: (user?.image != null && user!.image!.isNotEmpty)
                ? Image.network(user!.image!, fit: BoxFit.cover)
                : Image.asset(Assets.assetsImagesProfile, fit: BoxFit.cover),

            // user?.image != null
            //     ? Image.network(user!.image!)
            //     : Image.asset(Assets.assetsImagesProfile),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              enabled: false,

              decoration: InputDecoration(
                hintText: user?.userName,
                hintStyle: AppStyle.extraLight14,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(color: AppColors.lightGray),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
