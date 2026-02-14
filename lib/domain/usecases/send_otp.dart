import '../entities/otp_request.dart';
import '../repositories/auth_repository.dart';

class SendOtp {
  final AuthRepository repository;

  SendOtp(this.repository);

  Future<void> call(OtpRequest request) {
    return repository.sendOtp(request);
  }
}
