import 'package:flutter/material.dart';

class TitleHeading1Widget extends StatelessWidget {
  const TitleHeading1Widget({
    super.key,
    required this.text,
    this.textAlign,
    this.textOverflow,
    this.padding = paddingValue,
    this.opacity = 1.0,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.softWrap,
    this.fontFamily,
    this.letterSpacing,
    this.textDecoration,
    this.height,
  });

  final String text;
  final String? fontFamily;
  final double? letterSpacing;

  final TextAlign? textAlign;
  final double? height;

  final TextDecoration? textDecoration;
  final TextOverflow? textOverflow;
  final EdgeInsetsGeometry padding;
  final double opacity;
  final int? maxLines;
  final bool? softWrap;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  static const paddingValue = EdgeInsets.all(0.0);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Padding(
        padding: padding,
        child: Text(
          
          softWrap: softWrap,
          text,
          style: TextStyle(
            decoration: textDecoration,
            letterSpacing: letterSpacing,
            color: color ?? Colors.black,
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontFamily: fontFamily ?? 'Helvetica',
          ),
          textAlign: textAlign ?? TextAlign.start,
          overflow: textOverflow,
          maxLines: maxLines,
        ),
      ),
    );
  }
}
