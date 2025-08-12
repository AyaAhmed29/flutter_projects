
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayfieldTask extends StatelessWidget {
  const DisplayfieldTask({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      constraints: BoxConstraints(minHeight: 50.h),
      width: 350.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding:  EdgeInsets.only(top: 16.0.h, left: 16.w),
        child: widget,
      ),
    );
  }
}
