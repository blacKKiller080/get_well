import 'package:http/http.dart';

import '../../api/api_response.dart';
import '../../models/user.dart';

class AuthorizationResponse extends ApiResponse {
  final User? user;
  const AuthorizationResponse(
      {this.user,
      bool isSuccess = false,
      int? statusCode,
      Response? response,
      String? error})
      : super(
            isSuccess: isSuccess,
            statusCode: statusCode,
            response: response,
            error: error);
}
