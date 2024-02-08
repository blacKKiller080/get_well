import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:intl/intl.dart';

import '../../../../../core/blocs/country/country_bloc.dart';
import '../../../../../core/components/common_button.dart';
import '../../../../../core/components/common_input.dart';
import '../../../../../core/components/placeholders.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/helper/input_helper.dart';
import '../../../../../core/helper/navigateable.dart';
import '../../../../../core/models/country_dto.dart';
import '../../../../../core/providers/authorization/authorization_provider.dart';
import '../../../../../core/routes/routes.dart';

class EditProfileScreen extends StatefulWidget implements Navigateable {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();

  @override
  String getName() {
    return Routes.edit_profile;
  }
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  MaskTextInputFormatter formatter = InputHelper.maskTextInputFormatter();

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var surnameController = TextEditingController();

  DateTime date = DateTime.now();
  static final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  bool isMan = false;
  bool isWoman = false;
  bool isPregnant = false;
  bool notPregnant = false;
  bool isExpandedForAdditionalData = false;

  final items = [];
  int index = 0;

  static const List<String> list = <String>['Astana', 'Almaty', 'Taraz'];
  String dropdownValue = list.first;
  int dropdownIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i <= 45; i++) {
      items.add(i);
    }
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.k_border_secondary_color,
      appBar: AppBar(
        title: Text('Анкета'),
        titleTextStyle: TextStyle(
            color: Styles.k_black_color,
            fontSize: 20,
            fontWeight: FontWeight.w700),
        centerTitle: true,
        backgroundColor: Styles.k_white_color,
        toolbarHeight: height * 7.1,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left_outlined, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Styles.k_border_primary_color,
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(23),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          margin: EdgeInsets.only(
            left: width * 4.1,
            right: width * 4.1,
            top: height * 1.9,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 8,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    CommonInput(
                      "Ваше имя",
                      margin: EdgeInsets.only(bottom: height * 1.9),
                      type: InputType.TEXT,
                      customColor: Styles.k_text_secondary_color,
                      fillColor: Styles.k_white_color,
                      controller: nameController,
                      onChanged: (val) {},
                    ),
                    CommonInput(
                      "Ваша фамилия",
                      margin: EdgeInsets.only(bottom: height * 1.9),
                      type: InputType.TEXT,
                      customColor: Styles.k_text_secondary_color,
                      fillColor: Styles.k_white_color,
                      controller: surnameController,
                      onChanged: (val) {},
                    ),
                    CommonInput(
                      "Ваша почта",
                      margin: EdgeInsets.only(bottom: height * 1.9),
                      type: InputType.EMAIL,
                      customColor: Styles.k_text_secondary_color,
                      fillColor: Styles.k_white_color,
                      controller: emailController,
                      onChanged: (val) {},
                    ),
                    CommonInput(
                      "Ваш номер",
                      margin: EdgeInsets.only(bottom: height * 1.9),
                      type: InputType.PHONE,
                      customColor: Styles.k_text_secondary_color,
                      fillColor: Styles.k_white_color,
                      controller: phoneController,
                      formatters: [formatter],
                      onChanged: (val) {},
                    ),
                    CommonInput(
                      "Ваш рост",
                      margin: EdgeInsets.only(bottom: height * 1.9),
                      type: InputType.NUMBER,
                      customColor: Styles.k_text_secondary_color,
                      fillColor: Styles.k_white_color,
                      fontWeight: FontWeight.w600,
                      controller: heightController,
                      onChanged: (val) {},
                    ),
                    CommonInput(
                      "Ваш вес",
                      margin: EdgeInsets.only(bottom: height * 1.9),
                      type: InputType.NUMBER,
                      customColor: Styles.k_text_secondary_color,
                      fillColor: Styles.k_white_color,
                      controller: weightController,
                      onChanged: (val) {},
                    ),
                    //Date
                    Text(
                      "Дата рождения",
                      style: TextStyle(
                        color: Styles.k_black_color,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                0, height * 0.95, width * 1.022, height * 1.9),
                            child: SizedBox(
                              height: height * 5.33,
                              child: OutlinedButton(
                                // Display a CupertinoDatePicker in date picker mode.
                                onPressed: () {
                                  showDatePickerDialog(
                                    CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      use24hFormat: true,
                                      minimumDate: DateTime(1900),
                                      dateOrder: DatePickerDateOrder.dmy,
                                      // This is called when the user changes the date.
                                      onDateTimeChanged: (DateTime newDate) {
                                        setState(() => date = newDate);
                                      },
                                    ),
                                    context,
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // In this example, the date is formatted manually. You can
                                    // use the intl package to format the value based on the
                                    // user's locale settings.
                                    Text(
                                      '${date.day}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Styles.k_black_color,
                                    ),
                                  ],
                                ),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.only(
                                      left: width * 4.36, right: width * 2),
                                  backgroundColor: Styles.k_white_color,
                                  side: const BorderSide(
                                      color: Styles.k_white_color),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(29),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(width * 1.022,
                                height * 0.95, width * 1.022, height * 1.9),
                            child: SizedBox(
                              height: height * 5.33,
                              child: OutlinedButton(
                                // Display a CupertinoDatePicker in date picker mode.
                                onPressed: () {
                                  showDatePickerDialog(
                                    CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      use24hFormat: true,
                                      minimumDate: DateTime(1900),
                                      dateOrder: DatePickerDateOrder.dmy,
                                      initialDateTime: date,
                                      // This is called when the user changes the date.
                                      onDateTimeChanged: (DateTime newDate) {
                                        setState(() => date = newDate);
                                      },
                                    ),
                                    context,
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // In this example, the date is formatted manually. You can
                                    // use the intl package to format the value based on the
                                    // user's locale settings.
                                    Text(
                                      '${DateFormat.LLLL().format(date)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                    // SizedBox(
                                    //   width: 10,
                                    // ),
                                    const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Styles.k_black_color,
                                    ),
                                  ],
                                ),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.only(
                                      left: width * 4.36, right: width * 2),
                                  backgroundColor: Styles.k_white_color,
                                  side: const BorderSide(
                                      color: Styles.k_white_color),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(29),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                width * 1.022, height * 0.95, 0, height * 1.9),
                            child: SizedBox(
                              height: height * 5.33,
                              child: OutlinedButton(
                                // Display a CupertinoDatePicker in date picker mode.
                                onPressed: () {
                                  showDatePickerDialog(
                                    CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      use24hFormat: true,
                                      minimumDate: DateTime(1900),
                                      dateOrder: DatePickerDateOrder.dmy,
                                      // This is called when the user changes the date.
                                      onDateTimeChanged: (DateTime newDate) {
                                        setState(() => date = newDate);
                                      },
                                    ),
                                    context,
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // In this example, the date is formatted manually. You can
                                    // use the intl package to format the value based on the
                                    // user's locale settings.
                                    Text(
                                      '${date.year}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Styles.k_black_color,
                                    ),
                                  ],
                                ),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.only(
                                      left: width * 4.36, right: width * 2),
                                  backgroundColor: Styles.k_white_color,
                                  side: const BorderSide(
                                      color: Styles.k_white_color),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(29),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //Gender
                    Text(
                      "Пол",
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
                            child: Text('Муж'),
                            onPressed: () {
                              setState(() {
                                isMan = !isMan;
                                isWoman = false;
                                isPregnant = false;
                              });
                            },
                            margin: EdgeInsets.only(
                                top: height * .95,
                                right: width * 1.02,
                                bottom: height * 1.9),
                            backgroundColor: Styles.k_white_color,
                            foregroundColor: Styles.k_main_color,
                            disabled: isMan,
                          ),
                        ),
                        Expanded(
                          child: CommonButton(
                            child: Text('Жен'),
                            onPressed: () {
                              setState(() {
                                isWoman = !isWoman;
                                isMan = false;
                              });
                            },
                            margin: EdgeInsets.only(
                                top: height * .95,
                                left: width * 1.02,
                                bottom: height * 1.9),
                            backgroundColor: Styles.k_white_color,
                            foregroundColor: Styles.k_main_color,
                            disabled: isWoman,
                          ),
                        ),
                      ],
                    ),

                    //GenderWomen
                    isWoman
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Вы беременны?",
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
                                      child: Text('Да'),
                                      onPressed: () {
                                        setState(() {
                                          isPregnant = true;
                                          notPregnant = false;
                                        });
                                      },
                                      margin: EdgeInsets.only(
                                        top: height * .95,
                                        right: width * 1,
                                        bottom: height * 1.9,
                                      ),
                                      backgroundColor: Styles.k_white_color,
                                      foregroundColor: Styles.k_main_color,
                                      disabled: isPregnant,
                                    ),
                                  ),
                                  Expanded(
                                    child: CommonButton(
                                      child: Text('Нет'),
                                      onPressed: () {
                                        setState(() {
                                          notPregnant = true;
                                          isPregnant = false;
                                        });
                                      },
                                      margin: EdgeInsets.only(
                                        top: height * .95,
                                        left: width * 1,
                                        bottom: height * 1.9,
                                      ),
                                      backgroundColor: Styles.k_white_color,
                                      foregroundColor: Styles.k_main_color,
                                      disabled: notPregnant,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        : const SizedBox.shrink(),

                    //PregnantWomen
                    isPregnant
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Выберите неделю",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0,
                                          height * .95,
                                          width * 2.04,
                                          height * 1.9),
                                      child: SizedBox(
                                        height: height * 5.33,
                                        child: OutlinedButton(
                                          // Display a CupertinoDatePicker in date picker mode.
                                          onPressed: () {
                                            showDatePickerDialog(
                                              CupertinoPicker(
                                                itemExtent: 40,
                                                children: items
                                                    .map((item) => Center(
                                                          child: Text(
                                                              item.toString() +
                                                                  ' недель'),
                                                        ))
                                                    .toList(),
                                                onSelectedItemChanged: (index) {
                                                  setState(
                                                      () => this.index = index);
                                                },
                                              ),
                                              context,
                                            );
                                          },
                                          child: Text(
                                            '${items[index]} недель',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium,
                                          ),

                                          style: OutlinedButton.styleFrom(
                                            padding: EdgeInsets.only(
                                              left: width * 2.56,
                                              right: width * 1.28,
                                            ),
                                            backgroundColor:
                                                Styles.k_white_color,
                                            side: const BorderSide(
                                                color: Styles.k_white_color),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(29),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: SizedBox(),
                                  )
                                ],
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),

                    //City
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, height * 0.95),
                      child: SizedBox(
                        width: double.infinity,
                        height: height * 5.33,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              width * 1.128, 0, width * 10.25, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29),
                            color: Styles.k_white_color,
                          ),
                          child: BlocProvider(
                            create: (_) => CountryBloc(
                                RepositoryProvider.of<AuthorizationProvider>(
                                    context))
                              ..add(GetCountryEvent()),
                            child: BlocBuilder<CountryBloc, CountryState>(
                              builder: (context, state) {
                                if (state is CountryStateInitial) {
                                  return _buildLoading();
                                } else if (state is CountryStateLoading) {
                                  return _buildLoading();
                                } else if (state is CountryStateLoaded) {
                                  String? country_value =
                                      "г. ${state.country_dto[0].cities?.elementAt(0).title}, ${state.country_dto[0].title}";
                                  List<CountryDto> country_dto =
                                      state.country_dto;
                                  return ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: country_value,
                                        menuMaxHeight: 400,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down_rounded),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                        borderRadius: BorderRadius.circular(29),
                                        onChanged: (String? value) {
                                          setState(() {
                                            country_value = value!;
                                            dropdownIndex = country_dto[0]
                                                .cities!
                                                .elementAt(0)
                                                .id!;
                                          });
                                        },
                                        items: country_dto
                                            .map<DropdownMenuItem<String>>(
                                                (CountryDto countryDto) {
                                          return DropdownMenuItem<String>(
                                            value:
                                                "г. ${state.country_dto[0].cities?.elementAt(0).title}, ${state.country_dto[0].title}",
                                            child: Text(
                                                "г. ${state.country_dto[0].cities?.elementAt(0).title}, ${state.country_dto[0].title}"),
                                          );
                                        }).toList(),
                                        isExpanded: true,
                                        isDense: true,
                                        dropdownColor: Styles.k_white_color,
                                      ),
                                    ),
                                  );
                                } else if (state is CountryStateError) {
                                  return Container();
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                    //MedDataContainer
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, height * 0.95, 0, height * 1.9),
                      child: SizedBox(
                        height: height * 5.33,
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              isExpandedForAdditionalData =
                                  !isExpandedForAdditionalData;
                            });
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Заполнить медицинские данные',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              Icon(
                                isExpandedForAdditionalData
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                color: isExpandedForAdditionalData
                                    ? Styles.k_main_color
                                    : Styles.k_black_color,
                              ),
                            ],
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.only(
                                left: width * 5.128, right: width * 6),
                            backgroundColor: Styles.k_white_color,
                            side: const BorderSide(color: Styles.k_white_color),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(29),
                            ),
                          ),
                        ),
                      ),
                    ),

                    //Additional med data
                    isExpandedForAdditionalData
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Text(
                              //   "Вредные привычки?",
                              //   style:
                              //       Theme.of(context).textTheme.displayMedium,
                              // ),
                              // SizedBox(
                              //   height: 15,
                              // ),
                              Text(
                                "Если у вас есть вредные привычки и перечисленных, выберите их",
                                style: TextStyle(
                                  color: Styles.k_black_color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                              CommonButton(
                                margin: EdgeInsets.only(
                                    top: height * .95, bottom: height * .95),
                                child: Text('Алкоголь'),
                                hasIconMiniButton: true,
                                icon: Icon(Icons.add_outlined),
                                backgroundColor: Styles.k_white_color,
                                foregroundColor: Styles.k_main_color,
                                onPressed: () {},
                              ),
                              CommonButton(
                                margin: EdgeInsets.only(bottom: height * .95),
                                child: Text('Курение'),
                                hasIconMiniButton: true,
                                icon: Icon(Icons.add_outlined),
                                backgroundColor: Styles.k_white_color,
                                foregroundColor: Styles.k_main_color,
                              ),
                              CommonButton(
                                margin: EdgeInsets.only(bottom: height * .95),
                                child: Text('Лекарственные препараты'),
                                hasIconMiniButton: true,
                                icon: Icon(Icons.add_outlined),
                                backgroundColor: Styles.k_white_color,
                                foregroundColor: Styles.k_main_color,
                              ),
                              CommonButton(
                                margin: EdgeInsets.only(bottom: height * .95),
                                child: Text('Фаст-фуд'),
                                hasIconMiniButton: true,
                                icon: Icon(Icons.add_outlined),
                                backgroundColor: Styles.k_white_color,
                                foregroundColor: Styles.k_main_color,
                              ),
                              CommonButton(
                                margin: EdgeInsets.only(bottom: height * 1.9),
                                child: Text('Наркотические вещества'),
                                hasIconMiniButton: true,
                                icon: Icon(Icons.add_outlined),
                                backgroundColor: Styles.k_white_color,
                                foregroundColor: Styles.k_main_color,
                              ),
                              // Text(
                              //   "Какой образ жизни вы ведете?",
                              //   style: TextStyle(
                              //     color: Styles.k_black_color,
                              //     fontWeight: FontWeight.w600,
                              //     fontSize: 16,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 15,
                              // ),
                              // Text(
                              //   "Выберите из перечисленных максимально подходящий",
                              //   style: TextStyle(
                              //     color: Styles.k_black_color,
                              //     fontWeight: FontWeight.w500,
                              //     fontSize: 12,
                              //   ),
                              // ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     CommonButton(
                              //       margin: EdgeInsets.only(top: 8, bottom: 8),
                              //       child: Text('Полу-активный'),
                              //       hasIconMiniButton: true,
                              //       backgroundColor: Styles.k_white_color,
                              //       foregroundColor: Styles.k_main_color,
                              //       onPressed: () {},
                              //     ),
                              //     CommonButton(
                              //       margin: EdgeInsets.only(bottom: 8, top: 8),
                              //       child: Text('Активный'),
                              //       hasIconMiniButton: true,
                              //       backgroundColor: Styles.k_white_color,
                              //       foregroundColor: Styles.k_main_color,
                              //     ),
                              //   ],
                              // ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     CommonButton(
                              //       margin: EdgeInsets.only(bottom: 16),
                              //       child: Text('Полу-пассивный'),
                              //       hasIconMiniButton: true,
                              //       backgroundColor: Styles.k_white_color,
                              //       foregroundColor: Styles.k_main_color,
                              //     ),
                              //     CommonButton(
                              //       margin: EdgeInsets.only(bottom: 16),
                              //       child: Text('Пассивный'),
                              //       hasIconMiniButton: true,
                              //       backgroundColor: Styles.k_white_color,
                              //       foregroundColor: Styles.k_main_color,
                              //     ),
                              //   ],
                              // ),
                              // Text(
                              //   "Вид деятельности которым Вы занимаетесь?",
                              //   style: TextStyle(
                              //     color: Styles.k_black_color,
                              //     fontWeight: FontWeight.w600,
                              //     fontSize: 16,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 15,
                              // ),
                              // Text(
                              //   "Выберите из перечисленных максимально подходящий",
                              //   style: TextStyle(
                              //     color: Styles.k_black_color,
                              //     fontWeight: FontWeight.w500,
                              //     fontSize: 12,
                              //   ),
                              // ),
                              // CommonButton(
                              //   margin: EdgeInsets.only(top: 8, bottom: 8),
                              //   child: Text('Офисный работник'),
                              //   hasIconMiniButton: true,
                              //   backgroundColor: Styles.k_white_color,
                              //   foregroundColor: Styles.k_main_color,
                              //   onPressed: () {},
                              // ),
                              // CommonButton(
                              //   margin: EdgeInsets.only(bottom: 16),
                              //   child: Text('Физический труд'),
                              //   hasIconMiniButton: true,
                              //   backgroundColor: Styles.k_white_color,
                              //   foregroundColor: Styles.k_main_color,
                              // ),
                              // Text(
                              //   "Были ли у Ваших близких родственников какие-либо заболевания, о которым Вы хотели бы упомянуть?",
                              //   style: TextStyle(
                              //     color: Styles.k_black_color,
                              //     fontWeight: FontWeight.w600,
                              //     fontSize: 16,
                              //   ),
                              // ),
                              // Row(
                              //   children: [
                              //     Expanded(
                              //       child: CommonButton(
                              //         child: Text('Да'),
                              //         onPressed: () {
                              //           setState(() {});
                              //         },
                              //         margin: EdgeInsets.only(
                              //             top: 8, right: 10, bottom: 16),
                              //         backgroundColor: Styles.k_white_color,
                              //         foregroundColor: Styles.k_main_color,
                              //       ),
                              //     ),
                              //     Expanded(
                              //       child: CommonButton(
                              //         child: Text('Нет'),
                              //         onPressed: () {
                              //           setState(() {});
                              //         },
                              //         margin: EdgeInsets.only(
                              //             top: 8, left: 10, bottom: 16),
                              //         backgroundColor: Styles.k_white_color,
                              //         foregroundColor: Styles.k_main_color,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: CommonButton(
                  margin: EdgeInsets.only(
                    top: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                  ),
                  child: Text('Сохранить'),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.system);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    heightController.dispose();
    weightController.dispose();
    surnameController.dispose();
  }
}
