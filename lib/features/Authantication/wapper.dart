import 'package:e_commerce/features/Authantication/login.dart';
import 'package:e_commerce/features/personalization/chatlog.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wapper extends StatefulWidget {
  const Wapper({super.key});

  @override
  State<Wapper> createState() => _WapperState();
}

class _WapperState extends State<Wapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('Wapper - User Data: ${snapshot.data?.email}');
          }
          
          // Show loading indicator while checking authentication state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Show error if there's an issue with the stream
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Check if user is authenticated
          if (snapshot.hasData && snapshot.data != null) {
            return Chatlog();
          } else {
            return Login();
          }
        },
      ),
    );
  }
}
