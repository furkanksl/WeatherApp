import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Styles {
  TextStyle weatherDetailTextStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );

  TextStyle weatherConditionTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 15.sp,
  );

  TextStyle weatherDegreeTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 45.sp,
  );

  TextStyle weatherDayOfWeekTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 18.sp,
  );

  BoxDecoration weatherListItemContainerDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    // color: const Color(0x8828BDE6),
    gradient: LinearGradient(
      colors: [
        Colors.white.withOpacity(1),
        const Color(0x83045CA4).withOpacity(0.9),
      ],
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomEnd,
    ),
    border: Border.all(
      width: 2,
      color: const Color(0xFF124D7D).withOpacity(0.04),
    ),
  );
}
