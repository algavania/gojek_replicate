import 'package:flutter/material.dart';
import 'package:gojek_replicate/views/login.dart';

void main() {
  const MaterialColor primarySwatch = const MaterialColor(
    0xFF2E7D32,
    const <int, Color>{
      50: const Color(0xFF2E7D32),
      100: const Color(0xFF2E7D32),
      200: const Color(0xFF2E7D32),
      300: const Color(0xFF2E7D32),
      400: const Color(0xFF2E7D32),
      500: const Color(0xFF2E7D32),
      600: const Color(0xFF2E7D32),
      700: const Color(0xFF2E7D32),
      800: const Color(0xFF2E7D32),
      900: const Color(0xFF2E7D32),
    },
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Color(0xFF2E7D32),
        primarySwatch: primarySwatch,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.green[800],
          ),
        )),
    home: Login(),
  ));
}
