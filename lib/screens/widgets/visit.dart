import 'package:flutter/material.dart';

class Visit extends StatefulWidget {
  final String time;

  final bool isSelected;
  final VoidCallback onTap;

  const Visit({
    Key? key,
    required this.time,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  _VisitState createState() => _VisitState();
}

class _VisitState extends State<Visit> {
  @override
  Widget build(BuildContext context) {
    final containerColor =
        widget.isSelected ? const Color(0xffB28CFF) : Colors.white;
    final text1Color = widget.isSelected ? Colors.white : Colors.black;

    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 50,
        width: 70,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.time,
                style: TextStyle(
                  color: text1Color,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VisitList extends StatefulWidget {
  @override
  _VisitListState createState() => _VisitListState();
}

class _VisitListState extends State<VisitList> {
  int selectedScheduleIndex = -1;

  void _handleScheduleTap(int index) {
    setState(() {
      selectedScheduleIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final visit = <Visit>[
      Visit(
          time: '11:00 AM',
          isSelected: selectedScheduleIndex == 0,
          onTap: () => _handleScheduleTap(0)),
      Visit(
          time: '12:00 PM',
          isSelected: selectedScheduleIndex == 1,
          onTap: () => _handleScheduleTap(1)),
      Visit(
          time: '01:00 PM',
          isSelected: selectedScheduleIndex == 2,
          onTap: () => _handleScheduleTap(2)),
      Visit(
          time: '02:00 PM',
          isSelected: selectedScheduleIndex == 3,
          onTap: () => _handleScheduleTap(3)),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: visit,
    );
  }
}
