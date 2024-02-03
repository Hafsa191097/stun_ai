import 'package:flutter/material.dart';

import '../Widgets/bottom_navbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static const String route = '/profile';
  
  @override
  Widget build(BuildContext context) {
    int index=0;
    return Scaffold(
      body: Center(

        child: Text('Profile'),
      ),
      bottomNavigationBar: BottomnavBar(current_index: index,),
    );
  }
}