import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/secure_storage.dart';
import '../models/otp_request_model.dart';

class AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSource(this.client);

  Future<void> sendOtp(OtpRequestModel model) async {
    final token = await SecureStorage.getToken();

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await client.post(
      Uri.parse('https://s.api.ir/api/sw1/SmsOTP'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Send OTP failed');
    }
  }
}

