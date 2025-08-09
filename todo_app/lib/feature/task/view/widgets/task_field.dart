import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/feature/home/view/widgets/number_container.dart';

class TaskField extends StatelessWidget {
  const TaskField({
    super.key,
    required this.text,
    required this.prefixIcon,

    this.onPressed,
    required this.color,
    required this.number,
  });
  final String text;
  final String prefixIcon;

  final Color color;
  final void Function()? onPressed;
  final int number;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        margin: EdgeInsets.all(8),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: color.withValues(alpha: 0.15),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    prefixIcon,
                    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                  ),
                ),
              ),
            ),

            Text(text, style: AppStyle.regular16),
            Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: NumberContainer(color: color, number: number),
            ),
          ],
        ),
      ),
    );
  }
}
