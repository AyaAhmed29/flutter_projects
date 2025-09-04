import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({
    super.key,
    required this.image,
    required this.text,
    required this.descText,
  });

  final String image;
  final String text;
  final String descText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: SvgPicture.asset(image, height: 250)),
        const SizedBox(height: 20),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: AppStyle.extraBold24,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            descText,
            style: AppStyle.extraBold14,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
