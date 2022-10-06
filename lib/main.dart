import 'package:flutter/material.dart';
import 'package:flutter_news/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haberin Var Mı?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal[500],
      ),
      home: HomeScreen(),
    );
  }
}
