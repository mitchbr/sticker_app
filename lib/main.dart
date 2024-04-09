import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'main_screen.dart';
import 'package:sticker_map/custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      title: 'StickieDB',
      theme: CustomTheme().customTheme(),
      home: const StickerMap(),
    ),
  );
}
