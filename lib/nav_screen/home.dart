import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:salon_client/services/beard.dart';
import 'package:salon_client/services/facial.dart';
import 'package:salon_client/services/haircut.dart';
import 'package:salon_client/services/others.dart';
import 'package:salon_client/utils/category_builder.dart';
import 'package:salon_client/utils/popular_container.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Map<String, dynamic>> result = [];

  Future<void> fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('bookings').get();

    Map<String, int> countMap = {};

    for (QueryDocumentSnapshot document in querySnapshot.docs) {
      String serviceId = document['selectedHairstyle'];
      countMap[serviceId] = (countMap[serviceId] ?? 0) + 1;
    }

    List<MapEntry<String, int>> sortedServiceIds = countMap.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    result = sortedServiceIds
        .map((serviceId) => {'serviceId': serviceId.key})
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[20],
      appBar: AppBar(
        title: const Text("Salooooooo...."),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40, left: 15),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HEY !',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Welcome to Salon',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    Icon(
                      Icons.emoji_people,
                      size: 50,
                      color: Color.fromARGB(255, 247, 78, 66),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                  height: 220,
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(width: 16),
                          CategoryContainer(
                              'Hair cut', 'assets/icons/mysalon.png', () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HairCut()));
                          }),
                          const SizedBox(width: 16),
                          CategoryContainer('Beard', 'assets/icons/beard.png',
                              () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Beard()));
                          }),
                          const SizedBox(width: 16),
                          CategoryContainer('Facial', 'assets/icons/facial.png',
                              () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Facial()));
                          }),
                          const SizedBox(width: 16),
                          CategoryContainer('Others', 'assets/icons/others.png',
                              () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Others()));
                          }),
                          const SizedBox(width: 16),
                        ],
                      ),
                    ),
                  )),
              const SizedBox(height: 10),
              const Text(
                '    Popular',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              FutureBuilder<void>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      //scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10.0),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(13),
                          child: PopularStyle(
                              documentId: result[index]['serviceId']),
                        );
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 20)
            ],
          ),
        ],
      ),
    );
  }
}
