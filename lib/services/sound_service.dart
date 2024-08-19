import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';

class SoundService {
  late final FlutterSoundPlayer soundPlayer;

  SoundService() {
    soundPlayer = FlutterSoundPlayer();
  }

  bool _isSessionActive = false;

  Future<Duration?> playSound({
    required Uint8List sound,
    VoidCallback? whenFinished,
  }) async {
    if (!_isSessionActive) {
      await soundPlayer.openAudioSession();
      _isSessionActive = true;
    }

    return soundPlayer.startPlayer(
      fromDataBuffer: sound,
      whenFinished: whenFinished,
    );
  }

  Future<void> stopPlayerAndCloseSession() async {
    await soundPlayer.stopPlayer();
    if (_isSessionActive) return soundPlayer.closeAudioSession();
  }
}
