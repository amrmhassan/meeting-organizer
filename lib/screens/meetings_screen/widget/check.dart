import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultcheck({
  bool istrue = true,
}) =>
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          // color: Colors.green,
          color: istrue ? Colors.green : Colors.red),
      child: Icon(
        istrue ? Icons.check : Icons.close,
        color: Colors.white,
      ),
    );
