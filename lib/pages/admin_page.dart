import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pending Donations'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('donation_requests')
            .where('approved', isEqualTo: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot donation = snapshot.data!.docs[index];
              return ListTile(
                title: Text(donation['title']),
                subtitle: Text(donation['description']),
                trailing: ElevatedButton(
                  onPressed: () => approveDonation(donation.id),
                  child: Text('Approve'),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void approveDonation(String donationId) {
    FirebaseFirestore.instance
        .collection('donation_requests')
        .doc(donationId)
        .update({'approved': true});
  }
}