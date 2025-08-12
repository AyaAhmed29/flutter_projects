
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_style.dart';

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 16.0.w),
          child: Text(
            'Language',
            style: AppStyle.light19.copyWith(color: Colors.black),
          ),
        ),
        SizedBox(
          height: 40.h,
          child: Padding(
            padding:  EdgeInsets.only(right: 16.0.w),
            child: Container(
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isEnglish = false;
                        });
                      },
                      child: Container(
                        padding:  EdgeInsets.symmetric(vertical: 6.h),
                        decoration: BoxDecoration(
                          color: !isEnglish
                              ? Colors.green
                              : Colors.grey.shade300,
                          borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(6.r),
                            bottomLeft: Radius.circular(6.r),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "AR",
                          style: TextStyle(
                            color: !isEnglish ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isEnglish = true;
                        });
                      },
                      child: Container(
                        padding:  EdgeInsets.symmetric(vertical: 6.h),
                        decoration: BoxDecoration(
                          color: isEnglish
                              ? Colors.green
                              : Colors.grey.shade300,
                          borderRadius:  BorderRadius.only(
                            topRight: Radius.circular(6.r),
                            bottomRight: Radius.circular(6.r),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "EN",
                          style: TextStyle(
                            color: isEnglish ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
