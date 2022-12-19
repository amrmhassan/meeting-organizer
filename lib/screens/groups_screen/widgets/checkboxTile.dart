import 'package:flutter/material.dart';
import 'package:meeting_organizer/constants/colors.dart';
// checkBix widget class
//display meeting time and check for the the the selected meeting
class checkBoxTile extends StatefulWidget {
  const checkBoxTile({Key? key}) : super(key: key);
  @override
  State<checkBoxTile> createState() => checkBoxTileState();
}
class checkBoxTileState extends State<checkBoxTile> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CheckboxListTile(
        title: const Text('Tomorrow  12:00'),
        activeColor: kPrimaryColor,
        value: _value,
        selected: _value,
        onChanged: (value) {
          setState(() {
            _value = value!;
          });
        },
        secondary: const Icon(Icons.access_time),
      ),
    );
  }
}
