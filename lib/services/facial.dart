import 'package:flutter/material.dart';
import 'package:salon_client/common/service_detail.dart';

class Facial extends StatefulWidget {
  const Facial({super.key});

  @override
  State<Facial> createState() => _FacialState();
}

class _FacialState extends State<Facial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Facial"),
        backgroundColor: Colors.red,
      ),
      body: const ServiceList('Facial'),
    );
  }
}
