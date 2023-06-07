
import 'package:flutter/material.dart';
import '/src/utils/constants/color_constants.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    required this.title,
    this.color,
    this.fontSize,
    this.height,
    this.fontWeight,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.fontFamily,
    this.textDecoration,
    Key? key,
  }) : super(key: key);
  final String title;
  final Color? color;
  final double? fontSize;
  final double? height;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final String? fontFamily;
  final int? maxLines;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
      overflow: textOverflow ?? TextOverflow.visible,
      style: TextStyle(
        decoration: textDecoration,
        fontFamily: fontFamily,
        color: color ?? AppColors. kPrimaryColor,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: fontSize ?? 32,
        height: height,
      ),
    );
  }
}