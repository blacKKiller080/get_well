import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get_well/core/models/bad_habits_dto.dart';
import 'package:get_well/core/models/country_dto.dart';
import 'package:get_well/core/models/faq_dto.dart';
import 'package:get_well/core/models/privacy_policy_dto.dart';
import 'package:http/http.dart';
import 'dart:async';
import '../../api/api.dart';
import 'package:http/http.dart' as http;
import '../../api/api__endpoints.dart';
import '../../models/lifestyles_dto.dart';
import '../../models/user.dart';
import '../app_providers/app_provider.dart';
import 'authorization_response.dart';

class AuthorizationProvider extends AppProvider {
  Future<AuthorizationResponse> login(String login, String password) async {
    final response = await api.request(
      route: Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.login),
      method: Method.post,
      params: {'login': login, 'password': password},
    );

    return AuthorizationResponse(
      isSuccess: response.isSuccess,
      statusCode: response.statusCode,
      response: response.response,
      user: response.isSuccess
          ? await compute(_parseUser, response.response?.bodyBytes)
          : null,
      error: response.isSuccess ? null : response.error,
    );
  }

  User? _parseUser(Uint8List? bodyBytes) {
    if (bodyBytes?.isEmpty ?? true) return null;
    try {
      final rawJson =
          jsonDecode(utf8.decode(bodyBytes!)) as Map<String, dynamic>;
      return User.fromMap(rawJson['data'])
          .copyWith(token: rawJson['data']['access_token']);
    } catch (e) {
      debugPrint('Unable to parse user: $e');
      return null;
    }
  }

  Future<AuthorizationResponse> registration(
    String firstName,
    String lastName,
    String email,
    String phone,
    String city,
    String birthDate,
    //XFile image,
    String nickname,
    String password,
    String height,
    String weight,
    String gender,
    List<String> badHabits,
    List<String> lifeStyles,
    bool officeWorker,
    bool physicalWorker,
  ) async {
    final response = await api.request(
      route: Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.register),
      method: Method.post,
      params: {
        "name": firstName,
        "surname": lastName,
        "login": email,
        "contact": phone,
        "city_id": city,
        "birthday": birthDate,
        //"image": image,
        "nickname": nickname,
        "password": password,
        "height": height,
        "weight": weight,
        "gender": gender,
        "bad_habits": badHabits,
        "lifestyles": lifeStyles,
        "office_worker": officeWorker,
        "physical_worker": physicalWorker,
      },
    );

    return AuthorizationResponse(
      isSuccess: response.isSuccess,
      statusCode: response.statusCode,
      response: response.response,
      error: response.isSuccess ? null : response.error,
    );
  }

  Future<List<BadHabitsDto>> getBadHabits() async {
    Response response = await http
        .get(Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.getBadaHabits));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => BadHabitsDto.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<LifeStylesDto>> getLifeStyles() async {
    Response response = await http
        .get(Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.getLifeStyles));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => LifeStylesDto.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<FAQsDto>> getFAQ() async {
    Response response =
        await http.get(Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.getFAQs));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => FAQsDto.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<PrivacyDto> getPrivacyPolicy() async {
    Response response = await http
        .get(Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.getPrivacyPolicy));
    if (response.statusCode == 200) {
      final result = PrivacyDto.fromJson(jsonDecode(response.body)['data']);
      return result;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  getDataFromUrl(PrivacyDto privacyDto) async {
    String response =
        await http.read(Uri.parse(ApiEndpoints.withoutApi + privacyDto.path!));
    return response;
  }

  //  Future<PrivacyDto> getPrivacyPolicy() async {
  //   return PrivacyDto.fromJson(
  //       await http
  //       .get(Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.getPrivacyPolicy)));

  // }

  Future<List<CountryDto>> getCountry() async {
    Response response = await http
        .get(Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.getCountry));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => CountryDto.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
