// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WeatherConditionImageWidget extends StatelessWidget {
  String? imageUrl;

  WeatherConditionImageWidget({required this.imageUrl, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? 90.w
          : 65.w,
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? 90.w
          : 70.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0x532E6DA1).withOpacity(0.2),
            const Color(0x83045CA4).withOpacity(0.9),
          ],
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(
          width: 15,
          color: const Color(0xFF124D7D).withOpacity(0.04),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 3),
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: Image.network(
              imageUrl!,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
