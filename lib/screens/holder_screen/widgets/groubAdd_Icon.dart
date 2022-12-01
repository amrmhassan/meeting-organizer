import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../groups_screen/widgets/dialog.dart';

Widget defaultIcon_buttom(
  {
    int initIndex =0,
    required BuildContext context,
    WidgetBuilder? builder,
  }
  )=>
    initIndex == 0
    ? IconButton(
    onPressed: ()=>defaultdialog(context: context, builder:builder),
    icon: Icon(
       Icons.add,
      size: 35,
     ),
   )
        :Container();