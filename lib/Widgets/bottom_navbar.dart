import 'package:StunAi/Views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Views/profile.dart';

class BottomnavBar extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const BottomnavBar({super.key,required this.current_index});
  // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
  final int current_index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: current_index,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withAlpha(100),
        useLegacyColorScheme:true,
          type: BottomNavigationBarType.fixed,
        onTap: (value) {
          
        },
        items:[
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () { 
              Navigator.pushNamed(context, HomeScreen.route);
            }, 
           icon: const Icon(Icons.home_outlined),
          ),
          label: 'Home',
        ),
         BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () { 
              Navigator.pushNamed(context, HomeScreen.route);
            }, 
           icon: const Icon(Icons.favorite_outline),
          ),
          label: 'Favorites',
        ),
         BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () { 
              Navigator.pushNamed(context, HomeScreen.route);
            }, 
           icon: const Icon(Icons.history_outlined),
          ),
          label: 'History',
        ),
         BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () { 
              Navigator.pushNamed(context, ProfilePage.route);
            }, 
           icon: const Icon(Icons.person_2_outlined),
          ),
          label: 'Profile',
        ),
        ],

      );
  }
}