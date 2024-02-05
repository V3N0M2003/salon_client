import 'package:flutter/material.dart';

class BookedAppointment extends StatefulWidget {
  const BookedAppointment({super.key});

  @override
  State<BookedAppointment> createState() => _BookedAppointmentState();
}

class _BookedAppointmentState extends State<BookedAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[20],
      appBar: AppBar(
        title: const Text('Scheduled Appointments'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: const Center(child: Text('Appointments')),
    );
  }
}
