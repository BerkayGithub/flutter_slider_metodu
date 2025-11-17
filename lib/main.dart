import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slider_metodu/menu_dashboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Color backgroundColor = Color(0xFF343442);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

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
