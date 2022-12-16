import 'package:flutter/material.dart';
import 'package:meeting_organizer/constants/colors.dart';

class CheckBoxTile extends StatefulWidget {
  const CheckBoxTile({Key? key}) : super(key: key);

  @override
  State<CheckBoxTile> createState() => _CheckBoxTileState();
}

class _CheckBoxTileState extends State<CheckBoxTile> {
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
