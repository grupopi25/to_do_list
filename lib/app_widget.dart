import 'package:flutter/material.dart';
import 'package:to_do_list/home_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  bool temaAtual = true;

  final light = ThemeData.light();
  final dark = ThemeData.dark();
  toggleMode() {
    setState(() {
      temaAtual ? light : dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: temaAtual ? dark : light,
      debugShowCheckedModeBanner: false,
      home: HomePage(onToggleChanger: toggleMode, isDarkMode: temaAtual),
    );
  }
}
