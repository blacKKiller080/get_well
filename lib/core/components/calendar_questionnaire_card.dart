import 'package:flutter/material.dart';

import '../constants/styles.dart';
import 'common_button.dart';

class QuestionnaireCard extends StatelessWidget {
  String label = "";
  void Function()? onTapYes;

  void Function()? onTapNo;

  QuestionnaireCard(this.label, {this.onTapNo, this.onTapYes});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
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
                      onTapYes;
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
                      onTapNo;
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
    );
  }
}
