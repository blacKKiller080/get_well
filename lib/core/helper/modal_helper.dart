import 'package:flutter/material.dart';
import '../constants/styles.dart';

mixin ModalHelper {
  void success(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Styles.k_main_color,
    ));
  }

  void error(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Styles.k_error_color,
    ));
  }

  void info(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Styles.k_white_color,
    ));
  }
}
