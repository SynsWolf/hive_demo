import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'vue/page_principale.dart';

/* Commandes à rouler:
*
*  Flutter pub get
*  flutter pub add hive hive_flutter
8  flutter pub add hive_generator --dev build_runner --dev
*/

void main() async {
  await Hive.initFlutter();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: PagePrincipale()),
    );
  }
}
