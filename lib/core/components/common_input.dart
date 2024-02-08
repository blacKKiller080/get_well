import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/styles.dart';

class CommonInput extends StatefulWidget {
  final String text;
  final InputType type;
  final bool isLabelTextOn;
  final TextEditingController? controller;
  final List<TextInputFormatter>? formatters;
  final void Function(String value)? onChanged;
  final int? maxLines;
  final bool editable;
  final bool isSearchPrefix;
  final bool isSearchSuffix;
  final String? initialValue;
  final Color customColor;
  final Color fillColor;
  final Color borderColor;
  final Color textColor;
  final Color oscuredIconColor;
  final void Function(String value)? onSubmitted;
  final EdgeInsets? margin;
  double contentPaddingVertical;
  double contentPaddingHorizontal;
  double borderRadius;
  FontWeight fontWeight;
  bool isCenterTitle;
  bool validator;
  TextInputAction? textInputAction;

  CommonInput(
    this.text, {
    this.type = InputType.TEXT,
    this.controller,
    this.isLabelTextOn = false,
    this.validator = false,
    this.formatters,
    this.onChanged,
    this.maxLines,
    this.initialValue,
    this.editable = true,
    this.customColor = Colors.white,
    this.fillColor = Colors.transparent,
    this.borderColor = Colors.white,
    this.textColor = Styles.k_black_color,
    this.onSubmitted,
    this.margin,
    this.isSearchPrefix = false,
    this.isSearchSuffix = false,
    this.contentPaddingVertical = 1.42,
    this.contentPaddingHorizontal = 5.128,
    this.borderRadius = 29,
    this.fontWeight = FontWeight.w600,
    this.isCenterTitle = false,
    this.oscuredIconColor = Styles.k_main_color,
    this.textInputAction,
  });

  @override
  _CommonInputState createState() => _CommonInputState();
}

class _CommonInputState extends State<CommonInput> {
  bool _isTextNotObscured = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.isLabelTextOn
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    this.widget.text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: widget.fontWeight,
                      color: widget.customColor == null
                          ? Styles.k_white_color
                          : widget.customColor,
                    ),
                  ),
                )
              : Container(),
          TextFormField(
            onFieldSubmitted: widget.onSubmitted,
            onChanged: widget.onChanged,
            validator: widget.validator ? _textValidator : null,
            controller: widget.controller,
            style: TextStyle(
                fontSize: 16,
                fontWeight: widget.fontWeight,
                color: widget.textColor),
            textAlign:
                widget.isCenterTitle ? TextAlign.center : TextAlign.start,
            maxLines: widget.maxLines != null ? widget.maxLines : 1,
            inputFormatters: _getInputFormatters(),
            keyboardType: _getKeyBoardType(this.widget.type),
            obscuringCharacter: "*",
            obscureText: isPasswordInput() && !_isTextNotObscured,
            initialValue: widget.initialValue,
            enabled: widget.editable,
            textInputAction: widget.textInputAction,
            decoration: InputDecoration(
              fillColor: widget.fillColor,
              filled: true,
              suffixIconConstraints: BoxConstraints(),
              suffixIcon: !widget.isSearchSuffix
                  ? isPasswordInput()
                      ? Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height /
                                100 *
                                widget.contentPaddingVertical,
                            right:
                                MediaQuery.of(context).size.width / 100 * 7.69,
                            bottom: MediaQuery.of(context).size.height /
                                100 *
                                widget.contentPaddingVertical,
                          ), // add padding to adjust icon
                          child: GestureDetector(
                            onTap: () {
                              _isTextNotObscured = !_isTextNotObscured;
                              setState(() {});
                            },
                            child: Icon(
                              _isTextNotObscured
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              color: _isTextNotObscured
                                  ? widget.customColor
                                  : widget.oscuredIconColor,
                              // size: MediaQuery.of(context).size.width /
                              //     100 *
                              //     5.128,
                            ),
                          ),
                        )
                      : null
                  : Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(
                        Icons.search,
                      ),
                    ),
              prefixIcon: widget.isSearchPrefix
                  ? Padding(
                      padding:
                          EdgeInsets.only(top: 0), // add padding to adjust icon
                      child: Icon(Icons.search),
                    )
                  : null,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height /
                      100 *
                      widget.contentPaddingVertical,
                  horizontal: MediaQuery.of(context).size.width /
                      100 *
                      widget.contentPaddingHorizontal),
              hintText: this.widget.text,
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: widget.fontWeight,
                color: widget.customColor,
              ),
              alignLabelWithHint: false,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor != null
                      ? widget.borderColor
                      : widget.customColor,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                gapPadding: 0,
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
              ),
              errorStyle: TextStyle(height: 0),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                gapPadding: 0,
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor != null
                      ? widget.borderColor
                      : widget.customColor,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? _textValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return '';
    }
    return null;
  }

  List<TextInputFormatter> _getInputFormatters() {
    return widget.formatters ?? [];
  }

  bool isPasswordInput() {
    return widget.type == InputType.PASSWORD;
  }

  TextInputType _getKeyBoardType(InputType type) {
    TextInputType textType;

    switch (type) {
      case InputType.EMAIL:
        textType = TextInputType.emailAddress;
        break;
      case InputType.NUMBER:
        textType = TextInputType.number;
        break;
      case InputType.NUMBER_WITH_OPTIONS:
        textType = TextInputType.numberWithOptions(decimal: true, signed: true);
        break;
      case InputType.PHONE:
        textType = TextInputType.number;
        break;
      default:
        textType = TextInputType.text;
    }

    return textType;
  }
}

enum InputType {
  TEXT,
  PASSWORD,
  EMAIL,
  NUMBER,
  NUMBER_WITH_OPTIONS,
  PHONE,
  TIME
}
