import 'package:StunAi/Widgets/bottom_navbar.dart';
import 'package:StunAi/Widgets/card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String route = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: non_constant_identifier_names
  int index = 0;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('StunAi - Image Generator'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomnavBar(current_index: index,),
      
      body: Center(
        child: CharacterCard(),

      ),

    );
  }
}