// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import '../../../../../core/components/common_button.dart';
import '../../../../../core/constants/styles.dart';

class HedacheScreen extends StatefulWidget {
  const HedacheScreen({super.key});

  @override
  State<HedacheScreen> createState() => _HedacheScreenState();
}

bool isYes = false;
bool isNo = true;

class _HedacheScreenState extends State<HedacheScreen> {
  DateRangePickerController _pickerController = DateRangePickerController();

  String _selectedDate = '';
  List<DateTime> _dateCount = [];
  String _range = '';
  String _rangeCount = '';

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value;
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Container(
              child: SfDateRangePicker(
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.multiple,
                selectionColor: Styles.k_main_color,
                selectionShape: DateRangePickerSelectionShape.rectangle,
                monthViewSettings: DateRangePickerMonthViewSettings(
                  firstDayOfWeek: 1,
                ),
                headerHeight: 45,
                headerStyle: DateRangePickerHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    color: Styles.k_black_color,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                showNavigationArrow: true,
                monthCellStyle: DateRangePickerMonthCellStyle(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Styles.k_main_color,
                  ),
                  todayTextStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Styles.k_main_color,
                  ),
                ),
              ),
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.only(top: 10, right: 13, left: 13),
              decoration: BoxDecoration(
                color: Styles.k_white_color,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
            isNo
                ? Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            "У вас сегодня болела голова?",
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

            // ОПросник Если голова болит
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
                                foregroundColor: Styles.k_border_primary_color,
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
                                foregroundColor: Styles.k_border_primary_color,
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
                                foregroundColor: Styles.k_border_primary_color,
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
                                foregroundColor: Styles.k_border_primary_color,
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
                                foregroundColor: Styles.k_border_primary_color,
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
                                foregroundColor: Styles.k_border_primary_color,
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
                                foregroundColor: Styles.k_border_primary_color,
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
                                foregroundColor: Styles.k_border_primary_color,
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
                                foregroundColor: Styles.k_border_primary_color,
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
                                foregroundColor: Styles.k_border_primary_color,
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
                          margin: EdgeInsets.only(top: 8, right: 4, bottom: 20),
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
                                foregroundColor: Styles.k_border_primary_color,
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
                                foregroundColor: Styles.k_border_primary_color,
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
                          margin: EdgeInsets.only(top: 8, right: 4, bottom: 20),
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
                                foregroundColor: Styles.k_border_primary_color,
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
                                foregroundColor: Styles.k_border_primary_color,
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
                                foregroundColor: Styles.k_border_primary_color,
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
                                foregroundColor: Styles.k_border_primary_color,
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
                                foregroundColor: Styles.k_border_primary_color,
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
                                margin:
                                    EdgeInsets.only(top: 8, left: 4, bottom: 4),
                                backgroundColor: Colors.transparent,
                                foregroundColor: Styles.k_border_primary_color,
                                borderColor: true,
                              ),
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
