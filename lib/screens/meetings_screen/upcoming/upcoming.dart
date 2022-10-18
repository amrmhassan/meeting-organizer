import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting_organizer/screens/home_screen/widgets/meeting_item.dart';
import 'package:meeting_organizer/screens/meetings_screen/upcoming/widgets/upcomingItems.dart';

class upcoming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => upcoming_item(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 16.0,
                ),
                itemCount: 10,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
