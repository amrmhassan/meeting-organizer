import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meeting_organizer/constants/colors.dart';
import 'package:meeting_organizer/models/meeting_model.dart';
import 'package:meeting_organizer/models/meeting_time_model.dart';
import 'package:meeting_organizer/models/user_model.dart';
import 'package:meeting_organizer/providers/meeting_provider.dart';
import 'package:provider/provider.dart';

class VotesScreen extends StatefulWidget {
  final MeetingModel meetingModel;
  const VotesScreen({
    super.key,
    required this.meetingModel,
  });

  @override
  State<VotesScreen> createState() => _VotestState();
}

class _VotestState extends State<VotesScreen> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MeetingsProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Center(
            child: Text(
              'Reading clean code book',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Text(
                  'Vote for the meeting time ',
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => listitem(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 5.0,
                ),
                itemCount: 5,
              ),
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
            )
          ],
        ));
  }

  Widget listitem() => SizedBox(
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white30,
                ),
                child: CheckboxListTile(
                  title: const Text('Tomorrow  12:00'),
                  secondary: const Icon(Icons.access_time),
                  autofocus: false,
                  activeColor: kPrimaryColor,
                  checkColor: Colors.white,
                  selected: _value,
                  value: _value,
                  onChanged: (value) => setState(() {
                    _value = value!;
                  }),
                ),
              ),
            ),
          ),
        ),
      );
}
