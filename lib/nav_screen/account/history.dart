import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salon_client/nav_screen/account/historylist.dart';
import 'package:salon_client/nav_screen/account/historylist2.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({super.key});

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        backgroundColor: Colors.red,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('bookings').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No data available.'));
            }

            User? user = _auth.currentUser;
            final documents = snapshot.data!.docs;
            final Data = documents
                .where((doc) => doc['userId'].contains(user!.uid))
                .toList();

            if (Data.isEmpty) {
              return Center(child: Text('No data available.'));
            }

            return ListView.builder(
              itemCount: Data.length,
              itemBuilder: (context, index) {
                final doc = Data[index];

                return Column(
                  children: [
                    HistoryFetch(
                        date: doc['bookingDate'].toString(),
                        timeSlot: doc['selectedTimeSlot'].toString(),
                        serviceId: doc['selectedHairstyle'],
                        userId: doc['userId']),
                    /*HistoryListbuilder(
                        doc['bookingDate'].toString(),
                        doc['selectedTimeSlot'].toString(),
                        doc['selectedHairstyle'],
                        doc['userId']),*/
                    /*Text(
                      doc['bookingDate'].toString(),
                    ),
                    Text(
                      doc['selectedTimeSlot'].toString(),
                    ),*/
                    SizedBox(
                      height: 5,
                    )
                  ],
                );
              },
            );
          }),
    );
  }
}
