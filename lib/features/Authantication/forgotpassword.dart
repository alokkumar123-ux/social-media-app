import 'package:e_commerce/features/Authantication/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  TextEditingController forgotpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: forgotpass,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                FirebaseAuth.instance.sendPasswordResetEmail(
                  email: forgotpass.text,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("To reset Password Email is sending")),
                );
              },
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text("Get", style: TextStyle(fontSize: 21)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
