import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget createDrawerBodyItem({
  required IconData icon,
  required String text,
  required Color iconColor,
  required Color fontColor,
  required GestureTapCallback onTap,
}) {
  return ListTile(
    // contentPadding: EdgeInsets.zero,
    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
    title: Row(
      children: <Widget>[
        Icon(
          icon,
          color: iconColor,
          size: 17.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: fontColor,
            ),
          ),
        )
      ],
    ),
    onTap: onTap,
  );
}
