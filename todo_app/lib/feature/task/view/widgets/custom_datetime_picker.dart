import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/feature/task/view/widgets/custom_task_field.dart';

class CustomDateTimePicker extends StatefulWidget {
  const CustomDateTimePicker({super.key});

  @override
  State<CustomDateTimePicker> createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  DateTime? selectedDateTime;

  @override
  Widget build(BuildContext context) {
    return CustomTaskField(
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2025),
          lastDate: DateTime(2100),
        );

        if (pickedDate == null) return;

        final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );

        if (pickedTime == null) return;

        setState(() {
          selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      },
      text: selectedDateTime == null
          ? 'End Time'
          : DateFormat("d MMMM, y     h:mm a").format(selectedDateTime!),
      prefixIcon: Assets.assetsImagesIconsCalendar,
    );
  }
}
