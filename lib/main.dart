import 'package:flutter/material.dart';
import 'package:flutter_train_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.grey[200],
        primaryColor: Colors.white,
        unselectedWidgetColor: Colors.grey[300],
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.grey[600],
        unselectedWidgetColor: Colors.grey[600],
      ),
      home: HomePage(),
    );
  }
}
