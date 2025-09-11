import 'package:ecommerce_app/core/widget/custom_appbar.dart';
import 'package:ecommerce_app/features/profile/view/widgets/language_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'settings'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: LanguageSwitch(),
      ),
    );
  }
}
