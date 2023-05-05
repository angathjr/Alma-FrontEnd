import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendarpage extends StatefulWidget {
  const Calendarpage({super.key});

  @override
  State<Calendarpage> createState() => _CalendarState();
}

class _CalendarState extends State<Calendarpage> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Events Calendar',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: content(),
    );
  }

  Widget content() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: height * 0.5,
          width: width * 01,
          child: TableCalendar(
            rowHeight: 43,
            focusedDay: today,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              weekendTextStyle: const TextStyle(color: Colors.white),
              defaultTextStyle: const TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(50.0),
              ),
              selectedDecoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(50.0)),
            ),
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronIcon: Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 30,
              ),
              rightChevronIcon: Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 30,
              ),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            onDaySelected: _onDaySelected,
          ),
        ),
        Container(
          width: width * 0.8,
          height: height * 0.03,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Scheduled',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                'View all',
                style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 0.9 * width,
          height: 0.129 * height,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: Container(
                  width: 0.8 * width,
                  height: 0.127 * height,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 53, 52, 57),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Attend ACM Meeting',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: 5,
                  top: 25,
                  child: Container(
                    height: 0.065 * height,
                    width: 0.206 * width,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '21',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'MAY',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff6D6AFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
