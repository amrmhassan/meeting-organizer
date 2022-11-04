// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meeting_organizer/screens/meetings_screen/widget/upcomingItems.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({super.key});

  @override
  Widget build(BuildContext context) {
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
