import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DonationApprovalsPage extends StatefulWidget {
  @override
  _DonationApprovalsPageState createState() => _DonationApprovalsPageState();
}

class _DonationApprovalsPageState extends State<DonationApprovalsPage> {
  bool isAdmin = false;

  @override
  void initState() {
    super.initState();
    _checkAdminStatus();
  }

  Future<void> _checkAdminStatus() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        isAdmin = userDoc['isAdmin'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation Approvals'),
      ),
      body: isAdmin
          ? StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('donation_approvals')
                  .where('approved', isEqualTo: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                List<DocumentSnapshot> docs = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(docs[index]['donationRequestId']),
                      trailing: IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () {
                          _approveDonationRequest(docs[index].id);
                        },
                      ),
                    );
                  },
                );
              },
            )
          : Center(
              child: Text('You do not have permission to view this page.'),
            ),
    );
  }

  void _approveDonationRequest(String approvalId) async {
    // Update the approval document to set "approved" to true and "approvedBy" to the current admin
    await FirebaseFirestore.instance
        .collection('donation_approvals')
        .doc(approvalId)
        .update({
      'approved': true,
      'approvedBy': FirebaseAuth.instance.currentUser!.uid,
    });
  }
}