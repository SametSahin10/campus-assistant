import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

Future<void> showYouReachedYourDestinationDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Hedefe ulaştınız"),
        content: const Text("Hedefe ulaştınız. Yolculuğunuz bitti."),
        actions: [
          TextButton(
            onPressed: () => context.router.maybePop(),
            child: const Text("Tamam"),
          ),
        ],
      );
    },
  );
}
