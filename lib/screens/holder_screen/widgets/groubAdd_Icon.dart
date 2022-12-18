import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../groups_screen/widgets/dialog.dart';
  // groups app bar action button
Widget GroupsActionIcon(
  {
    int initIndex =0,
    required BuildContext context,
    WidgetBuilder? builder,
  }
  )=>
    initIndex == 0
    ? IconButton(
    onPressed: ()=>DefaultDialog(context: context, builder:builder),
    icon: Icon(
       Icons.add,
      size: 35,
     ),
   )
        :Container();