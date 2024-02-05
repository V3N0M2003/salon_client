import 'package:flutter/material.dart';
import 'package:salon_client/common/service_detail.dart';

class HairCut extends StatefulWidget {
  const HairCut({super.key});

  @override
  State<HairCut> createState() => _HairCutState();
}

class _HairCutState extends State<HairCut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hair-cut"),
        backgroundColor: Colors.red,
      ),
      body: const ServiceList('Hair cut'),
    );
  }
}
