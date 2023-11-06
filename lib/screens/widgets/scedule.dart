import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  final String date;
  final String day;
  final bool isSelected;
  final VoidCallback onTap;

  const Schedule({
    Key? key,
    required this.date,
    required this.day,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    final containerColor =
        widget.isSelected ? const Color(0xffB28CFF) : Colors.white;
    final text1Color = widget.isSelected ? Colors.white : Colors.black;
    final text2Color = widget.isSelected ? Colors.white : Colors.grey;

    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 0.5,
            style: BorderStyle.solid,
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 2),
              color: Colors.grey[300]!,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Text(
                widget.date,
                style: TextStyle(
                  color: text1Color,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                widget.day,
                style: TextStyle(
                  color: text2Color,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleList extends StatefulWidget {
  @override
  _ScheduleListState createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  int selectedScheduleIndex = -1;

  void _handleScheduleTap(int index) {
    setState(() {
      selectedScheduleIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final schedules = <Schedule>[
      Schedule(
          date: '7',
          day: 'Sun',
          isSelected: selectedScheduleIndex == 0,
          onTap: () => _handleScheduleTap(0)),
      Schedule(
          date: '8',
          day: 'Mon',
          isSelected: selectedScheduleIndex == 1,
          onTap: () => _handleScheduleTap(1)),
      Schedule(
          date: '9',
          day: 'Tue',
          isSelected: selectedScheduleIndex == 2,
          onTap: () => _handleScheduleTap(2)),
      Schedule(
          date: '10',
          day: 'Wed',
          isSelected: selectedScheduleIndex == 3,
          onTap: () => _handleScheduleTap(3)),
      Schedule(
          date: '11',
          day: 'Thu',
          isSelected: selectedScheduleIndex == 4,
          onTap: () => _handleScheduleTap(4)),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: schedules,
    );
  }
}
