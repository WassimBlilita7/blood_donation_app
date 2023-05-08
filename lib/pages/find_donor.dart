import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchDonation extends StatefulWidget {
  static const String id = 'SearchDonation';

  @override
  _SearchDonationState createState() => _SearchDonationState();
}

class _SearchDonationState extends State<SearchDonation> {
  final bloodTypeController = TextEditingController();
  String? selectedBloodType;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    bloodTypeController.dispose();
    super.dispose();
  }

  void _submitSearch() {
    setState(() {
      // Refresh the search results when the user submits the search
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Donation'),
      ),
      body: Column(
        children: [
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: bloodTypeController,
                    decoration: InputDecoration(
                      hintText: 'Enter blood type',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: _submitSearch,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('donation_requests')
                  .where('blood_type', isEqualTo: bloodTypeController.text)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No donation requests found'));
                }
                return ListView(
                  children: snapshot.data!.docs.map((document) {
                    return Card(
                      child: ListTile(
                        title: Text(document['title']),
                        subtitle: Text(document['description']),
                        trailing: Text(document['blood_type']),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}