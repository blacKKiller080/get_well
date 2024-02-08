import 'package:flutter/material.dart';
import 'package:get_well/core/helper/navigateable.dart';
import 'package:get_well/core/models/registration_data.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../core/components/common_button.dart';
import '../../../core/components/common_input.dart';
import '../../../core/constants/styles.dart';
import '../../../core/helper/input_helper.dart';
import '../../../core/helper/modal_helper.dart';
import '../../../core/routes/routes.dart';

class RegistrationScreen extends StatefulWidget implements Navigateable {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();

  @override
  String getName() {
    return Routes.registration;
  }
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with ModalHelper {
  final _formKey = GlobalKey<FormState>();

  var loginTextController = TextEditingController();
  var passwordController = TextEditingController();
  var repeatPasswordController = TextEditingController();
  MaskTextInputFormatter formatter = InputHelper.maskTextInputFormatter();
  bool isSelectedIcon = false;
  bool onLoginPage = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      backgroundColor: Styles.k_main_color,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Container(
                  //   margin: const EdgeInsets.only(
                  //     top: 220,
                  //   ),
                  //   child: Transform.scale(
                  //     transformHitTests: false,
                  //     scale: 1.5,
                  //     child: CupertinoSwitch(
                  //       activeColor: Styles.k_swith_passive_color,
                  //       thumbColor: Styles.k_white_color,
                  //       trackColor: Styles.k_swith_passive_color,
                  //       dragStartBehavior: DragStartBehavior.down,
                  //       value: onLoginPage,
                  //       onChanged: ((value) {
                  //         setState(() {
                  //           onLoginPage = value;
                  //         });
                  //       }),
                  //     ),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: height * 26.06, bottom: height * 4.74),
                      child: Image.asset(
                        'assets/image/png/logo_white.png',
                      ),
                    ),
                  ),
                  CommonInput(
                    "Логин",
                    margin: EdgeInsets.only(
                      bottom: height * 1.89,
                      left: width * 6.41,
                      right: width * 6.41,
                    ),
                    type: InputType.TEXT,
                    fontWeight: FontWeight.w600,
                    controller: loginTextController,
                    textColor: Styles.k_white_color,
                    validator: true,
                    onChanged: (val) {},
                    textInputAction: TextInputAction.next,
                  ),
                  CommonInput(
                    "Пароль",
                    margin: EdgeInsets.only(
                      bottom: height * 1.89,
                      left: width * 6.41,
                      right: width * 6.41,
                    ),
                    type: InputType.PASSWORD,
                    controller: passwordController,
                    textColor: Styles.k_white_color,
                    oscuredIconColor: Styles.k_white_color,
                    validator: true,
                    textInputAction: TextInputAction.next,
                  ),
                  CommonInput(
                    "Повторите пароль",
                    margin: EdgeInsets.only(
                      bottom: height * 1.89,
                      left: width * 6.41,
                      right: width * 6.41,
                    ),
                    type: InputType.PASSWORD,
                    controller: repeatPasswordController,
                    textColor: Styles.k_white_color,
                    oscuredIconColor: Styles.k_white_color,
                    validator: true,
                    textInputAction: TextInputAction.done,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: height * 1,
                      right: width * 6.41,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Запомнить?',
                          style: TextStyle(
                              color: Styles.k_white_color,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          isSelected: isSelectedIcon,
                          onPressed: () {
                            setState(
                              () {
                                isSelectedIcon = !isSelectedIcon;
                              },
                            );
                          },
                          icon: !isSelectedIcon
                              ? Icon(
                                  Icons.check_box_outline_blank,
                                  color: Styles.k_white_color,
                                )
                              : Icon(
                                  Icons.check_box_outlined,
                                  color: Styles.k_white_color,
                                ),
                        ),
                      ],
                    ),
                  ),
                  CommonButton(
                    child: Text('Продолжить регистрацию'),
                    //onPressed: () async => await registerFrist(),

                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (loginTextController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Введиту логин")));
                        } else if (passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Введите пароль")));
                        } else if (passwordController.text !=
                            repeatPasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Пароль не совпадает")));
                        } else {
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.registration_second,
                            arguments: RegisterData(
                              nickname: loginTextController.text,
                              password: passwordController.text,
                              city: '',
                              birthDate: '',
                              //image: XFile(''),
                              email: '',
                              firstName: '',
                              lastName: '',
                              phone: '',
                              height: '',
                              weight: '',
                              gender: '',
                              badHabits: [],
                              lifeStyles: [],
                              officeWorker: false,
                              physicalWorker: false,
                            ),
                          );
                        }
                      }
                    },

                    margin: EdgeInsets.only(
                      bottom: height * 13.27,
                      left: width * 6.41,
                      right: width * 6.41,
                    ),
                    backgroundColor: Styles.k_white_color,
                    foregroundColor: Styles.k_main_color,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CommonButton(
                          child: Text(
                            'Вход',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          backgroundColor: Styles.k_white_color,
                          foregroundColor: Styles.k_main_color,
                          leftScreenButton: true,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          margin: EdgeInsets.only(right: width * 8.97),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: width * 10.25),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/image/png/google_icon.png',
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/image/png/facebook_icon.png',
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/image/png/twitter_icon.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          margin: EdgeInsets.only(bottom: 50),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    loginTextController.dispose();
    passwordController.dispose();
  }
}
