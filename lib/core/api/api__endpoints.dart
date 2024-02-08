class ApiEndpoints {
  static const host = 'meddata-back.test-nomad.kz/api';
  static const baseUrl = 'https://meddata-back.test-nomad.kz/api';
  static const String withoutApi = 'https://meddata-back.test-nomad.kz/';
  //static const baseUrl = 'http://127.0.0.1:8000/api';

  static const String login = '/V1/get-well/login';
  static const String register = '/V1/get-well/register';
  static const String getUserData = '/api/user';
  static const String getBadaHabits = '/V1/bad-habits';
  static const String getLifeStyles = '/V1/lifestyles';
  static const String getFAQs = '/V1/faqs';
  static const String getPrivacyPolicy = '/V1/policy';
  static const String getCountry = '/V1/countries';
}
