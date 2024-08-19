import 'package:campus_assistant/firebase_options.dart';
import 'package:campus_assistant/navigation/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _rootRouter = RootRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Campus Assistant',
      theme: ThemeData(
        primaryColor: const Color(0xFF00CF91),
        useMaterial3: true,
        textTheme: GoogleFonts.redHatDisplayTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00CF91),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
      routerConfig: _rootRouter.config(),
    );
  }
}
