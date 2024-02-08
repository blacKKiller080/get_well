// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_well/core/blocs/authorization/authorization_bloc.dart';
import 'package:get_well/core/blocs/get_bad_habits/bad_habits_bloc.dart';
import 'package:get_well/core/components/placeholders.dart';
import 'package:get_well/core/helper/navigateable.dart';
import 'package:get_well/core/models/bad_habits_dto.dart';
import 'package:get_well/core/providers/authorization/authorization_provider.dart';
import '../../../core/blocs/get_life_styles/life_styles_bloc.dart';
import '../../../core/components/common_button.dart';
import '../../../core/components/common_input.dart';
import '../../../core/constants/styles.dart';
import '../../../core/models/lifestyles_dto.dart';
import '../../../core/models/registration_data.dart';
import '../../../core/routes/routes.dart';

class FinalRegistration extends StatefulWidget implements Navigateable {
  const FinalRegistration({super.key});

  @override
  State<FinalRegistration> createState() => _FinalRegistrationState();

  @override
  String getName() {
    return Routes.final_registration;
  }
}

class _FinalRegistrationState extends State<FinalRegistration> {
  late final PageController _pageController;

  late AuthorizationBloc _bloc;

  var heightController = TextEditingController();
  var weightController = TextEditingController();

  //Gender
  bool isMan = false;
  bool isWoman = false;
  bool isPregnant = false;
  bool notPregnant = false;
  final pregnancyWeeks = [];
  int pregnancyIndex = 0;

  //WorkStyles
  bool isOfficeWorker = false;
  bool isPhysicalWorker = false;

  bool isExpandedForAdditionalData = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 1,
    );
    _bloc = context.read<AuthorizationBloc>();
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i <= 45; i++) {
      pregnancyWeeks.add(i);
    }
    final registrationRequest =
        ModalRoute.of(context)!.settings.arguments as RegisterData;
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    heightController.text = registrationRequest.height;
    weightController.text = registrationRequest.weight;
    return BlocConsumer<AuthorizationBloc, AuthorizationState>(
      bloc: _bloc,
      listener: (context, state) {
        print('state iss $state');
        if (state is RegistrationLoaded) {
          // context.read<UserBloc>().updateUser(state.user);
          print('success register');
          Navigator.pushReplacementNamed(context, Routes.system);
        } else if (state is RegistrationErrorState) {
          return AlertController.showMessage(
            context: context,
            title: 'error',
            content: state.error,
          );
        }
        //Navigator.pushReplacementNamed(context, Routes.system);
      },
      builder: (context, state) {
        //final isLoading = state is RegistrationLoading;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Styles.k_border_secondary_color,
          appBar: AppBar(
            title: Text('Завершите регистрацию'),
            titleTextStyle: TextStyle(
                color: Styles.k_black_color,
                fontSize: 20,
                fontWeight: FontWeight.w700),
            centerTitle: true,
            backgroundColor: Styles.k_white_color,
            //foregroundColor: Styles.k_black_color,
            toolbarHeight: height * 6.5,
            elevation: 0.0,
            leading: IconButton(
              icon:
                  Icon(Icons.keyboard_arrow_left_outlined, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Styles.k_border_primary_color,
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(23),
              ),
            ),
          ),
          body: SafeArea(
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  height: double.infinity,
                  margin: EdgeInsets.only(
                    left: width * 6.4,
                    right: width * 6.4,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0, height * 1.42, 0, height * 0.95),
                                  height: height * 5.33,
                                  child: Center(
                                    child: Text(
                                      'Заполнить медецинские данные',
                                      style: const TextStyle(
                                        color: Styles.k_black_color,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Styles.k_white_color,
                                    borderRadius: BorderRadius.circular(29),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: height * 1.9),
                                  child: Text(
                                    "данная информация необходима только для более точного анализа болезней",
                                    style: TextStyle(
                                      color: Styles.k_black_color,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(
                                  "Ваши персональные данные",
                                  style: TextStyle(
                                    color: Styles.k_black_color,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                CommonInput(
                                  heightController.text == ''
                                      ? "Ваш рост"
                                      : heightController.text,
                                  margin: EdgeInsets.only(
                                      bottom: height * 1.9, top: height * 1.9),
                                  type: InputType.NUMBER,
                                  customColor: Styles.k_text_secondary_color,
                                  fillColor: Styles.k_white_color,
                                  fontWeight: FontWeight.w600,
                                  controller: heightController,
                                  formatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onChanged: (val) {
                                    registrationRequest.height =
                                        heightController.text;
                                  },
                                  textInputAction: TextInputAction.next,
                                ),
                                CommonInput(
                                  heightController.text == ''
                                      ? "Ваш вес"
                                      : heightController.text,
                                  margin: EdgeInsets.only(bottom: height * 1.9),
                                  type: InputType.NUMBER,
                                  customColor: Styles.k_text_secondary_color,
                                  fillColor: Styles.k_white_color,
                                  controller: weightController,
                                  formatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onChanged: (val) {
                                    registrationRequest.weight =
                                        weightController.text;
                                  },
                                  textInputAction: TextInputAction.done,
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
                                          registrationRequest.gender =
                                              isMan ? 'male' : 'female';
                                        },
                                        margin: EdgeInsets.only(
                                            top: height * .95,
                                            right: width * 1.02,
                                            bottom: height * 1.9),
                                        backgroundColor: Styles.k_white_color,
                                        foregroundColor: Styles.k_main_color,
                                        disabled:
                                            registrationRequest.gender == 'male'
                                                ? true
                                                : false,
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
                                          registrationRequest.gender =
                                              isWoman ? 'female' : 'male';
                                        },
                                        margin: EdgeInsets.only(
                                            top: height * .95,
                                            left: width * 1.02,
                                            bottom: height * 1.9),
                                        backgroundColor: Styles.k_white_color,
                                        foregroundColor: Styles.k_main_color,
                                        disabled: registrationRequest.gender ==
                                                'female'
                                            ? true
                                            : false,
                                      ),
                                    ),
                                  ],
                                ),

                                //GenderWomen
                                isWoman
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                  backgroundColor:
                                                      Styles.k_white_color,
                                                  foregroundColor:
                                                      Styles.k_main_color,
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
                                                    right: width * 1,
                                                    bottom: height * 1.9,
                                                  ),
                                                  backgroundColor:
                                                      Styles.k_white_color,
                                                  foregroundColor:
                                                      Styles.k_main_color,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Выберите неделю",
                                            style: TextStyle(
                                              color: Styles.k_black_color,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
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
                                                            children:
                                                                pregnancyWeeks
                                                                    .map((item) =>
                                                                        Center(
                                                                          child:
                                                                              Text(item.toString() + ' недель'),
                                                                        ))
                                                                    .toList(),
                                                            onSelectedItemChanged:
                                                                (index) {
                                                              setState(() =>
                                                                  this.pregnancyIndex =
                                                                      index);
                                                            },
                                                          ),
                                                          context,
                                                        );
                                                      },
                                                      child: Text(
                                                        '${pregnancyWeeks[pregnancyIndex]} недель',
                                                        style: const TextStyle(
                                                          color: Styles
                                                              .k_black_color,
                                                          fontSize: 16,
                                                        ),
                                                      ),

                                                      style: OutlinedButton
                                                          .styleFrom(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: width *
                                                                    2.56,
                                                                right: width *
                                                                    1.28),
                                                        backgroundColor: Styles
                                                            .k_white_color,
                                                        side: const BorderSide(
                                                            color: Styles
                                                                .k_white_color),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(29),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: SizedBox(),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    : const SizedBox.shrink(),

                                //MedDataContainer
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0, 0, 0, height * 1.9),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Вредные привычки?',
                                            style: const TextStyle(
                                              color: Styles.k_black_color,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Icon(
                                              isExpandedForAdditionalData
                                                  ? Icons
                                                      .keyboard_arrow_up_rounded
                                                  : Icons
                                                      .keyboard_arrow_down_rounded,
                                              color: Styles.k_main_color),
                                        ],
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.only(
                                            left: width * 5.13,
                                            right: width * 3.85),
                                        backgroundColor: Styles.k_white_color,
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

                                //Additional med data
                                isExpandedForAdditionalData
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Если у вас есть вредные привычки и перечисленных, выберите их",
                                            style: TextStyle(
                                              color: Styles.k_black_color,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                          ),
                                          BlocProvider(
                                            create: (_) => BadHabitsBloc(
                                                RepositoryProvider.of<
                                                        AuthorizationProvider>(
                                                    context))
                                              ..add(GetBadHabitsEvent()),
                                            child: BlocBuilder<BadHabitsBloc,
                                                BadHabitsState>(
                                              builder: (context, state) {
                                                if (state is BadHabitsInitial) {
                                                  return _buildLoading();
                                                } else if (state
                                                    is BadHabitsLoading) {
                                                  return _buildLoading();
                                                } else if (state
                                                    is BadHabitsLoaded) {
                                                  List<BadHabitsDto>
                                                      bad_habits_dto =
                                                      state.badHabitsDto;
                                                  return ListView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount:
                                                        bad_habits_dto.length,
                                                    itemBuilder: (_, index) {
                                                      return Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: _buildBadHabitsCard(
                                                            context,
                                                            bad_habits_dto[
                                                                index],
                                                            registrationRequest),
                                                      );
                                                    },
                                                  );
                                                } else if (state
                                                    is BadHabitsError) {
                                                  return Container();
                                                } else {
                                                  return Container();
                                                }
                                              },
                                            ),
                                          ),
                                          // CommonButton(
                                          //   margin: EdgeInsets.only(
                                          //       bottom: 16, top: 8),
                                          //   child:
                                          //       Text('Наркотические вещества'),
                                          //   hasIconMiniButton: true,
                                          //   icon: Icon(Icons.add_outlined),
                                          //   backgroundColor:
                                          //       Styles.k_white_color,
                                          //   foregroundColor:
                                          //       Styles.k_main_color,
                                          //   success: isDrugs,
                                          //   onPressed: () {
                                          //     setState(() {
                                          //       isDrugs = !isDrugs;
                                          //     });
                                          //     if (isDrugs) {
                                          //       registrationRequest.badHabits
                                          //           .add('5');
                                          //     } else {
                                          //       registrationRequest.badHabits
                                          //           .remove('5');
                                          //     }
                                          //   },
                                          // ),
                                        ],
                                      )
                                    : const SizedBox.shrink(),

                                Container(
                                  margin: EdgeInsets.only(top: height * 1.9),
                                  child: Text(
                                    "Какой образ жизни вы ведете?",
                                    style: TextStyle(
                                      color: Styles.k_black_color,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 1.8,
                                ),
                                Text(
                                  "Выберите из перечисленных максимально подходящий",
                                  style: TextStyle(
                                    color: Styles.k_black_color,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                                BlocProvider(
                                  create: (_) => LifeStylesBloc(
                                      RepositoryProvider.of<
                                          AuthorizationProvider>(context))
                                    ..add(GetLifeStylesEvent()),
                                  child: BlocBuilder<LifeStylesBloc,
                                      LifeStylesState>(
                                    builder: (context, state) {
                                      if (state is LifeStylesInitial) {
                                        return _buildLoading();
                                      } else if (state is LifeStylesLoading) {
                                        return _buildLoading();
                                      } else if (state is LifeStylesLoaded) {
                                        List<LifeStylesDto> lifeStylesDto =
                                            state.lifeStylesDto;
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: lifeStylesDto.length,
                                          itemBuilder: (_, index) {
                                            return Align(
                                              alignment: Alignment.centerLeft,
                                              child: _buildLifeStylesCard(
                                                  context,
                                                  lifeStylesDto[index],
                                                  registrationRequest),
                                            );
                                          },
                                        );
                                      } else if (state is BadHabitsError) {
                                        return Container();
                                      } else {
                                        return Container();
                                      }
                                    },
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top: height * 1.9),
                                  child: Text(
                                    "Вид деятельности которым Вы занимаетесь?",
                                    style: TextStyle(
                                      color: Styles.k_black_color,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 1.8,
                                ),
                                Text(
                                  "Выберите из перечисленных максимально подходящий",
                                  style: TextStyle(
                                    color: Styles.k_black_color,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonButton(
                                      margin: EdgeInsets.only(
                                          top: height * .95,
                                          bottom: height * .95),
                                      child: Text('Офисный работник'),
                                      hasIconMiniButton: true,
                                      backgroundColor: Styles.k_white_color,
                                      foregroundColor: Styles.k_main_color,
                                      success: registrationRequest.officeWorker,
                                      onPressed: () {
                                        setState(() {
                                          isOfficeWorker = !isOfficeWorker;
                                          registrationRequest.officeWorker =
                                              isOfficeWorker;
                                        });
                                      },
                                    ),
                                    CommonButton(
                                      margin:
                                          EdgeInsets.only(bottom: height * 1.9),
                                      child: Text('Физический труд'),
                                      hasIconMiniButton: true,
                                      backgroundColor: Styles.k_white_color,
                                      foregroundColor: Styles.k_main_color,
                                      success:
                                          registrationRequest.physicalWorker,
                                      onPressed: () {
                                        setState(() {
                                          isPhysicalWorker = !isPhysicalWorker;
                                          registrationRequest.physicalWorker =
                                              isPhysicalWorker;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Text(
                                  "Были ли у Ваших близких родственников какие-либо заболевания, о которым Вы хотели бы упомянуть?",
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
                                          setState(() {});
                                        },
                                        margin: EdgeInsets.only(
                                          top: height * .95,
                                          right: 2.56,
                                          bottom: height * 9,
                                        ),
                                        backgroundColor: Styles.k_white_color,
                                        foregroundColor: Styles.k_main_color,
                                      ),
                                    ),
                                    Expanded(
                                      child: CommonButton(
                                        child: Text('Нет'),
                                        onPressed: () {
                                          setState(() {});
                                        },
                                        margin: EdgeInsets.only(
                                          top: height * .95,
                                          right: 2.56,
                                          bottom: height * 9,
                                        ),
                                        backgroundColor: Styles.k_white_color,
                                        foregroundColor: Styles.k_main_color,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Text(
                      //     ' ${registrationRequest.badHabits}, ${registrationRequest.height},${registrationRequest.weight}, ${registrationRequest.lifeStyles},${registrationRequest.officeWorker},${registrationRequest.physicalWorker},${registrationRequest.gender}'),
                      CommonButton(
                        margin: EdgeInsets.only(
                          top: height * 83,
                          bottom: height * 1.9,
                        ),
                        child: Text('Завершить'),
                        onPressed: () {
                          _bloc.registration(
                            firstName: registrationRequest.firstName,
                            badHabits: registrationRequest.badHabits,
                            birthDate: registrationRequest.birthDate,
                            city: registrationRequest.city,
                            email: registrationRequest.email,
                            gender: registrationRequest.gender,
                            height: registrationRequest.height,
                            lastName: registrationRequest.lastName,
                            lifeStyles: registrationRequest.lifeStyles,
                            nickname: registrationRequest.nickname,
                            officeWorker: registrationRequest.officeWorker,
                            password: registrationRequest.password,
                            phone: registrationRequest.phone,
                            physicalWorker: registrationRequest.physicalWorker,
                            weight: registrationRequest.weight,
                            //image: registrationRequest.image,
                          );
                          // Navigator.pushNamed(context, Routes.system);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ); //
      },
    );
  }

  Widget _buildBadHabitsCard(BuildContext context, BadHabitsDto? model,
      RegisterData registrationRequest) {
    return CommonButton(
      margin:
          EdgeInsets.only(top: MediaQuery.of(context).size.height / 100 * .95),
      child: Text('${model!.title}'),
      hasIconMiniButton: true,
      icon: Icon(Icons.add_outlined),
      backgroundColor: Styles.k_white_color,
      foregroundColor: Styles.k_main_color,
      success: registrationRequest.badHabits.contains('${model.id!}'),
      onPressed: () {
        setState(() {
          if (!registrationRequest.badHabits.contains('${model.id!}')) {
            registrationRequest.badHabits.add('${model.id!}');
          } else {
            registrationRequest.badHabits.remove('${model.id!}');
          }
        });
      },
    );
  }

  Widget _buildLifeStylesCard(BuildContext context, LifeStylesDto? model,
      RegisterData registrationRequest) {
    return CommonButton(
      margin:
          EdgeInsets.only(top: MediaQuery.of(context).size.height / 100 * .95),
      child: Text('${model!.title}'),
      hasIconMiniButton: true,
      icon: Icon(Icons.add_outlined),
      backgroundColor: Styles.k_white_color,
      foregroundColor: Styles.k_main_color,
      success: registrationRequest.lifeStyles.contains('${model.id!}'),
      onPressed: () {
        setState(() {
          if (!registrationRequest.lifeStyles.contains('${model.id!}')) {
            registrationRequest.lifeStyles.add('${model.id!}');
          } else {
            registrationRequest.lifeStyles.remove('${model.id!}');
          }
        });
      },
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    heightController.dispose();
    weightController.dispose();
  }
}
