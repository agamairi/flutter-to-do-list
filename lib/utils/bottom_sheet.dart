import 'package:flutter/material.dart';
import 'package:to_do_app/utils/myButton.dart';

class AddTaskSheet extends StatefulWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  AddTaskSheet({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    //required this.selectedDate,
  });

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // void dateSelector() {
    //   showDatePicker(
    //     context: context,
    //     initialDate: DateTime.now(),
    //     initialDatePickerMode: DatePickerMode.day,
    //     firstDate: DateTime.now(),
    //     lastDate: DateTime(2100),
    //   ).then((value) {
    //     setState(() {
    //       selectedDate = value!;
    //     });
    //   });
    //   //showTimePicker(context: context, initialTime: TimeOfDay.now());
    // }

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        color: const Color(0xFFF7D6E0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: widget.controller,
              decoration: const InputDecoration(
                hoverColor: Color(0xFFB2F7EF),
                border: OutlineInputBorder(),
                hintText: "Add a new Task",
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     MaterialButton(
            //       color: Theme.of(context).primaryColor,
            //       onPressed: dateSelector,
            //       child: const Text("Select Date"),
            //     ),
            //     Text(
            //       selectedDate.toString(),
            //     ),
            //   ],
            // ),

            // Button to save and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // cancel button
                MyButton(buttonName: "Cancel", onPressed: widget.onCancel),
                const SizedBox(width: 10),
                // save button
                MyButton(buttonName: "Save", onPressed: widget.onSave)
              ],
            )
          ],
        ),
      ),
    );
  }
}
