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
          print('Wapper - Connection State: ${snapshot.connectionState}');
          print('Wapper - Has Data: ${snapshot.hasData}');
          print('Wapper - Has Error: ${snapshot.hasError}');
          if (snapshot.hasData) {
            print('Wapper - User Data: ${snapshot.data?.email}');
          }
          
          // Show loading indicator while checking authentication state
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('Wapper - Showing loading indicator');
            return Center(child: CircularProgressIndicator());
          }

          // Show error if there's an issue with the stream
          if (snapshot.hasError) {
            print('Wapper - Error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Check if user is authenticated
          if (snapshot.hasData && snapshot.data != null) {
            print('Wapper - User is authenticated: ${snapshot.data!.email}');
            print('Wapper - Navigating to Homepage');
            return Chatlog();
          } else {
            print('Wapper - User is not authenticated');
            print('Wapper - Navigating to Login');
            return Login();
          }
        },
      ),
    );
  }
}
