//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:localstorage/DB/Local_DB.dart';

class add extends StatelessWidget {
   add({super.key});
  TextEditingController title = TextEditingController();
  TextEditingController description=TextEditingController();
  LocalDB db= LocalDB();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                 // borderRadius: BorderRadius.circular(18),
                ),
                hintText: "Enter",
              ),
            ),
            SizedBox(height: 40,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Description"
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () {
              // print("$title.text");
              // print("$description.text");
              db.insertNote(title.text, description.text);

            }, child: Text("Add Note"))
          ],
        ),
      ),
    );
  }
}