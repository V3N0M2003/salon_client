import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentBookingPage extends StatefulWidget {
  @override
  _AppointmentBookingPageState createState() => _AppointmentBookingPageState();
}

class _AppointmentBookingPageState extends State<AppointmentBookingPage> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final DateTime _initialDay = DateTime.now();
  final DateTime _startHour = DateTime(2023, 1, 1, 10, 0);
  final DateTime _endHour = DateTime(2023, 1, 1, 21, 0);

  @override
  void initState() {
    super.initState();
    _selectedDay = _initialDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Booking'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TableCalendar(
            focusedDay: _selectedDay,
            firstDay: DateTime.now().subtract(Duration(days: 365)),
            lastDay: DateTime.now().add(Duration(days: 365)),
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              setState(() {
                _selectedDay = focusedDay;
              });
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
            ),
            calendarStyle: CalendarStyle(
              selectedTextStyle: TextStyle(color: Colors.white),
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _endHour.difference(_startHour).inHours,
              itemBuilder: (context, index) {
                final hour = _startHour.add(Duration(hours: index));
                return ListTile(
                  title: Text(
                    '${hour.hour.toString().padLeft(2, '0')}:00 - ${(hour.hour + 1).toString().padLeft(2, '0')}:00',
                  ),
                  onTap: () {
                    print('Selected Date: $_selectedDay');
                    print('Selected time slot: $hour');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
