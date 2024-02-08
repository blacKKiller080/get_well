// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_well/core/components/calendar_container.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

import '../../../../../core/components/common_button.dart';
import '../../../../../core/constants/styles.dart';

class SymptomsScreen extends StatefulWidget {
  const SymptomsScreen({super.key});

  @override
  State<SymptomsScreen> createState() => _SymptomsScreenState();
}

bool isYes = false;
bool isNo = false;

class _SymptomsScreenState extends State<SymptomsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            CalendarContainer(),
            Text('data'),
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      "У вас что-нибудь болело сегодня?",
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
            ),
          ],
        ),
      ),
    );
  }
}
