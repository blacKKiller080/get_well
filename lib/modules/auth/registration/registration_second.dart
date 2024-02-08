// ignore_for_file: prefer_const_constructors

import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_well/core/blocs/country/country_bloc.dart';
import 'package:get_well/core/components/placeholders.dart';
import 'package:get_well/core/helper/navigateable.dart';
import 'package:get_well/core/models/country_dto.dart';
import 'package:get_well/core/models/registration_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../core/components/common_button.dart';
import '../../../core/components/common_input.dart';
import '../../../core/constants/styles.dart';
import '../../../core/helper/input_helper.dart';
import 'package:intl/intl.dart';
import '../../../core/providers/authorization/authorization_provider.dart';
import '../../../core/routes/routes.dart';

class RegistrationSecond extends StatefulWidget implements Navigateable {
  const RegistrationSecond({super.key});

  @override
  State<RegistrationSecond> createState() => _RegistrationSecondState();

  @override
  String getName() {
    return Routes.registration_second;
  }
}

class _RegistrationSecondState extends State<RegistrationSecond> {
  final _formKey = GlobalKey<FormState>();

  MaskTextInputFormatter formatter = InputHelper.maskTextInputFormatter();

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var cityController = TextEditingController();
  var surnameController = TextEditingController();

  DateTime date = DateTime.now();
  static final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  static const List<String> list = <String>['Astana', 'Almaty', 'Taraz'];
  int dropdownIndex = 0;
  String dropdownValue = list.first;

  XFile image = XFile('');
  XFile selectedImage = XFile('');

  Future<XFile?> getImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return XFile('');
    }

    setState(() {
      selectedImage = pickedFile;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    final registrationRequest =
        ModalRoute.of(context)!.settings.arguments as RegisterData;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Styles.k_border_secondary_color,
      appBar: AppBar(
        title: Text('Привет!'),
        titleTextStyle: TextStyle(
            color: Styles.k_black_color,
            fontSize: 20,
            fontWeight: FontWeight.w700),
        centerTitle: true,
        backgroundColor: Styles.k_white_color,
        toolbarHeight: height * 6.5,
        elevation: 0.0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Styles.k_border_primary_color,
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(23),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: width * 6.4,
            right: width * 6.4,
            top: height * 3,
            bottom: height * .6,
          ),
          child: Form(
            // key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Регистрация",
                          style: TextStyle(
                            color: Styles.k_black_color,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              registrationRequest.nickname,
                              style: TextStyle(
                                color: Styles.k_main_color,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              iconSize: 16,
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              onPressed: () {},
                              icon:
                                  SvgPicture.asset('assets/image/svg/pen.svg'),
                            ),
                          ],
                        )
                      ],
                    ),
                    Image.asset(
                      'assets/image/png/registration_on.png',
                      height: height * 5.14,
                      width: width * 16.5,
                    ),
                  ],
                ),
                // Text(
                //     ' ${registrationRequest.badHabits}, ${registrationRequest.height},${registrationRequest.weight}, ${registrationRequest.lifeStyles},${registrationRequest.officeWorker},${registrationRequest.physicalWorker},${registrationRequest.gender}'),

                CommonInput(
                  "Ваше имя",
                  margin:
                      EdgeInsets.only(bottom: height * 1.9, top: height * 3),
                  type: InputType.TEXT,
                  customColor: Styles.k_text_secondary_color,
                  fillColor: Styles.k_white_color,
                  controller: nameController,
                  onChanged: (val) {},
                  textInputAction: TextInputAction.next,
                ),
                CommonInput(
                  "Ваша фамилия",
                  margin: EdgeInsets.only(bottom: height * 1.9),
                  type: InputType.TEXT,
                  customColor: Styles.k_text_secondary_color,
                  fillColor: Styles.k_white_color,
                  controller: surnameController,
                  onChanged: (val) {},
                  textInputAction: TextInputAction.next,
                ),
                CommonInput(
                  "Ваша почта",
                  margin: EdgeInsets.only(bottom: height * 1.9),
                  type: InputType.EMAIL,
                  customColor: Styles.k_text_secondary_color,
                  fillColor: Styles.k_white_color,
                  controller: emailController,
                  onChanged: (val) {},
                  textInputAction: TextInputAction.next,
                ),
                CommonInput(
                  "Ваш номер",
                  margin: EdgeInsets.only(bottom: height * 1.9),
                  type: InputType.PHONE,
                  customColor: Styles.k_text_secondary_color,
                  fillColor: Styles.k_white_color,
                  controller: phoneController,
                  formatters: [formatter],
                  textInputAction: TextInputAction.next,
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, height * 0.95),
                  child: SizedBox(
                    width: double.infinity,
                    height: height * 5.21,
                    child: DecoratedBox(
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
                                  "г.${state.country_dto[0].cities?.elementAt(0).title}, ${state.country_dto[0].title}";
                              List<CountryDto> country_dto = state.country_dto;
                              return ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: country_value,
                                    menuMaxHeight: 400,
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_rounded),
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
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
                                            "г.${state.country_dto[0].cities?.elementAt(0).title}, ${state.country_dto[0].title}",
                                        child: Text(
                                            "г.${state.country_dto[0].cities?.elementAt(0).title}, ${state.country_dto[0].title}"),
                                      );
                                    }).toList(),
                                    isExpanded: true,
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
                Container(
                  margin: EdgeInsets.only(
                    top: height * 0.95,
                    bottom: height * 1.9,
                  ),
                  padding: EdgeInsets.only(
                    left: width * 5.13,
                    right: width * 5.13,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 5),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            // 'Загрузите фото',
                            // style: Theme.of(context).textTheme.labelMedium,
                            selectedImage.name == ''
                                ? 'Загрузите фото'
                                : selectedImage.name,
                            style: TextStyle(
                              color: selectedImage.name == ''
                                  ? Styles.k_text_secondary_color
                                  : Styles.k_black_color,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: SvgPicture.asset(
                          "assets/image/svg/upload_photo.svg",
                        ),
                      ),
                    ],
                  ),
                ),

                CommonButton(
                  margin: EdgeInsets.only(
                    top: height * 0.95,
                    bottom: height * 1.9,
                  ),
                  contentPaddingHorizontal: 5.13,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      // 'Загрузите фото',
                      // style: Theme.of(context).textTheme.labelMedium,
                      selectedImage.name == ''
                          ? 'Загрузите фото'
                          : selectedImage.name,
                      style: TextStyle(
                        color: selectedImage.name == ''
                            ? Styles.k_text_secondary_color
                            : Styles.k_black_color,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  hasDownIcon: true,
                  icon: SvgPicture.asset("assets/image/svg/upload_photo.svg"),
                  foregroundColor: Styles.k_black_color,
                  backgroundColor: Styles.k_white_color,
                  onPressed: () {
                    getImage();
                  },
                ),
                //Text('${registrationRequest.image.name},'),

                //Photo
                // Container(
                //   margin: EdgeInsets.only(top: 8, bottom: 16),
                //   child: TextButton(
                //     onPressed: () async {
                //       XFile? image = await ImagePicker()
                //           .pickImage(source: ImageSource.gallery);
                //       setState(() {
                //         registrationRequest.image = image!;
                //       });
                //     },
                //     child: Container(
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             "Загрузите фото",
                //             style: TextStyle(
                //               color: Styles.k_text_secondary_color,
                //               fontSize: 16,
                //             ),
                //           ),
                //           Icon(Icons.cloud_upload_outlined)
                //         ],
                //       ),
                //       width: double.infinity,
                //       padding: EdgeInsets.only(right: 20, left: 20),
                //     ),
                //     style: ButtonStyle(
                //       backgroundColor:
                //           MaterialStateProperty.all(Styles.k_white_color),
                //       foregroundColor:
                //           MaterialStateProperty.all(Styles.k_black_color),
                //       shape: MaterialStateProperty.all(
                //         RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(29),
                //         ),
                //       ),
                //       textStyle: MaterialStateProperty.all(
                //         TextStyle(),
                //       ),
                //       padding: MaterialStateProperty.all(
                //         EdgeInsets.symmetric(
                //           vertical: 12,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                //Date
                Text(
                  "Дата рождения",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          height * 0.95,
                          width * 1.022,
                          height * 1.9,
                        ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // In this example, the date is formatted manually. You can
                                // use the intl package to format the value based on the
                                // user's locale settings.
                                Text(
                                  '${date.day}',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
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
                              side:
                                  const BorderSide(color: Styles.k_white_color),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // In this example, the date is formatted manually. You can
                                // use the intl package to format the value based on the
                                // user's locale settings.
                                Text(
                                  '${DateFormat.LLLL().format(date)}',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
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
                              side:
                                  const BorderSide(color: Styles.k_white_color),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // In this example, the date is formatted manually. You can
                                // use the intl package to format the value based on the
                                // user's locale settings.
                                Text(
                                  '${date.year}',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
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
                              side:
                                  const BorderSide(color: Styles.k_white_color),
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

                CommonButton(
                  margin: EdgeInsets.only(),
                  child: Text('Далее'),
                  onPressed: () {
                    registrationRequest.firstName = nameController.text;
                    registrationRequest.lastName = surnameController.text;
                    registrationRequest.email = emailController.text;
                    registrationRequest.phone = formatter.getUnmaskedText();
                    registrationRequest.city = dropdownIndex.toString();
                    registrationRequest.birthDate = dateFormat.format(date);

                    Navigator.pushNamed(context, Routes.final_registration,
                        arguments: registrationRequest
                        // RegistrationEvent(
                        //   registrationRequest.firstName,
                        //   registrationRequest.lastName,
                        //   registrationRequest.email,
                        //   registrationRequest.phone,
                        //   registrationRequest.city,
                        //   registrationRequest.birthDate,
                        //   registrationRequest.nickname,
                        //   registrationRequest.password,
                        //   '',
                        //   '',
                        //   '',
                        //   [],
                        //   [],
                        //   false,
                        //   false,
                        // ),
                        );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

  // Future _getImage() async {
  //   var image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = image;
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    surnameController.dispose();
  }
}
