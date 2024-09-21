import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/inventory_screen.dart';
import 'screens/login_screen.dart';
import 'screens/quest_screen.dart';

void main() {
  runApp(PixelQuestApp());
}

class PixelQuestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixel Quest',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        brightness: Brightness.light,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 14),
          bodyMedium: TextStyle(fontSize: 14),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/inventory': (context) => InventoryScreen(),
        '/quest': (context) => QuestScreen(),
      },
    );
  }
}