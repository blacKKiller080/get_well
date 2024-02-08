import 'package:flutter/material.dart';

import '../../../../../core/components/common_button.dart';
import '../../../../../core/components/placeholders.dart';
import '../../../../../core/constants/styles.dart';

class WomenPeriodScreen extends StatefulWidget {
  const WomenPeriodScreen({super.key});

  @override
  State<WomenPeriodScreen> createState() => _WomenPeriodScreenState();
}

class _WomenPeriodScreenState extends State<WomenPeriodScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Журнал циклов",
                style: TextStyle(
                  color: Styles.k_black_color,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              CommonButton(
                onPressed: () {
                  setState(
                    () {},
                  );
                },
                child: Text(
                  "Месячные",
                  style: TextStyle(
                    color: Styles.k_black_color,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                contentPaddingHorizontal: 17,
                backgroundColor: Styles.k_day_of_period_color,
                foregroundColor: Styles.k_white_color,
                contentPaddingVertical: 14,
                radius: 23,
                hasDownIcon: true,
                icon: Icon(Icons.add),
                margin: EdgeInsets.only(bottom: 10, top: 10),
              ),
              CommonButton(
                onPressed: () {
                  setState(
                    () {},
                  );
                },
                child: Text(
                  "Симптомы",
                  style: TextStyle(
                    color: Styles.k_black_color,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                contentPaddingHorizontal: 17,
                backgroundColor: Styles.k_ovulation_day_color,
                foregroundColor: Styles.k_white_color,
                contentPaddingVertical: 14,
                radius: 23,
                hasDownIcon: true,
                icon: Icon(Icons.add),
                margin: EdgeInsets.only(bottom: 10),
              ),
              CommonButton(
                onPressed: () {
                  setState(
                    () {},
                  );
                },
                child: Text(
                  "Факторы",
                  style: TextStyle(
                    color: Styles.k_black_color,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                contentPaddingHorizontal: 17,
                backgroundColor: Styles.k_factors_purple_color,
                foregroundColor: Styles.k_white_color,
                contentPaddingVertical: 14,
                radius: 23,
                hasDownIcon: true,
                icon: Icon(Icons.add),
              ),
            ],
          ),
          margin: EdgeInsets.only(bottom: 16, top: 16),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: Styles.k_white_color,
            borderRadius: BorderRadius.all(
              Radius.circular(23),
            ),
          ),
        )
      ],
    );
  }
}
