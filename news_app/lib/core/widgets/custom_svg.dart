
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvg extends StatelessWidget {
  const CustomSvg({super.key, required this.icon});

  final String icon;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
    );
  }
}
