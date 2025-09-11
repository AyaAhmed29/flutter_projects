import 'package:ecommerce_app/core/logic/language/toggle_language_cubit.dart';
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(S.of(context).language, style: AppStyle.medium18),
        BlocBuilder<ToggleLanguageCubit, Locale>(
          builder: (context, locale) {
            return SizedBox(
              height: 40.h,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: GestureDetector(
                  onTap: () =>
                      ToggleLanguageCubit.get(context).toggleLanguage(),
                  child: Container(
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 6.h),
                            decoration: BoxDecoration(
                              color: !ToggleLanguageCubit.get(context).isEnglish
                                  ? AppColors.pink
                                  : AppColors.lightPink,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6.r),
                                bottomLeft: Radius.circular(6.r),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              S.of(context).ar,
                              style: TextStyle(
                                color:
                                    !ToggleLanguageCubit.get(context).isEnglish
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
                              color: ToggleLanguageCubit.get(context).isEnglish
                                  ? AppColors.pink
                                  : AppColors.lightPink,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(6.r),
                                bottomRight: Radius.circular(6.r),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              S.of(context).en,
                              style: TextStyle(
                                color:
                                    ToggleLanguageCubit.get(context).isEnglish
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
            );
          },
        ),
      ],
    );
  }
}
