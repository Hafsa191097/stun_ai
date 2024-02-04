import 'package:StunAi/Widgets/bottom_navbar.dart';
import 'package:StunAi/Widgets/card.dart';
import 'package:StunAi/Widgets/textfield.dart';
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
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
  
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('StunAi'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomnavBar(current_index: index,),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: CharacterCard(),
            ),
            const SizedBox(
              height: 20,
            ),
             TextFieldButton(textEditingController: textEditingController),
          ],
        ),
      ),

    );
  }
}
