import 'package:blood_donation_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DonationHistory extends StatelessWidget {
  const DonationHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Donation History' , style: optionStyle,),
        backgroundColor: kPrimaryColor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('donation_requests')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final documents = snapshot.data!.docs;

          if (documents.isEmpty) {
            return const Center(
              child: Text('No donation requests found.'),
            );
          }

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final data = documents[index].data() as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8 , vertical: 3),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.5
                    ), 
                    borderRadius: BorderRadius.circular(2), 
                  ),
                  
                  title: Text(data['title'] ?? '' , style: optionStyle,),
                  subtitle: Row(
                    children: [
                      Text(data['requiredAmount'].toString() ?? '' , style: TextStyle(
                        fontFamily: 'Alkatra' , 
                        color: Colors.lightBlue
                      ),),
                      Text(' millilitres' , style: TextStyle(
                        fontFamily: 'Alkatra' , 
                        color: Colors.lightBlue
                      ),)
                    ],
                  ),
                  trailing: CircleAvatar(
                    radius: 30,
                    backgroundColor: kPrimaryColor,
                    foregroundColor: kSecondaryColor,
                    child: Text(data['Blood Type'] ?? '')
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