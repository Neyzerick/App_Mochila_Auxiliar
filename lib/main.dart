import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'utils/app_colors.dart';

void main() {
  runApp(const EmergencyBagApp());
}

class EmergencyBagApp extends StatelessWidget {
  const EmergencyBagApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mochila de Emergencia',
      theme: ThemeData(
        useMaterial3: true,

        scaffoldBackgroundColor: AppColors.background,

        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 240, 144, 0),
        ),

        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 25,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.background,
          surfaceTintColor: AppColors.background,
        ),

        cardTheme: CardThemeData(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
