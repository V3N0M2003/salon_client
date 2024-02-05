// ignore: unused_import
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:salon_client/booking/book_appointment%20copy.dart';
import 'package:salon_client/utils/textbox.dart';

class DetailsPage extends StatefulWidget {
  final String name;
  final String gender;
  final String category;
  final String description;
  final num price;
  final String imageUrl;
  final String id;
  const DetailsPage(
      {required this.name,
      required this.gender,
      required this.category,
      required this.description,
      required this.imageUrl,
      required this.price,
      required this.id,
      Key? key})
      : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late String _name;
  late String _gender;
  late String _category;
  late String _description;
  late num _price;
  late String _imageUrl;
  late String _id;

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _gender = widget.gender;
    _category = widget.category;
    _description = widget.description;
    _imageUrl = widget.imageUrl;
    _price = widget.price;
    _id = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Image.network(
                  _imageUrl,
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                const Text('Name : '),
                const SizedBox(height: 5),
                TextBox(_name),
                const SizedBox(height: 20),
                const Text('Category : '),
                const SizedBox(height: 5),
                TextBox(_category),
                const SizedBox(height: 20),
                const Text('Gender : '),
                const SizedBox(height: 5),
                TextBox(_gender),
                const SizedBox(height: 20),
                const Text('Price : '),
                const SizedBox(height: 5),
                TextBox(_price.toString()),
                const SizedBox(height: 20),
                const Text('Description : '),
                const SizedBox(height: 5),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.amber[50],
                    border: Border.all(width: 0.7),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(_description),
                ),
              ],
            ),
          )),
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AppointmentBookingWidget(
                            hairstyleId: _id,
                          )));
            },
            child: const Text('Book'),
          ),
        ),
      ),
    );
  }
}
