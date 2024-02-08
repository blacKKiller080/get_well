import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_well/core/api/api__endpoints.dart';
import 'package:get_well/core/blocs/privacy/privacy_bloc.dart';
import 'package:get_well/core/models/privacy_policy_dto.dart';
import '../../../../../core/components/common_button.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/helper/navigateable.dart';
import '../../../../../core/providers/authorization/authorization_provider.dart';
import '../../../../../core/routes/routes.dart';
import 'package:http/http.dart' as http;

class PrivacyPolicyScreen extends StatefulWidget implements Navigateable {
  @override
  String getName() {
    return Routes.privacy_policy_screen;
  }

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  void initState() {
    super.initState();
  }

  String textFormFile = '';

  // getData() async {
  //   String response;
  //   response = await rootBundle.loadString('assets/docs/privacy.txt');
  //   setState(() {
  //     textFormFile = response;
  //   });
  // }

  // getDataFromUrl(PrivacyDto privacyDto) async {
  //   String response;
  //   response =
  //       await http.read(Uri.parse(ApiEndpoints.withoutApi + privacyDto.path!));
  //   setState(() {
  //     textFormFile = response;
  //   });
  // }

  // clear() {
  //   setState(() {
  //     textFormFile = '';
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      backgroundColor: Styles.k_border_secondary_color,
      appBar: AppBar(
        title: Container(
          width: width * 66.34,
          child: Text(
            'Политика конфиденциальности',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        titleTextStyle: TextStyle(
          color: Styles.k_black_color,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        titleSpacing: 0,
        elevation: 0.0,
        toolbarHeight: height * 8,
        backgroundColor: Styles.k_white_color,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left_outlined,
              color: Colors.black),
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
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: width * 4.1, vertical: height * 1.9),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 4.1, vertical: height * 1.9),
                decoration: BoxDecoration(
                  color: Styles.k_white_color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocProvider(
                      create: (_) => PrivacyBloc(
                          RepositoryProvider.of<AuthorizationProvider>(context))
                        ..add(GetPrivacyEvent()),
                      child: BlocBuilder<PrivacyBloc, PrivacySate>(
                        builder: (context, state) {
                          if (state is PrivacySateInitial) {
                            return _buildLoading();
                          } else if (state is PrivacySateLoading) {
                            return _buildLoading();
                          } else if (state is PrivacySateLoaded) {
                            PrivacyDto privacyDto = state.privacy_policy_dto;
                            textFormFile = state.privacyText;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  textFormFile,
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.35,
                                  ),
                                ),
                                // ElevatedButton(
                                //   onPressed: () {
                                //     getData();
                                //   },
                                //   child: Text('Get data from local file'),
                                // ),
                                // ElevatedButton(
                                //   onPressed: () {
                                //     getDataFromUrl(privacyDto);
                                //   },
                                //   child: Text(ApiEndpoints.withoutApi +
                                //       privacyDto.path!),
                                // ),
                                // ElevatedButton(
                                //   onPressed: () async {
                                // print(await http.read(Uri.parse(
                                //     ApiEndpoints.withoutApi +
                                //         privacyDto.path!)));
                                //     clear();
                                //   },
                                //   child: Text('Clear'),
                                // ),
                              ],
                            );
                          } else if (state is PrivacySateError) {
                            return Container();
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              CommonButton(
                child: Text(
                  'Ок',
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                margin: EdgeInsets.symmetric(vertical: height * 1.9),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() => Container(child: CircularProgressIndicator());
}
