import 'package:flutter/material.dart';
import 'package:salon_client/services/beard.dart';
import 'package:salon_client/services/facial.dart';
import 'package:salon_client/services/haircut.dart';
import 'package:salon_client/services/others.dart';
import 'package:salon_client/utils/category_builder.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.only(top: 40, left: 15),
                child: Row(
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
                      color: const Color.fromARGB(255, 247, 78, 66),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              //CustomSearchBar(searchController: 'hello', onSearchTextChanged: onSearchTextChanged)
              Container(
                  height: 220,
                  //padding: EdgeInsets.only(top: 40),
                  //decoration: BoxDecoration(color: Colors.grey[200]),
                  child: Center(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    child:
                        //Text('    Categories', style: TextStyle(fontSize: 20)),
                        //SizedBox(height: 10),
                        SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 16),
                          CategoryContainer(
                              'Hair cut', 'assets/icons/mysalon.png', () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HairCut()));
                          }),
                          SizedBox(width: 16),
                          CategoryContainer('Beard', 'assets/icons/beard.png',
                              () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Beard()));
                          }),
                          SizedBox(width: 16),
                          CategoryContainer('Facial', 'assets/icons/facial.png',
                              () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Facial()));
                          }),
                          SizedBox(width: 16),
                          CategoryContainer('Others', 'assets/icons/others.png',
                              () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Others()));
                          }),
                          SizedBox(width: 16),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: 20),
              Text(
                '    Popular',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
