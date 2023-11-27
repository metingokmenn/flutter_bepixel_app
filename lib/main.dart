import 'package:flutter/material.dart';
import 'package:flutter_bepixel_app/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BePixel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 133, 25, 17)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
