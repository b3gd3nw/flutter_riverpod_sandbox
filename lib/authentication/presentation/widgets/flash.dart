import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';

class ShowFlash {
  final BuildContext context;
  final String message;

  ShowFlash({required this.context, required this.message});

  void showBasicFlash() {
    showFlash(
      context: context,
      duration: Duration(seconds: 3),
      builder: (_, controller) {
        return Flash(
          controller: controller,
          behavior: FlashBehavior.floating,
          position: FlashPosition.bottom,
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            content: Text(message),
          ),
        );
      },
    );
  }
}