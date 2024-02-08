// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_well/core/components/calendar_container.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../../core/components/common_button.dart';
import '../../../../../core/components/common_input.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/helper/input_helper.dart';

class PressureScreen extends StatefulWidget {
  const PressureScreen({super.key});

  @override
  State<PressureScreen> createState() => _PressureScreenState();
}

class _PressureScreenState extends State<PressureScreen> {
  MaskTextInputFormatter formatter = InputHelper.maksPressureInputFormatter();
  bool isYes = false;
  bool isNo = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            CalendarContainer(),
            isNo
                ? Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            "Чувствовали недомогание сегодня?",
                            style: TextStyle(
                              color: Styles.k_black_color,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 5,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(
                                child: CommonButton(
                                  child: Text('Да'),
                                  fontSize: 20,
                                  onPressed: () {
                                    setState(() {
                                      isYes = true;
                                      isNo = false;
                                    });
                                  },
                                  margin: EdgeInsets.only(right: 5),
                                  backgroundColor: Styles.k_main_color,
                                  foregroundColor: Styles.k_white_color,
                                  contentPaddingVertical: 8,
                                ),
                              ),
                              Expanded(
                                child: CommonButton(
                                  child: Text('Нет'),
                                  fontSize: 20,
                                  onPressed: () {
                                    setState(() {
                                      isYes = false;
                                      isNo = true;
                                    });
                                  },
                                  margin: EdgeInsets.only(left: 5),
                                  backgroundColor: Styles.k_main_color,
                                  foregroundColor: Styles.k_white_color,
                                  contentPaddingVertical: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(top: 16, bottom: 16),
                    padding: EdgeInsets.all(17),
                    decoration: BoxDecoration(
                      color: Styles.k_white_color,
                      borderRadius: BorderRadius.all(
                        Radius.circular(22),
                      ),
                    ),
                  )
                : SizedBox.shrink(),

            //Опросник измерения давления
            //Измерение утром
            isYes
                ? Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Измерение утром",
                          style: TextStyle(
                            color: Styles.k_black_color,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Text(
                                    "Левая рука",
                                    style: TextStyle(
                                      color: Styles.k_black_color,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  CommonInput(
                                    "Значение",
                                    margin: EdgeInsets.only(top: 8, bottom: 12),
                                    fontWeight: FontWeight.w600,
                                    customColor: Styles.k_tertiary_disabled,
                                    borderColor: Styles.k_tertiary_disabled,
                                    isCenterTitle: true,
                                    formatters: [formatter],
                                    textColor: Styles.k_main_color,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Text(
                                    "Правая рука",
                                    style: TextStyle(
                                      color: Styles.k_black_color,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  CommonInput(
                                    "Значение",
                                    margin: EdgeInsets.only(top: 8, bottom: 12),
                                    fontWeight: FontWeight.w600,
                                    customColor: Styles.k_tertiary_disabled,
                                    borderColor: Styles.k_tertiary_disabled,
                                    isCenterTitle: true,
                                    formatters: [formatter],
                                    textColor: Styles.k_main_color,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Text(
                                    "Пульс",
                                    style: TextStyle(
                                      color: Styles.k_black_color,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  CommonInput(
                                    "Значение",
                                    margin: EdgeInsets.only(top: 8, bottom: 12),
                                    fontWeight: FontWeight.w600,
                                    customColor: Styles.k_tertiary_disabled,
                                    borderColor: Styles.k_tertiary_disabled,
                                    isCenterTitle: true,
                                    formatters: [formatter],
                                    textColor: Styles.k_main_color,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Жалобы",
                              style: TextStyle(
                                color: Styles.k_black_color,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            CommonInput(
                              "Опишите",
                              margin: EdgeInsets.only(top: 8, bottom: 12),
                              fontWeight: FontWeight.w600,
                              customColor: Styles.k_tertiary_disabled,
                              borderColor: Styles.k_tertiary_disabled,
                              isCenterTitle: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(bottom: 16, top: 16),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      color: Styles.k_white_color,
                      borderRadius: BorderRadius.all(
                        Radius.circular(22),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            //Измерение вечером
            isYes
                ? Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Измерение вечером",
                          style: TextStyle(
                            color: Styles.k_black_color,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Text(
                                    "Левая рука",
                                    style: TextStyle(
                                      color: Styles.k_black_color,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  CommonInput(
                                    "Значение",
                                    margin: EdgeInsets.only(top: 8, bottom: 12),
                                    fontWeight: FontWeight.w600,
                                    customColor: Styles.k_tertiary_disabled,
                                    borderColor: Styles.k_tertiary_disabled,
                                    isCenterTitle: true,
                                    formatters: [formatter],
                                    textColor: Styles.k_main_color,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Text(
                                    "Правая рука",
                                    style: TextStyle(
                                      color: Styles.k_black_color,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  CommonInput(
                                    "Значение",
                                    margin: EdgeInsets.only(top: 8, bottom: 12),
                                    fontWeight: FontWeight.w600,
                                    customColor: Styles.k_tertiary_disabled,
                                    borderColor: Styles.k_tertiary_disabled,
                                    isCenterTitle: true,
                                    formatters: [formatter],
                                    textColor: Styles.k_main_color,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Text(
                                    "Пульс",
                                    style: TextStyle(
                                      color: Styles.k_black_color,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  CommonInput(
                                    "Значение",
                                    margin: EdgeInsets.only(top: 8, bottom: 12),
                                    fontWeight: FontWeight.w600,
                                    customColor: Styles.k_tertiary_disabled,
                                    borderColor: Styles.k_tertiary_disabled,
                                    isCenterTitle: true,
                                    formatters: [formatter],
                                    textColor: Styles.k_main_color,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Жалобы",
                              style: TextStyle(
                                color: Styles.k_black_color,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            CommonInput(
                              "Опишите",
                              margin: EdgeInsets.only(top: 8, bottom: 12),
                              fontWeight: FontWeight.w600,
                              customColor: Styles.k_tertiary_disabled,
                              borderColor: Styles.k_tertiary_disabled,
                              isCenterTitle: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      color: Styles.k_white_color,
                      borderRadius: BorderRadius.all(
                        Radius.circular(22),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            isYes
                ? CommonButton(
                    margin: EdgeInsets.only(
                      top: 6,
                      bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                    ),
                    radius: 16,
                    child: Text('Добавить'),
                    onPressed: () {},
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
