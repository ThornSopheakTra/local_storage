import 'package:flutter/material.dart';

class we extends StatelessWidget {
  const we({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home screen"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(90.0),
          child: Column(
            children: [
              Text("home Screen",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                }
              , child: Text("Back")),
            ],
          ),
        ),
      ),
    );
  }
}