import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:flutter/material.dart';
import 'package:localstorage/DB/savelog.dart';
import 'package:localstorage/welcome.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    save s = save();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(height: 80),
             Text("Log in",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,),
            ),
             SizedBox(
              height: 40),
            // Email field
            TextField(           
               controller: username,
               decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
               hintText: "useranme",
              ),
            ),
           SizedBox(
            height: 20
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: "password",
              ),
            ),

             SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  if(username.text=="admin"&&password.text=='123'){
                    s.Login();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => we(),));
                  }
                  // log("${username.text}");
                  // log("${password.text}");
                },
                child:Text("Log In",style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
