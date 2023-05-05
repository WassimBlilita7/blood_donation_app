import 'package:blood_donation_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListDonor extends StatefulWidget {
  static const String id = 'list_donor';

  @override
  _ListDonorState createState() => _ListDonorState();
}

class _ListDonorState extends State<ListDonor> {
  Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Donors' , style: optionStyle,),
        centerTitle: true, 
        backgroundColor: kPrimaryColor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              final data =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;

              return Card(
                shadowColor: Colors.lightBlue,
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.person, color: kPrimaryColor,),
                    title: Text(data['full name'] ?? '' , style: optionStyle,),
                    subtitle: Text('Age: ${data['age'] ?? ''}' , style: optionStyle,),
                    trailing: CircleAvatar(
                      radius: 30,
                      backgroundColor: kPrimaryColor,
                      foregroundColor: kSecondaryColor,
                      child:
                     Text(data['Blood Type'] ?? '')),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}