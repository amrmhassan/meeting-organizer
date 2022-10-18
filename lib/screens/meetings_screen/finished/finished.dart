// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meeting_organizer/screens/meetings_screen/finished/widget/finished_item.dart';

class Finished extends StatelessWidget {
  const Finished({super.key});

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
                itemBuilder: (context, index) => finishing_items(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 15.0,
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
    ;
  }
}
