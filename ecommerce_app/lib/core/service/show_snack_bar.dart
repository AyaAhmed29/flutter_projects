
import 'package:flutter/material.dart';

void ShowSnackBar({required context, required text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: const Color.fromARGB(255, 209, 39, 27),
    ),
  );
}