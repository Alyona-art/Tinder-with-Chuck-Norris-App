import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyAppState.dart';
import 'StartingPage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Tinder with Chuck Norris',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 239, 233, 243),
              primary: Color.fromARGB(255, 41, 171, 226),
              background: Color.fromARGB(255, 255, 255, 255),
              secondary: Color.fromARGB(255, 241, 90, 36),
              ),
        ),
        home: StartingPage(),
      ),
    );
  }
}
