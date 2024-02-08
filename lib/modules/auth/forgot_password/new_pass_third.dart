import 'package:flutter/material.dart';
import 'package:get_well/core/helper/navigateable.dart';
import '../../../core/components/common_button.dart';
import '../../../core/components/common_input.dart';
import '../../../core/constants/styles.dart';
import '../../../core/routes/routes.dart';

class NewPasswordThird extends StatefulWidget implements Navigateable {
  const NewPasswordThird({super.key});

  @override
  State<NewPasswordThird> createState() => _NewPasswordThirdState();

  @override
  String getName() {
    return Routes.new_pass_third;
  }
}

class _NewPasswordThirdState extends State<NewPasswordThird> {
  var newPasswordController = TextEditingController();
  var newRepeatedPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.k_white_color,
        foregroundColor: Styles.k_black_color,
        toolbarHeight: height * 7.1,
        elevation: 0.0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Styles.k_border_primary_color,
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(23),
          ),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: height * 13.5, bottom: height * 4.74),
              child: Image.asset(
                'assets/image/png/logo_mini.png',
              ),
            ),
            Text(
              'Придумайте новый пароль',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            CommonInput(
              "Введите новый пароль",
              margin: EdgeInsets.symmetric(vertical: height * 1.9),
              type: InputType.PASSWORD,
              customColor: Styles.k_tertiary_disabled,
              borderColor: Styles.k_tertiary_disabled,
              controller: newPasswordController,
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
              borderColor: Styles.k_tertiary_disabled,
              controller: newRepeatedPasswordController,
              onChanged: (val) => setState(() {}),
              onSubmitted: (val) {
                FocusScope.of(context).unfocus();
              },
            ),
            CommonButton(
              child: Text('Сохранить'),
              onPressed: () {
                // if (newPasswordController.text !=
                //         newRepeatedPasswordController.text ||
                //     newRepeatedPasswordController.text.isEmpty) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text("Ваши пароли не совпадают")));
                //   return;
                // }
                Navigator.pushNamed(context, Routes.login);
              },
              margin: EdgeInsets.only(bottom: height * 1.9),
            ),
          ],
        ),
        margin: EdgeInsets.only(
          left: width * 6.41,
          right: width * 6.41,
          top: 10,
          bottom: 0,
        ),
      ),
    );
  }
}
