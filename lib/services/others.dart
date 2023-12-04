import 'package:flutter/material.dart';
import 'package:salon_client/common/service_detail.dart';

class Others extends StatefulWidget {
  const Others({super.key});

  @override
  State<Others> createState() => _OthersState();
}

class _OthersState extends State<Others> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Others"),
        backgroundColor: Colors.red,
      ),
      body: ServiceList('Other'),
    );
  }
}
