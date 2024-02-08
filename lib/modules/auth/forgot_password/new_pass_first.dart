import 'package:flutter/material.dart';
import 'package:get_well/core/helper/navigateable.dart';
import '../../../core/components/common_button.dart';
import '../../../core/components/common_input.dart';
import '../../../core/constants/styles.dart';
import '../../../core/routes/routes.dart';

class NewPasswordFirst extends StatefulWidget implements Navigateable {
  const NewPasswordFirst({super.key});

  @override
  State<NewPasswordFirst> createState() => _NewPasswordFirstState();

  @override
  String getName() {
    return Routes.new_pass_first;
  }
}

class _NewPasswordFirstState extends State<NewPasswordFirst> {
  var emailTextController = TextEditingController();

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
              "Почта",
              margin: EdgeInsets.only(bottom: height * 1.9, top: height * 1.9),
              type: InputType.EMAIL,
              controller: emailTextController,
              customColor: Styles.k_tertiary_disabled,
              borderColor: Styles.k_tertiary_disabled,
            ),
            CommonButton(
              child: Text('Отправить код'),
              onPressed: () {
                Navigator.pushNamed(context, Routes.new_pass_second);
              },
              margin: EdgeInsets.only(bottom: height * 1.9),
            ),
            Text(
              'На указанную вами почту придет сообщение с кодом для востановления',
              style: TextStyle(
                color: Styles.k_black_color,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        margin: EdgeInsets.only(
            left: width * 6.41, right: width * 6.41, top: 10, bottom: 0),
      ),
    );
  }
}
