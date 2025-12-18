import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void openFlushbar(BuildContext context, {String? message, required String title, required Color color}) {
  Flushbar(
    
    animationDuration: const Duration(
      milliseconds: 600,
    ),

    backgroundColor: color,
    flushbarPosition: FlushbarPosition.TOP,
    titleText: Text(
      title,
      style: const TextStyle(fontSize: 24),
    ),
    messageText: Text(
      message ?? 'Bilinmeyen xeta',
      // state.message,
      // style: context.typography.body2Medium,
    ),
    titleColor: Colors.white,
    borderColor: Colors.white,
    borderRadius: BorderRadius.circular(16),
    margin: const EdgeInsets.all(20),
    duration: const Duration(seconds: 3),
  ).show(context);
}
