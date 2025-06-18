import 'package:e_commerce/features/Authantication/onboarding.dart';
import 'package:e_commerce/features/Authantication/wapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final box = GetStorage();
  bool seenOnboarding = box.read("seenOnboarding") ?? false;
  //init await Native splash
  //init authantication
  runApp(MyApp(change: seenOnboarding));
}

class MyApp extends StatefulWidget {
  final bool change;

  const MyApp({super.key, required this.change});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: widget.change == true ? Wapper() : Onboarding(),
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
