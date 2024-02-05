import 'package:flutter/material.dart';
import 'package:salon_client/common/service_detail.dart';

class Beard extends StatefulWidget {
  const Beard({super.key});

  @override
  State<Beard> createState() => _BeardState();
}

class _BeardState extends State<Beard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beard"),
        backgroundColor: Colors.red,
      ),
      body: const ServiceList('Beard'),
    );
  }
}
