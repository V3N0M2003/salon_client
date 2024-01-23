import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:salon_client/common/detail.dart';
import 'package:salon_client/utils/service_box.dart';

class ServiceList extends StatelessWidget {
  final String category;
  const ServiceList(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('services').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No data available.'));
        }

        final documents = snapshot.data!.docs;
        final Data = documents
            .where((doc) => doc['category'].contains(category))
            .toList();

        if (Data.isEmpty) {
          return Center(child: Text('No data available.'));
        }

        return ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: Data.length,
          itemBuilder: (context, index) {
            final doc = Data[index];

            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      border: Border.all(width: 0.7),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, offset: Offset(4, 4))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ServiceDisplay(doc['name'], doc['gender'],
                          doc['imageUrl'], doc['price'], () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                    name: doc['name'],
                                    gender: doc['gender'],
                                    category: doc['category'],
                                    description: doc['description'],
                                    imageUrl: doc['imageUrl'],
                                    price: doc['price'],
                                    id: doc.id)));
                      }),
                      Icon(
                        Icons.format_align_justify_outlined,
                        size: 30,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            );
          },
        );
      },
    );
  }
}
