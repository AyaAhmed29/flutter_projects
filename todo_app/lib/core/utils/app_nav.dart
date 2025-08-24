import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum NavigatorType { push, pushReplacement, pushAndRemoveUntil }

abstract class AppNavigator {
  static goTo(
    BuildContext context,
    String viewName, {
    NavigatorType type = NavigatorType.push,
  }) {
    switch (type) {
      case NavigatorType.push:
        return GoRouter.of(context).push(viewName);
      case NavigatorType.pushReplacement:
        return GoRouter.of(context).pushReplacement(viewName);
      case NavigatorType.pushAndRemoveUntil:
        return GoRouter.of(
          context,
        ).pushReplacementNamed(viewName);
    }
  }

  static goBack(context) => GoRouter.of(context).pop(context);
}
