import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_well/core/components/calendar_questionnaire_card.dart';
import 'package:get_well/core/components/common_button.dart';
import 'package:get_well/core/components/placeholders.dart';
import 'package:get_well/core/helper/navigateable.dart';
import 'package:get_well/core/routes/routes.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/styles.dart';
import '../../../core/providers/app_providers/screen_provider.dart';
import '../../../core/providers/app_providers/calendar_provider.dart';

class CalendarScreen extends StatefulWidget implements Navigateable {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();

  @override
  String getName() {
    return Routes.calendar_screen;
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  bool isSelected = false;
  int index = 0;
  bool isYes = false;
  bool isNo = true;

  int _currentIndex = 0;
  List cardList = [
    QuestionnaireCard("У вас что-нибудь болело сегодня?"),
    QuestionnaireCard("Чувствовали недомогание сегодня?"),
    QuestionnaireCard("У вас сегодня болела голова?"),
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.k_border_secondary_color,
      appBar: AppBar(
        title: Text('Календарь'),
        titleTextStyle: TextStyle(
            color: Styles.k_black_color,
            fontSize: 20,
            fontWeight: FontWeight.w700),
        centerTitle: true,
        backgroundColor: Styles.k_white_color,
        toolbarHeight: 54,
        iconTheme: IconThemeData(color: Styles.k_black_color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(23),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            Column(
              children: [
                CommonButton(
                  onPressed: () {
                    setState(() {
                      showGeneralDialog(
                        barrierLabel: "Label",
                        barrierDismissible: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionDuration: Duration(milliseconds: 400),
                        context: context,
                        pageBuilder: (context, anim1, anim2) {
                          return Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.only(bottom: 20),
                                        child: Text(
                                          'Календарь',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Styles.k_black_color,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      CommonButton(
                                        onPressed: () {
                                          setState(() {
                                            index = 1;
                                            Navigator.pop(context, index);
                                          });
                                          Provider.of<CalendarProvider>(context,
                                                  listen: false)
                                              .setSelectedIndex(index);
                                        },
                                        child: const Text(
                                          'Головные боли',
                                          style: TextStyle(
                                            color: Styles.k_black_color,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(bottom: 18),
                                        contentPaddingHorizontal: 16,
                                        backgroundColor: Styles.k_white_color,
                                        borderColor: true,
                                        foregroundColor:
                                            Styles.k_border_primary_color,
                                        contentPaddingVertical: 13,
                                        radius: 23,
                                        hasDownIcon: true,
                                        icon: index != 1
                                            ? Icon(Icons.radio_button_unchecked)
                                            : Icon(
                                                Icons.radio_button_checked,
                                                color: Styles.k_main_color,
                                              ),
                                      ),
                                      CommonButton(
                                        onPressed: () {
                                          setState(() {
                                            index = 2;
                                            Navigator.pop(context, index);
                                          });
                                          Provider.of<CalendarProvider>(context,
                                                  listen: false)
                                              .setSelectedIndex(index);
                                        },
                                        child: const Text(
                                          'Месячные',
                                          style: TextStyle(
                                            color: Styles.k_black_color,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(bottom: 18),
                                        contentPaddingHorizontal: 16,
                                        backgroundColor: Styles.k_white_color,
                                        borderColor: true,
                                        foregroundColor:
                                            Styles.k_border_primary_color,
                                        contentPaddingVertical: 13,
                                        radius: 23,
                                        hasDownIcon: true,
                                        icon: index != 2
                                            ? Icon(Icons.radio_button_unchecked)
                                            : Icon(
                                                Icons.radio_button_checked,
                                                color: Styles.k_main_color,
                                              ),
                                      ),
                                      CommonButton(
                                        onPressed: () {
                                          setState(() {
                                            index = 3;
                                            Navigator.pop(context, index);
                                          });
                                          Provider.of<CalendarProvider>(context,
                                                  listen: false)
                                              .setSelectedIndex(index);
                                        },
                                        child: const Text(
                                          'Симптомы',
                                          style: TextStyle(
                                            color: Styles.k_black_color,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(bottom: 18),
                                        contentPaddingHorizontal: 16,
                                        backgroundColor: Styles.k_white_color,
                                        borderColor: true,
                                        foregroundColor:
                                            Styles.k_border_primary_color,
                                        contentPaddingVertical: 13,
                                        radius: 23,
                                        hasDownIcon: true,
                                        icon: index != 3
                                            ? Icon(Icons.radio_button_unchecked)
                                            : Icon(
                                                Icons.radio_button_checked,
                                                color: Styles.k_main_color,
                                              ),
                                      ),
                                      CommonButton(
                                        onPressed: () {
                                          setState(() {
                                            index = 4;
                                            Navigator.pop(context, index);
                                          });
                                          Provider.of<CalendarProvider>(context,
                                                  listen: false)
                                              .setSelectedIndex(index);
                                        },
                                        child: const Text(
                                          'Давление',
                                          style: TextStyle(
                                            color: Styles.k_black_color,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(bottom: 18),
                                        contentPaddingHorizontal: 16,
                                        backgroundColor: Styles.k_white_color,
                                        borderColor: true,
                                        foregroundColor:
                                            Styles.k_border_primary_color,
                                        contentPaddingVertical: 13,
                                        radius: 23,
                                        hasDownIcon: true,
                                        icon: index != 4
                                            ? Icon(Icons.radio_button_unchecked)
                                            : Icon(
                                                Icons.radio_button_checked,
                                                color: Styles.k_main_color,
                                              ),
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.only(
                                      left: 16, right: 16, top: 17, bottom: 10),
                                  margin: EdgeInsets.only(
                                      top: AppBar().preferredSize.height + 50,
                                      left: 12,
                                      right: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        transitionBuilder: (context, anim1, anim2, child) {
                          return SlideTransition(
                            position:
                                Tween(begin: Offset(0, -1), end: Offset(0, 0))
                                    .animate(anim1),
                            child: child,
                          );
                        },
                      );
                    });
                  },
                  child: Text(
                    getCalendarType(index),
                    style: TextStyle(
                      color: Styles.k_black_color,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  contentPaddingHorizontal: 25,
                  backgroundColor: Styles.k_white_color,
                  foregroundColor: Styles.k_black_color,
                  contentPaddingVertical: 10,
                  radius: 16,
                  hasDownIcon: true,
                  icon: Icon(Icons.keyboard_arrow_down_rounded),
                ),
                Provider.of<CalendarProvider>(context).selectedWidget,
                CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 3.45,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: cardList.map((card) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        child: card,
                      );
                    });
                  }).toList(),
                ),
                isYes
                    ? Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Опросник",
                              style: TextStyle(
                                color: Styles.k_black_color,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            //Была ли у вас сегодня головная боль?
                            Text(
                              "Была ли у вас сегодня головная боль?",
                              style: TextStyle(
                                color: Styles.k_black_color,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CommonButton(
                                    child: Text(
                                      'Да',
                                      style: TextStyle(
                                        color: Styles.k_black_color,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isYes = true;
                                        isNo = false;
                                      });
                                    },
                                    bigText: false,
                                    margin: EdgeInsets.only(
                                        top: 8, right: 4, bottom: 20),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        Styles.k_border_primary_color,
                                    borderColor: true,
                                  ),
                                ),
                                Expanded(
                                  child: CommonButton(
                                    child: Text(
                                      'Нет',
                                      style: TextStyle(
                                        color: Styles.k_black_color,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isNo = true;
                                        isYes = false;
                                      });
                                    },
                                    bigText: false,
                                    margin: EdgeInsets.only(
                                        top: 8, left: 4, bottom: 20),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        Styles.k_border_primary_color,
                                    borderColor: true,
                                  ),
                                ),
                              ],
                            ),
                            //Где отмечалась головная боль?
                            Text(
                              "Где отмечалась головная боль?",
                              style: TextStyle(
                                color: Styles.k_black_color,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CommonButton(
                                    child: Text(
                                      'С одной стороны',
                                      style: TextStyle(
                                        color: Styles.k_black_color,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    bigText: false,
                                    margin: EdgeInsets.only(
                                        top: 8, right: 4, bottom: 20),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        Styles.k_border_primary_color,
                                    borderColor: true,
                                  ),
                                ),
                                Expanded(
                                  child: CommonButton(
                                    child: Text(
                                      'С двух сторон',
                                      style: TextStyle(
                                        color: Styles.k_black_color,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    bigText: false,
                                    margin: EdgeInsets.only(
                                        top: 8, left: 4, bottom: 20),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        Styles.k_border_primary_color,
                                    borderColor: true,
                                  ),
                                ),
                              ],
                            ),
                            //Характер головной боли
                            Text(
                              "Характер головной боли",
                              style: TextStyle(
                                color: Styles.k_black_color,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CommonButton(
                                    child: Text(
                                      'Пульсирующая',
                                      style: TextStyle(
                                        color: Styles.k_black_color,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    bigText: false,
                                    margin: EdgeInsets.only(
                                        top: 8, right: 4, bottom: 20),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        Styles.k_border_primary_color,
                                    borderColor: true,
                                  ),
                                ),
                                Expanded(
                                  child: CommonButton(
                                    child: Text(
                                      'Сжимающая',
                                      style: TextStyle(
                                        color: Styles.k_black_color,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    bigText: false,
                                    margin: EdgeInsets.only(
                                        top: 8, left: 4, bottom: 20),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        Styles.k_border_primary_color,
                                    borderColor: true,
                                  ),
                                ),
                              ],
                            ),
                            //Ухудшалась ли ГБ при физической активности (подъем по лестнице, др.)?
                            Text(
                              "Ухудшалась ли ГБ при физической активности (подъем по лестнице, др.)?",
                              style: TextStyle(
                                color: Styles.k_black_color,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CommonButton(
                                    child: Text(
                                      'Да',
                                      style: TextStyle(
                                        color: Styles.k_black_color,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    bigText: false,
                                    margin: EdgeInsets.only(
                                        top: 8, right: 4, bottom: 20),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        Styles.k_border_primary_color,
                                    borderColor: true,
                                  ),
                                ),
                                Expanded(
                                  child: CommonButton(
                                    child: Text(
                                      'Нет',
                                      style: TextStyle(
                                        color: Styles.k_black_color,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    bigText: false,
                                    margin: EdgeInsets.only(
                                        top: 8, left: 4, bottom: 20),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        Styles.k_border_primary_color,
                                    borderColor: true,
                                  ),
                                ),
                              ],
                            ),
                            //Какова была в целом интенсивность ГБ?
                            Text(
                              "Какова была в целом интенсивность ГБ?",
                              style: TextStyle(
                                color: Styles.k_black_color,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CommonButton(
                                    child: Text(
                                      'Незначительная',
                                      style: TextStyle(
                                        color: Styles.k_black_color,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    bigText: false,
                                    margin: EdgeInsets.only(top: 8, right: 4),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        Styles.k_border_primary_color,
                                    borderColor: true,
                                  ),
                                ),
                                Expanded(
                                  child: CommonButton(
                                    child: Text(
                                      'Сильная',
                                      style: TextStyle(
                                        color: Styles.k_black_color,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    bigText: false,
                                    margin: EdgeInsets.only(top: 8, left: 4),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        Styles.k_border_primary_color,
                                    borderColor: true,
                                  ),
                                ),
                              ],
                            ),
                            CommonButton(
                              child: Text(
                                'Очень сильная',
                                style: TextStyle(
                                  color: Styles.k_black_color,
                                ),
                              ),
                              onPressed: () {
                                setState(() {});
                              },
                              hasIconMiniButton: true,
                              bigText: false,
                              margin:
                                  EdgeInsets.only(top: 8, right: 4, bottom: 20),
                              backgroundColor: Colors.transparent,
                              foregroundColor: Styles.k_border_primary_color,
                              borderColor: true,
                            ),
                            //Была ли у вас тошнота
                            Text(
                              "Была ли у вас тошнота?",
                              style: TextStyle(
                                color: Styles.k_black_color,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CommonButton(
                                    child: Text(
                                      'Нет',
                                      style: TextStyle(
                                        color: Styles.k_black_color,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    bigText: false,
                                    margin: EdgeInsets.only(top: 8, right: 4),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        Styles.k_border_primary_color,
                                    borderColor: true,
                                  ),
                                ),
                                Expanded(
                                  child: CommonButton(
                                    child: Text(
                                      'Незначительная',
                                      style: TextStyle(
                                        color: Styles.k_black_color,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    bigText: false,
                                    margin: EdgeInsets.only(top: 8, left: 4),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        Styles.k_border_primary_color,
                                    borderColor: true,
                                  ),
                                ),
                              ],
                            ),
                            CommonButton(
                              child: Text(
                                'Заметная',
                                style: TextStyle(
                                  color: Styles.k_black_color,
                                ),
                              ),
                              onPressed: () {
                                setState(() {});
                              },
                              hasIconMiniButton: true,
                              bigText: false,
                              margin:
                                  EdgeInsets.only(top: 8, right: 4, bottom: 20),
                              backgroundColor: Colors.transparent,
                              foregroundColor: Styles.k_border_primary_color,
                              borderColor: true,
                            ),
                            //Была ли у вас рвота?
                            Text(
                              "Была ли у вас рвота?",
                              style: TextStyle(
                                color: Styles.k_black_color,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CommonButton(
                                    child: Text(
                                      'Да',
                                      style: TextStyle(
                                        color: Styles.k_black_color,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    bigText: false,
                                    margin: EdgeInsets.only(
                                        top: 8, right: 4, bottom: 20),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        Styles.k_border_primary_color,
                                    borderColor: true,
                                  ),
                                ),
                                Expanded(
                                  child: CommonButton(
                                    child: Text(
                                      'Нет',
                                      style: TextStyle(
                                        color: Styles.k_black_color,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    bigText: false,
                                    margin: EdgeInsets.only(
                                        top: 8, left: 4, bottom: 20),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        Styles.k_border_primary_color,
                                    borderColor: true,
                                  ),
                                ),
                              ],
                            ),
                            //Вас раздражал свет?
                            Text(
                              "Вас раздражал свет?",
                              style: TextStyle(
                                color: Styles.k_black_color,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CommonButton(
                                    child: Text(
                                      'Да',
                                      style: TextStyle(
                                        color: Styles.k_black_color,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    bigText: false,
                                    margin: EdgeInsets.only(
                                        top: 8, right: 4, bottom: 20),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        Styles.k_border_primary_color,
                                    borderColor: true,
                                  ),
                                ),
                                Expanded(
                                  child: CommonButton(
                                    child: Text(
                                      'Нет',
                                      style: TextStyle(
                                        color: Styles.k_black_color,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    bigText: false,
                                    margin: EdgeInsets.only(
                                        top: 8, left: 4, bottom: 20),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        Styles.k_border_primary_color,
                                    borderColor: true,
                                  ),
                                ),
                              ],
                            ),
                            //Вас раздражал звук?
                            Text(
                              "Вас раздражал звук?",
                              style: TextStyle(
                                color: Styles.k_black_color,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CommonButton(
                                    child: Text(
                                      'Да',
                                      style: TextStyle(
                                        color: Styles.k_black_color,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    bigText: false,
                                    margin: EdgeInsets.only(
                                        top: 8, right: 4, bottom: 4),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        Styles.k_border_primary_color,
                                    borderColor: true,
                                  ),
                                ),
                                Expanded(
                                  child: CommonButton(
                                    child: Text(
                                      'Нет',
                                      style: TextStyle(
                                        color: Styles.k_black_color,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    bigText: false,
                                    margin: EdgeInsets.only(
                                        top: 8, left: 4, bottom: 4),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor:
                                        Styles.k_border_primary_color,
                                    borderColor: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: 16, top: 16),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        decoration: BoxDecoration(
                          color: Styles.k_white_color,
                          borderRadius: BorderRadius.all(
                            Radius.circular(22),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
