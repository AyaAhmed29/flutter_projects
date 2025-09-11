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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Register successfully`
  String get registerSuccessfully {
    return Intl.message(
      'Register successfully',
      name: 'registerSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Login successfully`
  String get loginSuccessfully {
    return Intl.message(
      'Login successfully',
      name: 'loginSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Create an\naccount!`
  String get createAccount {
    return Intl.message(
      'Create an\naccount!',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Welcome \nBack!`
  String get welcomeBack {
    return Intl.message(
      'Welcome \nBack!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccountButton {
    return Intl.message(
      'Create Account',
      name: 'createAccountButton',
      desc: '',
      args: [],
    );
  }

  /// `By clicking the "Register" button, you agree \nto the public offer`
  String get registerAgreement {
    return Intl.message(
      'By clicking the "Register" button, you agree \nto the public offer',
      name: 'registerAgreement',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Search any Product..`
  String get searchAnyProduct {
    return Intl.message(
      'Search any Product..',
      name: 'searchAnyProduct',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get items {
    return Intl.message(
      'Items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `Error: `
  String get error {
    return Intl.message(
      'Error: ',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Shop Now`
  String get shopNow {
    return Intl.message(
      'Shop Now',
      name: 'shopNow',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get recommended {
    return Intl.message(
      'Recommended',
      name: 'recommended',
      desc: '',
      args: [],
    );
  }

  /// `All Featured`
  String get allFeatured {
    return Intl.message(
      'All Featured',
      name: 'allFeatured',
      desc: '',
      args: [],
    );
  }

  /// `Beauty`
  String get beauty {
    return Intl.message(
      'Beauty',
      name: 'beauty',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Product`
  String get product {
    return Intl.message(
      'Product',
      name: 'product',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Add To Cart`
  String get addToCart {
    return Intl.message(
      'Add To Cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Choose Products`
  String get chooseProducts {
    return Intl.message(
      'Choose Products',
      name: 'chooseProducts',
      desc: '',
      args: [],
    );
  }

  /// `Fast Delivery`
  String get fastDelivery {
    return Intl.message(
      'Fast Delivery',
      name: 'fastDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Easy Payment`
  String get easyPayment {
    return Intl.message(
      'Easy Payment',
      name: 'easyPayment',
      desc: '',
      args: [],
    );
  }

  /// `You want Authentic, here you go!`
  String get authenticText {
    return Intl.message(
      'You want Authentic, here you go!',
      name: 'authenticText',
      desc: '',
      args: [],
    );
  }

  /// `Find it here, buy it now!`
  String get findItHere {
    return Intl.message(
      'Find it here, buy it now!',
      name: 'findItHere',
      desc: '',
      args: [],
    );
  }

  /// `Prev`
  String get prev {
    return Intl.message(
      'Prev',
      name: 'prev',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Discover the latest fashion trends from our new collection.`
  String get loremDescription1 {
    return Intl.message(
      'Discover the latest fashion trends from our new collection.',
      name: 'loremDescription1',
      desc: '',
      args: [],
    );
  }

  /// `High-quality clothing suitable for all occasions.`
  String get loremDescription2 {
    return Intl.message(
      'High-quality clothing suitable for all occasions.',
      name: 'loremDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Shop easily and quickly with fast delivery service.`
  String get loremDescription3 {
    return Intl.message(
      'Shop easily and quickly with fast delivery service.',
      name: 'loremDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Find it here, buy it now!`
  String get findItHereBuyNow {
    return Intl.message(
      'Find it here, buy it now!',
      name: 'findItHereBuyNow',
      desc: '',
      args: [],
    );
  }

  /// `You want Authentic, here you go!`
  String get youWantAuthentic {
    return Intl.message(
      'You want Authentic, here you go!',
      name: 'youWantAuthentic',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Order placed successfully`
  String get orderPlacedSuccessfully {
    return Intl.message(
      'Order placed successfully',
      name: 'orderPlacedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message(
      'My Orders',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `Active Orders`
  String get activeOrders {
    return Intl.message(
      'Active Orders',
      name: 'activeOrders',
      desc: '',
      args: [],
    );
  }

  /// `Completed Orders`
  String get completedOrders {
    return Intl.message(
      'Completed Orders',
      name: 'completedOrders',
      desc: '',
      args: [],
    );
  }

  /// `Canceled Orders`
  String get canceledOrders {
    return Intl.message(
      'Canceled Orders',
      name: 'canceledOrders',
      desc: '',
      args: [],
    );
  }

  /// `Shopping List`
  String get shoppingList {
    return Intl.message(
      'Shopping List',
      name: 'shoppingList',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Place Order`
  String get placeOrder {
    return Intl.message(
      'Place Order',
      name: 'placeOrder',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Product ID`
  String get productId {
    return Intl.message(
      'Product ID',
      name: 'productId',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Address`
  String get deliveryAddress {
    return Intl.message(
      'Delivery Address',
      name: 'deliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message(
      'Active',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get canceled {
    return Intl.message(
      'Canceled',
      name: 'canceled',
      desc: '',
      args: [],
    );
  }

  /// `Order Canceled`
  String get orderCanceled {
    return Intl.message(
      'Order Canceled',
      name: 'orderCanceled',
      desc: '',
      args: [],
    );
  }

  /// `Order delivered`
  String get orderDelivered {
    return Intl.message(
      'Order delivered',
      name: 'orderDelivered',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Order Item`
  String get orderItem {
    return Intl.message(
      'Order Item',
      name: 'orderItem',
      desc: '',
      args: [],
    );
  }

  /// `Track Driver`
  String get trackDriver {
    return Intl.message(
      'Track Driver',
      name: 'trackDriver',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to Cancel this order?`
  String get cancelConfirmationQuestion {
    return Intl.message(
      'Are you sure you want to Cancel this order?',
      name: 'cancelConfirmationQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get confirmation {
    return Intl.message(
      'Confirmation',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Order canceled successfully`
  String get orderCanceledSuccessfully {
    return Intl.message(
      'Order canceled successfully',
      name: 'orderCanceledSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Type address here or pick from map`
  String get typeAddress {
    return Intl.message(
      'Type address here or pick from map',
      name: 'typeAddress',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Tax and Fees`
  String get taxAndFees {
    return Intl.message(
      'Tax and Fees',
      name: 'taxAndFees',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Fee`
  String get deliveryFee {
    return Intl.message(
      'Delivery Fee',
      name: 'deliveryFee',
      desc: '',
      args: [],
    );
  }

  /// `Order Total`
  String get orderTotal {
    return Intl.message(
      'Order Total',
      name: 'orderTotal',
      desc: '',
      args: [],
    );
  }

  /// `Total Order`
  String get totalOrder {
    return Intl.message(
      'Total Order',
      name: 'totalOrder',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `AR`
  String get ar {
    return Intl.message(
      'AR',
      name: 'ar',
      desc: '',
      args: [],
    );
  }

  /// `EN`
  String get en {
    return Intl.message(
      'EN',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `My Favorites`
  String get myFavorites {
    return Intl.message(
      'My Favorites',
      name: 'myFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Data updated successfully`
  String get dataUpdatedSuccessfully {
    return Intl.message(
      'Data updated successfully',
      name: 'dataUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Log out successfully`
  String get logOutSuccessfully {
    return Intl.message(
      'Log out successfully',
      name: 'logOutSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out from your account?`
  String get logOutConfirmation {
    return Intl.message(
      'Are you sure you want to log out from your account?',
      name: 'logOutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any`
  String get noItemsPrefix {
    return Intl.message(
      'You don\'t have any',
      name: 'noItemsPrefix',
      desc: '',
      args: [],
    );
  }

  /// `at this time`
  String get noItemsSuffix {
    return Intl.message(
      'at this time',
      name: 'noItemsSuffix',
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
