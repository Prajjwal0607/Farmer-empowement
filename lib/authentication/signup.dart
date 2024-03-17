import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:farmer/home_page.dart';
import 'login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference _userRef = FirebaseDatabase.instance.reference().child('users');

  final userName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the Firebase Realtime Database reference
    // _userRef = FirebaseDatabase.instance.reference().child('users');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CREATE ACCOUNT', style: TextStyle(fontSize: 28)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text('Please SignUp To Continue'),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: userName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.person_outline),
                    labelText: 'Full Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.email),
                    labelText: 'Email Address',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.lock),
                    labelText: 'Create Password',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  SignUpMethod(context);
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Row(
                  children: [
                    const Text('Already Have An Account!'),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        ' Login Here',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              Image.asset(
                'images/login_bg.jpg',
                height: 205,
                width: 400,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> SignUpMethod(BuildContext context) async {
    try {
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email.text.toString().trim(),
        password: password.text.toString(),
      );

      String userId = userCredential.user?.uid ?? '';

      await _userRef.child(userId).set({
        'username': userName.text.toString().trim(),
        'email': email.text.toString().trim(),
      });

      // Navigate to the home screen after successful sign-up
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Homepage(),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sign up failed. Please try again.'),
        ),
      );
      print('Sign up error: $error');
    }
  }

  @override
  void dispose() {
    userName.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
