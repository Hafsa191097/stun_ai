import 'package:flutter/material.dart';

class CharacterCard extends StatefulWidget {
  CharacterCard({
    Key? key,
  }) : super(key: key);

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.9,
                          height: MediaQuery.of(context).size.height*0.7,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Image.asset(
                            'assets/profile.png',
                            height: 135,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(Icons.favorite),
                              onPressed: () async {
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(Icons.download),
                              onPressed: () async {
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    
                  ],
                ),
              ),
            ),
          );
        
  }
}