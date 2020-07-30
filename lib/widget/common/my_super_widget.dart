import 'package:flutter/material.dart';

class MySuperWidget extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  final Color bgColor;
  final Color borderColor;
  final double borderWidth;
  final bool hasBorder;
  final double radius;

  final GestureTapCallback onTap;
  final GestureTapCallback onLongPress;
  final GestureTapCallback onDoubleTap;

  final AlignmentGeometry alignment;

  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;

  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  const MySuperWidget(
      {Key key,
      this.width,
      this.height,
      this.bgColor: Colors.transparent,
      this.borderColor: Colors.transparent,
      this.borderWidth:0.5,
      this.hasBorder: false,
      this.radius: 0,
      this.onTap,
      this.onLongPress,
      this.onDoubleTap,
      this.alignment: Alignment.center,
      this.text: "",
      this.fontSize: 14,
      this.margin: const EdgeInsets.all(0),
      this.padding: const EdgeInsets.all(0),
      this.textColor: const Color(0xFF474245),
      this.fontWeight: FontWeight.normal,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      highlightColor: Colors.transparent,
      radius: 0.0,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        child: text.isNotEmpty
            ? Text(text,
                style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: textColor))
            : child,
        alignment: alignment,
        decoration: BoxDecoration(
          color: bgColor,
          border: hasBorder
              ? Border.all(color: borderColor, width: borderWidth)
              : null, // 边色与边宽度
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
      ),
    );
  }
}
