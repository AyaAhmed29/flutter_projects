// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome To \nDo It !`
  String get WelcomeToDoIt {
    return Intl.message(
      'Welcome To \nDo It !',
      name: 'WelcomeToDoIt',
      desc: '',
      args: [],
    );
  }

  /// `Ready to conquer your tasks?\nLet's Do\n It together.`
  String get ReadyToConquerYourTasks {
    return Intl.message(
      'Ready to conquer your tasks?\nLet\'s Do\n It together.',
      name: 'ReadyToConquerYourTasks',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Start`
  String get LetsStart {
    return Intl.message('Let’s Start', name: 'LetsStart', desc: '', args: []);
  }

  /// `Username`
  String get Username {
    return Intl.message('Username', name: 'Username', desc: '', args: []);
  }

  /// `Password`
  String get Password {
    return Intl.message('Password', name: 'Password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get ConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'ConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Register {
    return Intl.message('Register', name: 'Register', desc: '', args: []);
  }

  /// `Already Have An Account?`
  String get AlreadyHaveAnAccount {
    return Intl.message(
      'Already Have An Account?',
      name: 'AlreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message('Login', name: 'Login', desc: '', args: []);
  }

  /// `Don’t Have An Account?`
  String get DontHaveAnAccount {
    return Intl.message(
      'Don’t Have An Account?',
      name: 'DontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `There are no tasks yet,\nPress the button\nTo add New Task`
  String get NoTasksMessage {
    return Intl.message(
      'There are no tasks yet,\nPress the button\nTo add New Task',
      name: 'NoTasksMessage',
      desc: '',
      args: [],
    );
  }

  /// `Hello!`
  String get Hello {
    return Intl.message('Hello!', name: 'Hello', desc: '', args: []);
  }

  /// `Your today’s tasks almost done!`
  String get TasksAlmostDone {
    return Intl.message(
      'Your today’s tasks almost done!',
      name: 'TasksAlmostDone',
      desc: '',
      args: [],
    );
  }

  /// `View Tasks`
  String get ViewTasks {
    return Intl.message('View Tasks', name: 'ViewTasks', desc: '', args: []);
  }

  /// `In Progress`
  String get InProgress {
    return Intl.message('In Progress', name: 'InProgress', desc: '', args: []);
  }

  /// `Done`
  String get Done {
    return Intl.message('Done', name: 'Done', desc: '', args: []);
  }

  /// `Missed`
  String get Missed {
    return Intl.message('Missed', name: 'Missed', desc: '', args: []);
  }

  /// `All`
  String get All {
    return Intl.message('All', name: 'All', desc: '', args: []);
  }

  /// `Task Groups`
  String get TaskGroups {
    return Intl.message('Task Groups', name: 'TaskGroups', desc: '', args: []);
  }

  /// `Add New Features`
  String get AddNewFeatures {
    return Intl.message(
      'Add New Features',
      name: 'AddNewFeatures',
      desc: '',
      args: [],
    );
  }

  /// `Improve my English skills by trying to speak`
  String get ImproveEnglishSkills {
    return Intl.message(
      'Improve my English skills by trying to speak',
      name: 'ImproveEnglishSkills',
      desc: '',
      args: [],
    );
  }

  /// `Add new feature for Do It app and commit it`
  String get AddFeatureForDoIt {
    return Intl.message(
      'Add new feature for Do It app and commit it',
      name: 'AddFeatureForDoIt',
      desc: '',
      args: [],
    );
  }

  /// `Personal Task`
  String get PersonalTask {
    return Intl.message(
      'Personal Task',
      name: 'PersonalTask',
      desc: '',
      args: [],
    );
  }

  /// `Home Task`
  String get HomeTask {
    return Intl.message('Home Task', name: 'HomeTask', desc: '', args: []);
  }

  /// `Work Task`
  String get WorkTask {
    return Intl.message('Work Task', name: 'WorkTask', desc: '', args: []);
  }

  /// `Settings`
  String get Settings {
    return Intl.message('Settings', name: 'Settings', desc: '', args: []);
  }

  /// `Language`
  String get Language {
    return Intl.message('Language', name: 'Language', desc: '', args: []);
  }

  /// `AR`
  String get AR {
    return Intl.message('AR', name: 'AR', desc: '', args: []);
  }

  /// `EN`
  String get EN {
    return Intl.message('EN', name: 'EN', desc: '', args: []);
  }

  /// `Go to supermarket to buy some milk & eggs`
  String get GoToSupermarket {
    return Intl.message(
      'Go to supermarket to buy some milk & eggs',
      name: 'GoToSupermarket',
      desc: '',
      args: [],
    );
  }

  /// `Search....`
  String get Search {
    return Intl.message('Search....', name: 'Search', desc: '', args: []);
  }

  /// `Work`
  String get Work {
    return Intl.message('Work', name: 'Work', desc: '', args: []);
  }

  /// `Home`
  String get Home {
    return Intl.message('Home', name: 'Home', desc: '', args: []);
  }

  /// `Personal`
  String get Personal {
    return Intl.message('Personal', name: 'Personal', desc: '', args: []);
  }

  /// `Filter`
  String get Filter {
    return Intl.message('Filter', name: 'Filter', desc: '', args: []);
  }

  /// `Tasks`
  String get Tasks {
    return Intl.message('Tasks', name: 'Tasks', desc: '', args: []);
  }

  /// `Results`
  String get Results {
    return Intl.message('Results', name: 'Results', desc: '', args: []);
  }

  /// `Grocery Shopping App`
  String get GroceryShoppingApp {
    return Intl.message(
      'Grocery Shopping App',
      name: 'GroceryShoppingApp',
      desc: '',
      args: [],
    );
  }

  /// `Go for grocery to buy some products. Go for grocery to buy some products. Go for grocery to buy some products. Go for grocery to buy some products.`
  String get GroceryDescription {
    return Intl.message(
      'Go for grocery to buy some products. Go for grocery to buy some products. Go for grocery to buy some products. Go for grocery to buy some products.',
      name: 'GroceryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Mark as Done`
  String get MarkAsDone {
    return Intl.message('Mark as Done', name: 'MarkAsDone', desc: '', args: []);
  }

  /// `Update`
  String get Update {
    return Intl.message('Update', name: 'Update', desc: '', args: []);
  }

  /// `Title`
  String get Title {
    return Intl.message('Title', name: 'Title', desc: '', args: []);
  }

  /// `Description`
  String get Description {
    return Intl.message('Description', name: 'Description', desc: '', args: []);
  }

  /// `Group`
  String get Group {
    return Intl.message('Group', name: 'Group', desc: '', args: []);
  }

  /// `End Time`
  String get EndTime {
    return Intl.message('End Time', name: 'EndTime', desc: '', args: []);
  }

  /// `Add Task`
  String get AddTask {
    return Intl.message('Add Task', name: 'AddTask', desc: '', args: []);
  }

  /// `Profile`
  String get Profile {
    return Intl.message('Profile', name: 'Profile', desc: '', args: []);
  }

  /// `Change Password`
  String get ChangePassword {
    return Intl.message(
      'Change Password',
      name: 'ChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get OldPassword {
    return Intl.message(
      'Old Password',
      name: 'OldPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get NewPassword {
    return Intl.message(
      'New Password',
      name: 'NewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Congrats!`
  String get Congrats {
    return Intl.message('Congrats!', name: 'Congrats', desc: '', args: []);
  }

  /// `Believe you can, and you're halfway there.`
  String get BelieveYouCan {
    return Intl.message(
      'Believe you can, and you\'re halfway there.',
      name: 'BelieveYouCan',
      desc: '',
      args: [],
    );
  }

  /// `Edit Task`
  String get EditTask {
    return Intl.message('Edit Task', name: 'EditTask', desc: '', args: []);
  }

  /// `Delete`
  String get Delete {
    return Intl.message('Delete', name: 'Delete', desc: '', args: []);
  }

  /// `Passwords do not match `
  String get PasswordsDoNotMatch {
    return Intl.message(
      'Passwords do not match ',
      name: 'PasswordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message('Save', name: 'Save', desc: '', args: []);
  }

  /// `Registration successful `
  String get RegistrationSuccessful {
    return Intl.message(
      'Registration successful ',
      name: 'RegistrationSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Please enter `
  String get PleaseEnter {
    return Intl.message(
      'Please enter ',
      name: 'PleaseEnter',
      desc: '',
      args: [],
    );
  }

  /// `Password too short `
  String get PasswordTooShort {
    return Intl.message(
      'Password too short ',
      name: 'PasswordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Please Select item `
  String get PleaseSelectItem {
    return Intl.message(
      'Please Select item ',
      name: 'PleaseSelectItem',
      desc: '',
      args: [],
    );
  }

  /// `Login successfully `
  String get LoginSuccessfully {
    return Intl.message(
      'Login successfully ',
      name: 'LoginSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that Email`
  String get NoUserFound {
    return Intl.message(
      'No user found for that Email',
      name: 'NoUserFound',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get WrongPassword {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'WrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak. `
  String get PasswordTooWeak {
    return Intl.message(
      'The password provided is too weak. ',
      name: 'PasswordTooWeak',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that Email. `
  String get AccountAlreadyExists {
    return Intl.message(
      'The account already exists for that Email. ',
      name: 'AccountAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email`
  String get InvalidEmail {
    return Intl.message(
      'Invalid Email',
      name: 'InvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message('Email', name: 'Email', desc: '', args: []);
  }

  /// `You didn't change anything`
  String get Youdidntchangeanything {
    return Intl.message(
      'You didn\'t change anything',
      name: 'Youdidntchangeanything',
      desc: '',
      args: [],
    );
  }

  /// `Task updated successfully`
  String get TaskUpdatedSuccessfully {
    return Intl.message(
      'Task updated successfully',
      name: 'TaskUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Task deleted successfully`
  String get TaskDeletedSuccessfully {
    return Intl.message(
      'Task deleted successfully',
      name: 'TaskDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Task added successfully`
  String get TaskAddedSuccessfully {
    return Intl.message(
      'Task added successfully',
      name: 'TaskAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Deletion`
  String get ConfirmDeletion {
    return Intl.message(
      'Confirm Deletion',
      name: 'ConfirmDeletion',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this task?`
  String get AreYouSureYouWantToDeleteThisTask {
    return Intl.message(
      'Are you sure you want to delete this task?',
      name: 'AreYouSureYouWantToDeleteThisTask',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message('yes', name: 'yes', desc: '', args: []);
  }

  /// `no`
  String get no {
    return Intl.message('no', name: 'no', desc: '', args: []);
  }

  /// `This task is already marked as done`
  String get ThisTaskIsAlreadyMarkedAsDone {
    return Intl.message(
      'This task is already marked as done',
      name: 'ThisTaskIsAlreadyMarkedAsDone',
      desc: '',
      args: [],
    );
  }

  /// `This task is already done`
  String get TaskAlreadyDone {
    return Intl.message(
      'This task is already done',
      name: 'TaskAlreadyDone',
      desc: '',
      args: [],
    );
  }

  /// `task is missing`
  String get taskismissing {
    return Intl.message(
      'task is missing',
      name: 'taskismissing',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'task is in progress' key

  /// `Logout`
  String get Logout {
    return Intl.message('Logout', name: 'Logout', desc: '', args: []);
  }

  /// `Logout Successfully`
  String get LogoutSuccessfully {
    return Intl.message(
      'Logout Successfully',
      name: 'LogoutSuccessfully',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
