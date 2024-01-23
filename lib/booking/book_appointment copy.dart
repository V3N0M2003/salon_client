import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentBookingWidget extends StatefulWidget {
  final String hairstyleId;

  AppointmentBookingWidget({required this.hairstyleId});

  @override
  _AppointmentBookingWidgetState createState() =>
      _AppointmentBookingWidgetState();
}

class _AppointmentBookingWidgetState extends State<AppointmentBookingWidget> {
  DateTime _selectedDay = DateTime.now();
  List<String> _timeSlots = [];
  List<String> _bookedTimeSlots = [];
  late String _selectedHairstyle;

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _selectedHairstyle = widget.hairstyleId;
    _fetchBookedTimeSlots();
  }

  void generateTimeSlots() {
    _timeSlots.clear();
    for (int hour = 10; hour <= 21; hour++) {
      _timeSlots.add('$hour:00 - ${hour + 1}:00');
    }
  }

  Future<void> _fetchBookedTimeSlots() async {
    String formattedDate =
        "${_selectedDay.year}-${_selectedDay.month}-${_selectedDay.day}";
    QuerySnapshot querySnapshot = await _firestore
        .collection('bookings')
        .where('bookingDate', isEqualTo: formattedDate)
        //.where('selectedHairstyle', isEqualTo: widget.hairstyleId)
        .get();

    setState(() {
      _bookedTimeSlots = querySnapshot.docs
          .map((doc) => doc['selectedTimeSlot'] as String)
          .toList();
    });
  }

  Future<bool> showBookingConfirmationDialog() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Booking'),
          content: Text('Do you want to confirm the booking?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _handleDaySelected(DateTime date, DateTime events) async {
    setState(() {
      _selectedDay = date;
    });
    generateTimeSlots();
    await _fetchBookedTimeSlots();
  }

  Future<void> bookAppointment(String selectedTimeSlot) async {
    try {
      User? user = _auth.currentUser;

      bool bookingConfirmed = await showBookingConfirmationDialog();

      if (bookingConfirmed) {
        await _firestore.collection('bookings').add({
          'userId': user?.uid,
          'selectedHairstyle': _selectedHairstyle,
          'selectedTimeSlot': selectedTimeSlot,
          'bookingDate':
              "${_selectedDay.year}-${_selectedDay.month}-${_selectedDay.day}",
        });

        _fetchBookedTimeSlots();

        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Booking Successful'),
              content: Text('Your appointment has been booked.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print('Failed to book appointment: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Booking'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _selectedDay,
            firstDay: DateTime.now().subtract(Duration(days: 30)),
            lastDay: DateTime.now().add(Duration(days: 30)),
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
              CalendarFormat.week: 'Week',
            },
            calendarFormat: CalendarFormat.month,
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonShowsNext: false,
            ),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            calendarStyle: CalendarStyle(
                selectedDecoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle)),
            enabledDayPredicate: (day) {
              return !day.isBefore(DateTime.now().subtract(Duration(days: 1)));
            },
            onDaySelected: (date, events) => _handleDaySelected(date, events),
          ),
          SizedBox(height: 20),
          Text(
            'Available Time Slots:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: _timeSlots.length,
              itemBuilder: (context, index) {
                bool isBooked = _bookedTimeSlots.contains(_timeSlots[index]);

                return GestureDetector(
                  onTap: isBooked
                      ? null
                      : () => bookAppointment(_timeSlots[index]),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isBooked ? Colors.red : Colors.green,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        _timeSlots[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
