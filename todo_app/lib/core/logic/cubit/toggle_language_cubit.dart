import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/app_languages.dart';

part 'toggle_language_state.dart';

class ToggleLanguageCubit extends Cubit<Locale> {
  ToggleLanguageCubit() : super(AppLanguages.english);

  void toggleLanguage(Locale locale) {
    emit(locale);
  }
}
