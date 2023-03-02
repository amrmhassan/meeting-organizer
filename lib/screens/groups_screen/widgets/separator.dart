import 'package:flutter/material.dart';

class ItemSeparator extends StatelessWidget {
  const ItemSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 40),
      child:Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[500],
      ),
    );
  }
}

