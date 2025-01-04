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
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.purple,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(
          Icons.date_range,
          color: Colors.blue,
        ),

        labelText: 'Due Date',
        border: OutlineInputBorder(), // Optional: Adds a border
      ),
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      onTap: () {
        if (mounted) {
          _selectDateTime(context);
        }
      },
    );
  }
}
