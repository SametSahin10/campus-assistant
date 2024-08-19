import 'package:auto_route/auto_route.dart';
import 'package:campus_assistant/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

@RoutePage<BarcodeCapture>()
class QrCodeScannerScreen extends StatelessWidget {
  const QrCodeScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      onDetect: (barcodeCapture) {
        // onDetect is called twice for the same barcode for some reason.
        // The if check is necessary to prevent
        // the app from popping the route twice.
        if (context.router.topRoute.name == QrCodeScannerRoute.name) {
          context.router.maybePop(barcodeCapture);
        }
      },
    );
  }
}
