import 'package:ecommerce_app/core/logic/language/app_languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class ToggleLanguageCubit extends Cubit<Locale> {
  ToggleLanguageCubit() : super(AppLanguages.english);
  static ToggleLanguageCubit get(context) => BlocProvider.of(context);

  bool isEnglish = true;
  void toggleLanguage() {
    isEnglish = !isEnglish;
    final newLanguage = isEnglish ? AppLanguages.english : AppLanguages.arabic;

    emit(newLanguage);
  }
}
