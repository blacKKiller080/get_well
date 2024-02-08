import 'package:flutter/material.dart';
import 'package:get_well/core/components/doctor_list_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/components/common_input.dart';
import '../../../core/constants/styles.dart';
import '../../../core/helper/navigateable.dart';
import '../../../core/providers/app_providers/screen_provider.dart';
import '../../../core/routes/routes.dart';

class DoctorListScreen extends StatefulWidget implements Navigateable {
  const DoctorListScreen({super.key});

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();

  @override
  String getName() {
    return Routes.doctor_list_screen;
  }
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  @override
  Widget build(BuildContext context) {
    final image = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Styles.k_backgroung_color,
      appBar: AppBar(
        title: Text('Поиск врачей или отделения'),
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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 0),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              Column(
                children: [
                  CommonInput(
                    "Поиск врачей или отделения",
                    margin: EdgeInsets.only(bottom: 8, top: 2),
                    type: InputType.TEXT,
                    fillColor: Styles.k_white_color,
                    isSearchSuffix: true,
                    customColor: Styles.k_text_secondary_color,
                    borderRadius: 15,
                    borderColor: Styles.k_border_primary_color,
                  ),
                  DoctorListCard(image),
                  DoctorListCard(image),
                  DoctorListCard(image),
                  DoctorListCard(image),
                  DoctorListCard(image),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
