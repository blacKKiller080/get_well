import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

import '../constants/styles.dart';

class CalendarContainer extends StatefulWidget {
  const CalendarContainer({super.key});

  @override
  State<CalendarContainer> createState() => _CalendarContainerState();
}

class _CalendarContainerState extends State<CalendarContainer> {
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
    return Column(
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
      ],
    );
  }
}
