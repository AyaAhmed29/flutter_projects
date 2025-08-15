import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/logic/cubit/toggle_language_cubit.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_languages.dart';
import 'package:todo_app/core/utils/app_style.dart';
import 'package:todo_app/generated/l10n.dart';

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

bool isEnglish = true;

class _LanguageSwitchState extends State<LanguageSwitch> {
  void toggleLanguage() {
    setState(() {
      final currentLanguage = context.read<ToggleLanguageCubit>().state;
      final newLanguage = currentLanguage == AppLanguages.arabic
          ? AppLanguages.english
          : AppLanguages.arabic;
      context.read<ToggleLanguageCubit>().toggleLanguage(newLanguage);
      isEnglish = !isEnglish;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).Language,
          style: AppStyle.light19.copyWith(color: AppColors.black),
        ),
        SizedBox(
          height: 40.h,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: GestureDetector(
              onTap: toggleLanguage,
              child: Container(
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(color: AppColors.lightGray),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        decoration: BoxDecoration(
                          color: !isEnglish
                              ? AppColors.primaryColor
                              : AppColors.lightGray,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6.r),
                            bottomLeft: Radius.circular(6.r),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          S.of(context).AR,
                          style: TextStyle(
                            color: !isEnglish
                                ? AppColors.white
                                : AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        decoration: BoxDecoration(
                          color: isEnglish
                              ? AppColors.primaryColor
                              : AppColors.lightGray,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6.r),
                            bottomRight: Radius.circular(6.r),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          S.of(context).EN,
                          style: TextStyle(
                            color: isEnglish
                                ? AppColors.white
                                : AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
