// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class GroupScreen extends StatefulWidget {
  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

bool _value = false;

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              color: Colors.white,
              Icons.arrow_back_ios,
            )),
        title: Text(
          'Group meeting',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Text(
                'Vote for the meeting time',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => _checkBoxTile(),
                separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                itemCount: 20),
          ),
          SizedBox(
            height: 5.0,
          ),
          Center(
            child: Container(
              height: 100,
              width: double.infinity,
              child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        size: 22,
                        color: Color.fromARGB(255, 176, 177, 175),
                      ),
                      Text(
                        'Add another time',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 176, 177, 175),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class _checkBoxTile extends StatefulWidget {
  const _checkBoxTile({Key? key}) : super(key: key);

  @override
  State<_checkBoxTile> createState() => _checkBoxTileState();
}

class _checkBoxTileState extends State<_checkBoxTile> {
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
