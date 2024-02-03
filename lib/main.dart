import 'package:StunAi/Views/home.dart';
import 'package:StunAi/Views/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StunAi - Image Generator',
      
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade200,
        ),
        scaffoldBackgroundColor: Colors.grey.shade100,
        useMaterial3: true,
      ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.route : (context) =>  const HomeScreen(),
        ProfilePage.route : (context) =>  const ProfilePage(),
      },

    );
  }
}
