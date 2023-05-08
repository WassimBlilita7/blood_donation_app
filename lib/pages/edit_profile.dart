import 'package:blood_donation_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late String _userId;
   Stream<DocumentSnapshot>? _userStream = null;

  @override
  void initState() {
    super.initState();

    // Get the current user after login
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userRef = FirebaseFirestore.instance.collection('users').where('email', isEqualTo: user.email).limit(1);

      // Retrieve the user's document from the 'users' collection using the email
      userRef.get().then((QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          final userDoc = querySnapshot.docs.first;
          _userId = userDoc.id;

          // Listen for updates to the user's document using a stream
          _userStream = userDoc.reference.snapshots();
        }
      }).catchError((error) {
        print('Error retrieving user document: $error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,

        title: Text('User Profile' , style: optionStyle,),
      ),
      body: _userStream == null
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder<DocumentSnapshot>(
              stream: _userStream!,
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Text('User not found.');
                }

                // Retrieve the user's document data and display it in the UI
                final userData = snapshot.data!;
                final fullName = userData['full name'] as String?;
                final age = userData['age'] as int?;
                final city = userData['city'] as String?;
                final bloodType = userData['Blood Type'] as String?;
                final email = FirebaseAuth.instance.currentUser?.email;

                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 50,),
                      Image.asset('assets/profile.png' , height: 200, width: 200,),
                      const SizedBox(height: 100,),
                      Text(
                        'Full Name: $fullName',
                        style: TextStyle(fontSize: 18 , fontFamily: 'Alkatra' , ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Age: $age',
                        style: TextStyle(fontSize: 18 , fontFamily: 'Alkatra'),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'City: $city',
                        style: TextStyle(fontSize: 18 , fontFamily: 'Alkatra'),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Blood Type: $bloodType',
                        style: TextStyle(fontSize: 18 , fontFamily: 'Alkatra'),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Email: $email',
                        style: TextStyle(fontSize: 18 , fontFamily: 'Alkatra'),
                      ),
                      const SizedBox(height: 50,)
                    ],
                  ),
                );
              },
            ),
    );
  }
}