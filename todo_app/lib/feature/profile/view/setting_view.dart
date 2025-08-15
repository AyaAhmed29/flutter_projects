import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/widgets/custom_app_bar.dart';
import 'package:todo_app/feature/profile/view/widgets/language_switch.dart';
import 'package:todo_app/generated/l10n.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titile: S.of(context).Settings),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: LanguageSwitch(),
      ),
    );
  }
}
