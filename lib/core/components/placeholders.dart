import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/styles.dart';
import '../routes/routes.dart';
import 'common_button.dart';
import 'dart:io';

// This function displays a CupertinoModalPopup with a reasonable fixed height
// which hosts CupertinoDatePicker.
void showDatePickerDialog(Widget child, BuildContext context) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Container(
      height: MediaQuery.of(context).size.height / 100 * 25.6,
      padding: const EdgeInsets.only(top: 10),
      // The Bottom margin is provided to align the popup above the system
      // navigation bar.
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      // Provide a background color for the popup.
      color: Styles.k_white_color,
      // Use a SafeArea widget to avoid system overlaps.
      child: SafeArea(
        top: false,
        child: child,
      ),
    ),
  );
}

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: SvgPicture.asset(
        "assets/image/svg/alert.svg",
      ),
      content: const Text(
        'Вы действительно хотите выйти?',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Styles.k_black_color,
            fontSize: 20,
            fontWeight: FontWeight.w700),
      ),
      actions: <Widget>[
        Row(
          children: [
            Expanded(
              child: CommonButton(
                contentPaddingVertical: .59,
                fontSize: 20,
                margin: EdgeInsets.only(right: 5, left: 22, bottom: 22),
                child: Text('Нет'),
                backgroundColor: Colors.transparent,
                foregroundColor: Styles.k_main_color,
                borderColor: true,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              child: CommonButton(
                contentPaddingVertical: .59,
                fontSize: 20,
                margin: EdgeInsets.only(bottom: 22, left: 5, right: 22),
                child: Text('Да'),
                backgroundColor: Colors.transparent,
                foregroundColor: Styles.k_border_red_color,
                borderColor: true,
                onPressed: () {
                  FirebaseAuth.instance.signOut().then(
                    (value) {
                      Navigator.of(context).pushReplacementNamed(Routes.login);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(23),
      ),
    ),
  );
}

final divider = Container(
  height: 20,
  decoration: const BoxDecoration(
    border: Border(right: BorderSide(color: Styles.k_black_color, width: 1)),
  ),
);

Widget archiveField(String archiveName, bool add, BuildContext context) =>
    Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            archiveName,
            style: TextStyle(
                color: Styles.k_black_color,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          divider,
          Text(
            '18.10',
            style: TextStyle(
                color: Styles.k_black_color,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          divider,
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              add ? 'Добавить' : 'Удалить',
              style: TextStyle(
                color: add ? Styles.k_add_color : Styles.k_border_red_color,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height / 100 * 2.84),
    );

Widget categoryField(String image, String data, BuildContext context) =>
    Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.doctor_list_screen,
              arguments: image);
        },
        child: Container(
          padding: EdgeInsets.only(
            bottom: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                image,
              ),
              SizedBox(height: 5),
              Text(
                data,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );

Widget listTileWidget(BuildContext context) => ListTile(
      leading: Image.asset(
        'assets/image/png/friendAvatar.png',
      ),
      title: Text(
        'Стас, 13 лет',
        style: TextStyle(
            color: Styles.k_black_color,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: () {},
        child: Text(
          'Перейти',
          style: TextStyle(
              color: Styles.k_main_color,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
      dense: true,
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      contentPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height / 100 * 4.265, top: 0),
    );

// void showCalendarMode(BuildContext context, int index) {
//   showGeneralDialog(
//     barrierLabel: "Label",
//     barrierDismissible: true,
//     barrierColor: Colors.black.withOpacity(0.5),
//     transitionDuration: Duration(milliseconds: 400),
//     context: context,
//     pageBuilder: (context, anim1, anim2) {
//       return StatefulBuilder(
//         builder: ((context, setState) => Align(
//               alignment: Alignment.topCenter,
//               child: Column(
//                 children: [
//                   Container(
//                     child: Column(
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           margin: EdgeInsets.only(bottom: 20),
//                           child: Text(
//                             'Календарь',
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 color: Styles.k_black_color,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                         ),
//                         CommonButton(
//                           onPressed: (va) {
//                             setState(() {
//                               index = 1;
//                               Navigator.pop(context, value)
//                             });
//                           },
//                           child: const Text(
//                             'Головные боли',
//                             style: TextStyle(
//                               color: Styles.k_black_color,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           margin: EdgeInsets.only(bottom: 18),
//                           contentPaddingHorizontal: 16,
//                           backgroundColor: Styles.k_white_color,
//                           borderColor: true,
//                           foregroundColor: Styles.k_border_primary_color,
//                           contentPaddingVertical: 13,
//                           radius: 23,
//                           hasDownIcon: true,
//                           icon: index != 1
//                               ? Icon(Icons.radio_button_unchecked)
//                               : Icon(
//                                   Icons.radio_button_checked,
//                                   color: Styles.k_main_color,
//                                 ),
//                         ),
//                         CommonButton(
//                           onPressed: () {
//                             setState(() {
//                               index = 2;
//                               // Navigator.of(context, rootNavigator: true)
//                               //     .pop(index);
//                             });
//                           },
//                           child: const Text(
//                             'Месячные',
//                             style: TextStyle(
//                               color: Styles.k_black_color,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           margin: EdgeInsets.only(bottom: 18),
//                           contentPaddingHorizontal: 16,
//                           backgroundColor: Styles.k_white_color,
//                           borderColor: true,
//                           foregroundColor: Styles.k_border_primary_color,
//                           contentPaddingVertical: 13,
//                           radius: 23,
//                           hasDownIcon: true,
//                           icon: index != 2
//                               ? Icon(Icons.radio_button_unchecked)
//                               : Icon(
//                                   Icons.radio_button_checked,
//                                   color: Styles.k_main_color,
//                                 ),
//                         ),
//                         CommonButton(
//                           onPressed: () {
//                             setState(() {
//                               index = 3;
//                               // Navigator.of(context, rootNavigator: true)
//                               //     .pop(index);
//                             });
//                           },
//                           child: const Text(
//                             'Симптомы',
//                             style: TextStyle(
//                               color: Styles.k_black_color,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           margin: EdgeInsets.only(bottom: 18),
//                           contentPaddingHorizontal: 16,
//                           backgroundColor: Styles.k_white_color,
//                           borderColor: true,
//                           foregroundColor: Styles.k_border_primary_color,
//                           contentPaddingVertical: 13,
//                           radius: 23,
//                           hasDownIcon: true,
//                           icon: index != 3
//                               ? Icon(Icons.radio_button_unchecked)
//                               : Icon(
//                                   Icons.radio_button_checked,
//                                   color: Styles.k_main_color,
//                                 ),
//                         ),
//                         CommonButton(
//                           onPressed: () {
//                             setState(() {
//                               index = 4;
//                               // Navigator.of(context, rootNavigator: true)
//                               //     .pop(index);
//                             });
//                           },
//                           child: const Text(
//                             'Давление',
//                             style: TextStyle(
//                               color: Styles.k_black_color,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           margin: EdgeInsets.only(bottom: 18),
//                           contentPaddingHorizontal: 16,
//                           backgroundColor: Styles.k_white_color,
//                           borderColor: true,
//                           foregroundColor: Styles.k_border_primary_color,
//                           contentPaddingVertical: 13,
//                           radius: 23,
//                           hasDownIcon: true,
//                           icon: index != 4
//                               ? Icon(Icons.radio_button_unchecked)
//                               : Icon(
//                                   Icons.radio_button_checked,
//                                   color: Styles.k_main_color,
//                                 ),
//                         ),
//                       ],
//                     ),
//                     padding: EdgeInsets.only(
//                         left: 16, right: 16, top: 17, bottom: 10),
//                     margin: EdgeInsets.only(
//                         top: AppBar().preferredSize.height + 50,
//                         left: 12,
//                         right: 12),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                   ),
//                 ],
//               ),
//             )),
//       );
//     },
//     transitionBuilder: (context, anim1, anim2, child) {
//       return SlideTransition(
//         position: Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(anim1),
//         child: child,
//       );
//     },
//   );
// }

// /// The method for [DateRangePickerSelectionChanged] callback, which will be
//   /// called whenever a selection changed on the date picker widget.
//   void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
//     /// The argument value will return the changed date as [DateTime] when the
//     /// widget [SfDateRangeSelectionMode] set as single.
//     ///
//     /// The argument value will return the changed dates as [List<DateTime>]
//     /// when the widget [SfDateRangeSelectionMode] set as multiple.
//     ///
//     /// The argument value will return the changed range as [PickerDateRange]
//     /// when the widget [SfDateRangeSelectionMode] set as range.
//     ///
//     /// The argument value will return the changed ranges as
//     /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
//     /// multi range.
//     setState(() {
//       if (args.value is PickerDateRange) {
//         _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
//             // ignore: lines_longer_than_80_chars
//             ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
//       } else if (args.value is DateTime) {
//         _selectedDate = args.value.toString();
//       } else if (args.value is List<DateTime>) {
//         _dateCount = args.value;
//       } else {
//         _rangeCount = args.value.length.toString();
//       }
//     });
//   }

String getCalendarType(int index) {
  String data;

  switch (index) {
    case 1:
      data = 'Головные боли';
      break;
    case 2:
      data = 'Месячные';
      break;
    case 3:
      data = 'Симптомы';
      break;
    case 4:
      data = 'Давление';
      break;
    default:
      data = 'Головные боли';
  }

  return data;
}

class AlertController {
  static void showMessage({
    required BuildContext context,
    required String title,
    required String content,
    bool barrierDismissable = true,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
  }) async {
    if (Platform.isIOS || Platform.isMacOS) {
      await showCupertinoDialog(
        context: context,
        barrierDismissible: barrierDismissable,
        builder: (_) => CupertinoAlertDialog(
          title: Text(
            title,
            style: titleStyle ?? Theme.of(context).textTheme.titleMedium,
          ),
          content: Text(
            content,
            style: contentStyle ?? Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      );
    }
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissable,
      builder: (_) => AlertDialog(
        title: Text(
          title,
          style: titleStyle ?? Theme.of(context).textTheme.titleMedium,
        ),
        content: Text(
          content,
          style: contentStyle ?? Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

  static void showDecisionDialog({
    required BuildContext context,
    required void Function() onYes,
    required void Function() onNo,
    bool barrierDismissable = true,
    required String title,
    TextStyle? titleStyle,
    String? content,
    TextStyle? contentStyle,
  }) async {
    if (Platform.isIOS || Platform.isMacOS) {
      await showCupertinoDialog(
        context: context,
        barrierDismissible: barrierDismissable,
        builder: (_) => CupertinoAlertDialog(
          title: Text(
            title,
            style: titleStyle ?? Theme.of(context).textTheme.titleMedium,
          ),
          content: (content?.isEmpty ?? true)
              ? null
              : Text(
                  content!,
                  style: contentStyle ?? Theme.of(context).textTheme.bodyMedium,
                ),
          actions: [
            CupertinoDialogAction(
              onPressed: onYes,
              child: const Text('Да'),
            ),
            CupertinoDialogAction(
              onPressed: onNo,
              child: const Text('Нет'),
            ),
          ],
        ),
      );
    }
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissable,
      builder: (_) => AlertDialog(
        title: Text(
          title,
          style: titleStyle ?? Theme.of(context).textTheme.titleMedium,
        ),
        content: (content?.isEmpty ?? true)
            ? null
            : Text(
                content!,
                style: contentStyle ?? Theme.of(context).textTheme.bodyMedium,
              ),
        actions: [
          TextButton(
            onPressed: onNo,
            child: const Text('Нет'),
          ),
          TextButton(
            onPressed: onYes,
            child: const Text('Да'),
          ),
        ],
      ),
    );
  }
}
