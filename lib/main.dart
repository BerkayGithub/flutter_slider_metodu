import 'package:flutter/material.dart';
import 'package:flutter_slider_metodu/menu_dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Slider App",
      theme: ThemeData(),
      home: MenuDashboard(),
    );
  }
}
