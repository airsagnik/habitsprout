import 'package:flutter/material.dart';

class TodoScheduler extends StatefulWidget {
  final TextEditingController dateTimeController;
  const TodoScheduler({super.key, required this.dateTimeController});

  @override
  State<TodoScheduler> createState() => _TodoSchedulerState();
}

class _TodoSchedulerState extends State<TodoScheduler> {
  // Controller to handle the input field
  final TextEditingController _dateTimeController = TextEditingController();

  // DateTime variable to store user input
  DateTime? _selectedDateTime;

  // Show DatePicker dialog
  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      // Show TimePicker dialog after DatePicker
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime:
            TimeOfDay.fromDateTime(_selectedDateTime ?? DateTime.now()),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          _dateTimeController.text = _formatDateTime(_selectedDateTime!);
          widget.dateTimeController.text = _selectedDateTime.toString();
        });
      }
    }
  }

  // Format DateTime to a user-friendly string
  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} "
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _dateTimeController,
      readOnly: true,
      decoration: const InputDecoration(
        labelText: 'Due date and time',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        if (mounted) {
          _selectDateTime(context);
        }
      },
    );
  }
}
