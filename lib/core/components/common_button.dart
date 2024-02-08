// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../constants/styles.dart';

class CommonButton extends StatelessWidget {
  Widget child;
  Function? onPressed;
  Widget? icon;

  EdgeInsets? margin;
  final Color backgroundColor;
  final Color foregroundColor;
  bool success;
  bool disabled;
  bool borderColor;
  bool leftScreenButton;
  bool rightScreenButton;
  double contentPaddingVertical;
  double fontSize;
  bool hasIconMiniButton;
  bool hasDownIcon;
  double? radius;
  bool bigText;
  double contentPaddingHorizontal;

  CommonButton({
    required this.child,
    this.onPressed,
    this.radius,
    this.success = false,
    this.disabled = false,
    this.borderColor = false,
    this.rightScreenButton = false,
    this.leftScreenButton = false,
    this.backgroundColor = Styles.k_main_color,
    this.foregroundColor = Styles.k_white_color,
    this.margin,
    this.contentPaddingVertical = 1.42,
    this.fontSize = 16,
    this.hasIconMiniButton = false,
    this.hasDownIcon = false,
    this.icon,
    this.contentPaddingHorizontal = 0,
    this.bigText = true,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    return Container(
      margin: margin,
      child: TextButton(
        onPressed: () {
          if (!disabled) {
            this.onPressed?.call();
          } else if (success) {
            success = true;
            this.onPressed?.call();
          }
        },
        child: !hasIconMiniButton
            ? hasDownIcon
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 5),
                        child: child,
                      ),
                      SizedBox(child: icon),
                    ],
                  )
                : Container(
                    child: Center(child: child),
                    width: double.infinity,
                  )
            : Container(
                padding: EdgeInsets.only(left: width * 7.7, right: width * 7.7),
                // constraints: const BoxConstraints(),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: <Widget>[
                      child,
                      SizedBox(width: width * 1),
                      SizedBox(child: icon),
                    ],
                  ),
                ),
              ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(getBackgroundColor()),
          foregroundColor: MaterialStateProperty.all(getForegroundColor()),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: borderColor
                  ? BorderSide(color: foregroundColor)
                  : BorderSide(width: 0, color: backgroundColor),
              borderRadius: radius == null
                  ? BorderRadius.only(
                      topLeft: leftScreenButton
                          ? Radius.circular(0)
                          : Radius.circular(29),
                      bottomLeft: leftScreenButton
                          ? Radius.circular(.0)
                          : Radius.circular(29),
                      topRight: rightScreenButton
                          ? Radius.circular(0.0)
                          : Radius.circular(29),
                      bottomRight: rightScreenButton
                          ? Radius.circular(0)
                          : Radius.circular(29),
                    )
                  : BorderRadius.all(
                      Radius.circular(radius!),
                    ),
            ),
          ),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontFamily: 'Gilroy',
              fontSize: bigText ? fontSize : 14,
              fontWeight: bigText ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.only(
              top: MediaQuery.of(context).size.height /
                  100 *
                  contentPaddingVertical,
              bottom: MediaQuery.of(context).size.height /
                  100 *
                  contentPaddingVertical,
              right: MediaQuery.of(context).size.width /
                  100 *
                  contentPaddingHorizontal,
              left: MediaQuery.of(context).size.width /
                  100 *
                  contentPaddingHorizontal,
            ),
          ),
        ),
      ),
    );
  }

  Color getBackgroundColor() {
    Color color;
    if (disabled) {
      color = Styles.k_main_color;
    } else if (success) {
      color = Styles.k_main_color;
    } else {
      color = backgroundColor;
    }
    return color;
  }

  Color getForegroundColor() {
    Color color;
    if (disabled) {
      color = Styles.k_white_color;
    } else if (success) {
      color = Styles.k_white_color;
    } else {
      color = foregroundColor;
    }
    return color;
  }
}
