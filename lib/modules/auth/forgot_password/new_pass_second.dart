import 'package:flutter/material.dart';
import 'package:get_well/core/helper/navigateable.dart';
import '../../../core/components/common_button.dart';
import '../../../core/components/common_input.dart';
import '../../../core/constants/styles.dart';
import '../../../core/routes/routes.dart';

class NewPasswordSecond extends StatefulWidget implements Navigateable {
  const NewPasswordSecond({super.key});

  @override
  State<NewPasswordSecond> createState() => _NewPasswordSecondState();

  @override
  String getName() {
    return Routes.new_pass_second;
  }
}

class _NewPasswordSecondState extends State<NewPasswordSecond> {
  var codeTextController = TextEditingController();

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
              'Востановление пароля',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            CommonInput(
              "Код",
              margin: EdgeInsets.only(bottom: height * 1.9, top: height * 1.9),
              type: InputType.NUMBER,
              fontWeight: FontWeight.w600,
              controller: codeTextController,
              customColor: Styles.k_tertiary_disabled,
              borderColor: Styles.k_tertiary_disabled,
            ),
            CommonButton(
              child: Text('Подтвердить'),
              onPressed: () {
                Navigator.pushNamed(context, Routes.new_pass_third);
              },
              margin: EdgeInsets.only(bottom: height * 1.9),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Отправить еще раз.',
                  style: TextStyle(
                    color: Styles.k_black_color,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Отправить еще раз.',
                    style: TextStyle(
                      color: Styles.k_black_color,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
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
