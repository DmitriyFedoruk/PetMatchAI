import 'package:flutter/material.dart';
import 'package:pet_match_ai/core/navigation/router.dart';
import 'package:pet_match_ai/core/theme/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
