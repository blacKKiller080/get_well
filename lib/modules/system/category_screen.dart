import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/components/common_input.dart';
import '../../core/components/placeholders.dart';
import '../../core/constants/styles.dart';
import '../../core/helper/navigateable.dart';
import '../../core/routes/routes.dart';

class CategoryScreen extends StatefulWidget implements Navigateable {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();

  @override
  String getName() {
    return Routes.category_screen;
  }
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool isCategoryExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.k_backgroung_color,
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
                    margin: EdgeInsets.only(bottom: 16, top: 2),
                    type: InputType.TEXT,
                    fillColor: Styles.k_white_color,
                    isSearchSuffix: true,
                    customColor: Styles.k_text_secondary_color,
                    borderRadius: 15,
                    borderColor: Styles.k_border_primary_color,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Категории",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            categoryField("assets/image/svg/category/1.svg",
                                "Аллергология", context),
                            categoryField("assets/image/svg/category/2.svg",
                                "Андрология", context),
                            categoryField("assets/image/svg/category/3.svg",
                                "Анестезиология", context),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            categoryField("assets/image/svg/category/4.svg",
                                "Гастроэнтерология", context),
                            categoryField("assets/image/svg/category/5.svg",
                                "Гематология", context),
                            categoryField("assets/image/svg/category/6.svg",
                                "Генетика", context),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            categoryField("assets/image/svg/category/7.svg",
                                "Гинекология", context),
                            categoryField("assets/image/svg/category/8.svg",
                                "Дерматология", context),
                            categoryField("assets/image/svg/category/9.svg",
                                "Иммунология", context),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            categoryField("assets/image/svg/category/10.svg",
                                "Инфекционные заболевания", context),
                            categoryField("assets/image/svg/category/11.svg",
                                "Кардиология", context),
                            categoryField("assets/image/svg/category/12.svg",
                                "Кардиохирургия", context),
                          ],
                        ),

                        //ExpandedCategories
                        isCategoryExpanded
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      categoryField(
                                          "assets/image/svg/category/13.svg",
                                          "Наркология",
                                          context),
                                      categoryField(
                                          "assets/image/svg/category/14.svg",
                                          "Неврология",
                                          context),
                                      categoryField(
                                          "assets/image/svg/category/15.svg",
                                          "Нейрохирургия",
                                          context),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      categoryField(
                                          "assets/image/svg/category/16.svg",
                                          "Нефрология",
                                          context),
                                      categoryField(
                                          "assets/image/svg/category/17.svg",
                                          "Онкология",
                                          context),
                                      categoryField(
                                          "assets/image/svg/category/18.svg",
                                          "Ортопедия",
                                          context),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      categoryField(
                                          "assets/image/svg/category/19.svg",
                                          "Отделение терапии",
                                          context),
                                      categoryField(
                                          "assets/image/svg/category/20.svg",
                                          "Отоларингология",
                                          context),
                                      categoryField(
                                          "assets/image/svg/category/21.svg",
                                          "Офтальмология",
                                          context),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      categoryField(
                                          "assets/image/svg/category/22.svg",
                                          "Педиатрия",
                                          context),
                                      categoryField(
                                          "assets/image/svg/category/23.svg",
                                          "Психиатрия",
                                          context),
                                      categoryField(
                                          "assets/image/svg/category/24.svg",
                                          "Психология",
                                          context),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      categoryField(
                                          "assets/image/svg/category/25.svg",
                                          "Пульмонология",
                                          context),
                                      categoryField(
                                          "assets/image/svg/category/26.svg",
                                          "Реабилитология",
                                          context),
                                      categoryField(
                                          "assets/image/svg/category/27.svg",
                                          "Реаниматология",
                                          context),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      categoryField(
                                          "assets/image/svg/category/28.svg",
                                          "Сосудистая хирургия",
                                          context),
                                      categoryField(
                                          "assets/image/svg/category/29.svg",
                                          "Стоматология",
                                          context),
                                      categoryField(
                                          "assets/image/svg/category/30.svg",
                                          "Токсикология",
                                          context),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      categoryField(
                                          "assets/image/svg/category/31.svg",
                                          "Торакальная хирургия",
                                          context),
                                      categoryField(
                                          "assets/image/svg/category/32.svg",
                                          "Травматология",
                                          context),
                                      categoryField(
                                          "assets/image/svg/category/33.svg",
                                          "Урология",
                                          context),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      categoryField(
                                          "assets/image/svg/category/34.svg",
                                          "Хирургия",
                                          context),
                                      categoryField(
                                          "assets/image/svg/category/35.svg",
                                          "Эндокринология",
                                          context),
                                    ],
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),

                        //Expand button
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isCategoryExpanded = !isCategoryExpanded;
                            });
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(50, 20),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            "Еще",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 14,
                                color: Styles.k_black_color,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Styles.k_white_color,
                      borderRadius: BorderRadius.all(
                        Radius.circular(22),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
