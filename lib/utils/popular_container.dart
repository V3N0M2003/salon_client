import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salon_client/common/detail.dart';

class PopularStyle extends StatelessWidget {
  final String documentId;

  const PopularStyle({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('services')
          .doc(documentId)
          .snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Center(
            child: Text('No data'),
          );
        }

        var data = snapshot.data!.data() as Map<String, dynamic>;
        String price = data['price'].toString();

        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsPage(
                        name: data['name'],
                        section: data['section'],
                        category: data['category'],
                        description: data['description'],
                        imageUrl: data['imageUrl'],
                        price: data['price'],
                        id: documentId)));
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width - 25,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                border: Border.all(width: 0.7),
                boxShadow: const [
                  BoxShadow(color: Colors.grey, offset: Offset(4, 4))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      border: Border.all(width: 1.0),
                    ),
                    child: Image.network(
                      data['imageUrl'],
                      height: 270,
                      width: 200,
                      // fit: BoxFit.fill,
                    )),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(data['name'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                        Text("Rs. - $price",
                            style: const TextStyle(fontSize: 17)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "${"                 " + data['section']} " +
                              data['category'],
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
