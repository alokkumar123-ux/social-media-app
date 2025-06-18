import 'package:e_commerce/features/Authantication/forgotpassword.dart';
import 'package:e_commerce/features/Authantication/signup.dart';
import 'package:e_commerce/features/Authantication/wapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
  signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailcontroler.text,
      password: passwordcontroler.text,
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Wapper()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        isdark
                            ? "assets/pandasall.png"
                            : "assets/pandasall.png",
                        width: 200,
                      ),
                      Text(
                        "Welcome Back,",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailcontroler,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: passwordcontroler,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: Icon(Icons.visibility_off_outlined),
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (_) {}),
                        Text("Remember me"),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Forgotpassword(),
                              ),
                            );
                          },
                          child: Text(
                            "Forget Password",
                            style: TextStyle(color: Colors.indigoAccent),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () => signin(),
                child: Container(
                  child: Center(
                    child: Text(
                      "sign In",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigoAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: double.infinity,
                  height: 50,
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signup()),
                  );
                },
                child: Container(
                  child: Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: double.infinity,
                  height: 50,
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Flexible(
                    child: Divider(thickness: 1, indent: 60, endIndent: 5),
                  ),
                  Text("or sign in with "),
                  Flexible(
                    child: Divider(thickness: 1, indent: 5, endIndent: 60),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(child: Image.asset("assets/pandasall.png")),
                  SizedBox(width: 20),

                  CircleAvatar(child: Image.asset("assets/pandasall.png")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
