import '../repositories/auth_repository.dart';
// class verify kardan code ferestade shode va vard shode
class VerifyOtp {
  final AuthRepository repository;

  VerifyOtp(this.repository);

  Future<bool> call(String code) {
    return repository.verifyOtp(code);
  }
}
