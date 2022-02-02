import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowFlash {
  final BuildContext context;
  final String message;

  ShowFlash({required this.context, required this.message});

  void showBasicFlash() {
    showFlash(
      context: context,
      duration: const Duration(seconds: 5),
      builder: (_, controller) {
        return Flash.bar(
          controller: controller,
          position: FlashPosition.top,
          brightness: Brightness.light,
          borderWidth: 2.5,
          backgroundColor: Colors.white,
          margin: const EdgeInsets.all(8),
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          borderColor: Colors.red,
          behavior: FlashBehavior.floating,
          forwardAnimationCurve: Curves.elasticOut,
          reverseAnimationCurve: Curves.slowMiddle,
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            icon: const Icon(
              Icons.error,
              color: Colors.red,
            ),
            content: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
