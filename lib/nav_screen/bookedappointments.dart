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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Scheduled Appointments'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(child: Text('Appointments')),
    );
  }
}
