import '../entities/otp_request.dart';

abstract class AuthRepository {
  Future<void> sendOtp(OtpRequest request);
  Future<bool> verifyOtp(String code);
}
