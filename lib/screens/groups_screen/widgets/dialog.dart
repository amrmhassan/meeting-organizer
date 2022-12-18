import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
// reusable components for dialog widget
// create new meeting
Future DefaultDialog ({
  required BuildContext context,
  WidgetBuilder? builder,
})=>showDialog(
    context:context,
    builder: (builder){
      return Expanded(
        child: AlertDialog(
          title: Text('NEW GROUB'),
          content: Text('create a groub'),
          actions: [
            MaterialButton(onPressed: (){},
              child:  Text(
                'Create',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            MaterialButton(onPressed: ()
            {
              Navigator.pop(context);
            },
              child:  Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    }
);