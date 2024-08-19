import 'package:auto_route/auto_route.dart';
import 'package:campus_assistant/features/outdoor_navigation/services/outdoor_location_inference_service.dart';
import 'package:campus_assistant/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/app_bar_back_button.dart';

@RoutePage()
class OutdoorNavigationScreen extends StatelessWidget {
  const OutdoorNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 42,
        title: const Text(
          'Dış Mekan Tarifi',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        leading: const Padding(
            padding: EdgeInsets.only(left: 12), child: AppBarBackButton()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              icon: const Icon(Icons.image, color: Colors.white),
              label: const Text(
                'Choose Image from Gallery',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () async {
                _pickAndShowImage(
                  context: context,
                  imageSource: ImageSource.gallery,
                );
              },
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.camera, color: Colors.white),
              label: const Text(
                'Choose Image from Camera',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                _pickAndShowImage(
                  context: context,
                  imageSource: ImageSource.camera,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickAndShowImage({
    required BuildContext context,
    required ImageSource imageSource,
  }) async {
    final router = context.router;

    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: imageSource);

    if (pickedImage == null) return;

    final image = await pickedImage.readAsBytes();

    final inferenceService = OutdoorLocationInferenceService();
    final boundingBoxes = await inferenceService.runInference(image);

    final imageDecodedFromBytes = await decodeImageFromList(image);

    router.push(
      ViewImageWithBoundingBoxesRoute(
        image: imageDecodedFromBytes,
        boundingBoxes: boundingBoxes,
      ),
    );
  }
}
