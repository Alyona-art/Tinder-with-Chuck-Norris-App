import 'package:flutter/material.dart';
import 'presentation/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinder with Chuck Norris',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 233, 236, 238),
          primary: Color.fromARGB(255, 41, 171, 226),
          primaryContainer: Color.fromARGB(255, 255, 255, 255),
          background: Color.fromARGB(255, 233, 237, 241),
          secondary: Color.fromARGB(255, 241, 90, 36),
        ),
      ),
      home: MainPage(),
    );
  }
}
