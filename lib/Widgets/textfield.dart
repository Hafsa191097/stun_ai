
import 'package:flutter/material.dart';

class TextFieldButton extends StatelessWidget {
  const TextFieldButton({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Material(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Row(
           children: [
             Expanded(
               flex: 5,
               child: TextField(
                 style:  const TextStyle(color: Colors.black54),
                 controller: textEditingController,
                 onSubmitted: (value) async {
                   
                 },
                 decoration:  const InputDecoration.collapsed(
                   hintText: "Insert Text To generate Image",
                   hintStyle: TextStyle(color: Colors.grey),
                 ),
               ),
             ),
             IconButton(
               onPressed: () async {
                 
               },
               icon:  const Icon(
                 Icons.send,
                 color:  Colors.black54,
               ),
             ),
           ],
         ),
       ),
    );
  }
}