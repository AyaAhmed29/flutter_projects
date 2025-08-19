import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/app_languages.dart';



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
