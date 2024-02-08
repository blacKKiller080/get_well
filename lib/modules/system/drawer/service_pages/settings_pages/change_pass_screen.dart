import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../../../core/components/common_button.dart';
import '../../../../../core/components/common_input.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/helper/input_helper.dart';
import '../../../../../core/helper/navigateable.dart';
import '../../../../../core/routes/routes.dart';

class ChangePasswordScreen extends StatefulWidget implements Navigateable {
  @override
  String getName() {
    return Routes.change_pass;
  }

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var newRepeatedPasswordController = TextEditingController();

  MaskTextInputFormatter formatter = InputHelper.maskTextInputFormatter();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.k_border_secondary_color,
      appBar: AppBar(
        title: Text('Смена пароля'),
        titleTextStyle: TextStyle(
            color: Styles.k_black_color,
            fontSize: 20,
            fontWeight: FontWeight.w700),
        centerTitle: true,
        backgroundColor: Styles.k_white_color,
        toolbarHeight: height * 7.1,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left_outlined, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Styles.k_border_primary_color,
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(23),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: width * 4.1, vertical: height * 1.9),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonInput(
                    "Старый пароль",
                    margin: EdgeInsets.only(bottom: height * 1.9),
                    type: InputType.PASSWORD,
                    customColor: Styles.k_tertiary_disabled,
                    fillColor: Styles.k_white_color,
                    controller: oldPasswordController,
                    onChanged: (val) => setState(() {}),
                    onSubmitted: (val) {
                      FocusScope.of(context).unfocus();
                    },
                    borderRadius: 16,
                  ),
                  CommonInput(
                    "Новый пароль",
                    margin: EdgeInsets.only(bottom: height * 1.9),
                    type: InputType.PASSWORD,
                    customColor: Styles.k_tertiary_disabled,
                    fillColor: Styles.k_white_color,
                    controller: newPasswordController,
                    borderRadius: 16,
                    onChanged: (val) => setState(() {}),
                    onSubmitted: (val) {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  CommonInput(
                    "Подтвердите новый пароль",
                    margin: EdgeInsets.only(bottom: height * 1.9),
                    type: InputType.PASSWORD,
                    customColor: Styles.k_tertiary_disabled,
                    fillColor: Styles.k_white_color,
                    controller: newRepeatedPasswordController,
                    borderRadius: 16,
                    onChanged: (val) => setState(() {}),
                    onSubmitted: (val) {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  CommonButton(
                    disabled: !isPasswordValid(),
                    child: Text('Сохранить'),
                    onPressed: () {
                      if (oldPasswordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Введите старый пароль")));
                        return;
                      }
                      if (newPasswordController.text !=
                              newRepeatedPasswordController.text ||
                          newRepeatedPasswordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Ваши пароли не совпадают")));
                        return;
                      }
                    },
                    margin: EdgeInsets.only(bottom: height * 1.9),
                    success: true,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Забыли пароль?',
                      style: TextStyle(
                        color: Styles.k_black_color,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isPasswordValid() {
    return !(oldPasswordController.text.isEmpty ||
        newPasswordController.text != newRepeatedPasswordController.text ||
        newRepeatedPasswordController.text.isEmpty);
  }

  @override
  void dispose() {
    super.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    newRepeatedPasswordController.dispose();
  }
}
