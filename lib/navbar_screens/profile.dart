import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference _userRef = FirebaseDatabase.instance.reference().child('users');

  String _userName = '';
  String _userEmail = '';

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    try {
      User? currentUser = firebaseAuth.currentUser;
      if (currentUser != null) {
        String userId = currentUser.uid;

        DatabaseReference userRef = _userRef.child(userId);

        // Listen for changes in user data
        userRef.onValue.listen((event) {
          DataSnapshot snapshot = event.snapshot;
          Map<dynamic, dynamic>? userData = snapshot.value as Map<dynamic, dynamic>?;

          if (userData != null) {
            setState(() {
              _userName = userData['username'] ?? '';
              _userEmail = userData['email'] ?? '';
            });
          } else {
            print('User data is null or empty');
          }
        });
      } else {
        print('Current user not authenticated');
        // Handle the case when the user is not authenticated
        // For example, navigate to the login screen
        Navigator.pushReplacementNamed(context, '/login');
      }
    } catch (error) {
      print('Error retrieving user data: $error');
      // Handle any errors that occur during data retrieval
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('प्रोफ़ाइल'),
        backgroundColor: const Color.fromARGB(255, 213, 236, 255),
        elevation: 0,
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg.jpg'),
              fit: BoxFit.cover, // Cover the entire screen
            ),
          ),
        ),
        ListView(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  'https://t3.ftcdn.net/jpg/04/43/94/64/240_F_443946404_7GUoIGZeyx7R7ymCicI3k0xPnrMoKDek.jpg',
                ),
              ),
            ),
            const SizedBox(height: 20),
             Center(
              child: Text(
                '$_userName',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
             Center(
              child: Text(
                '$_userEmail',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('एडिट प्रोफ़ाइल'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('सेटिंग्स'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('लॉगआउट'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
