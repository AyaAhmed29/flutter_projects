import 'package:flutter/material.dart';
import 'package:todo_app/core/widgets/custom_app_bar.dart';
import 'package:todo_app/feature/profile/view/widgets/language_switch.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titile: 'Settings'),
      body: LanguageSwitch(),
    );
  }
}
