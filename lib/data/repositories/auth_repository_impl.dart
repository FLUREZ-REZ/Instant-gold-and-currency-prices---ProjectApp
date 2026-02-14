import '../../domain/entities/otp_request.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/otp_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<void> sendOtp(OtpRequest request) {
    return remote.sendOtp(
      OtpRequestModel(
        mobile: request.mobile,
        code: request.code,
        template: request.template,
      ),
    );
  }

  @override
  Future<bool> verifyOtp(String code) async {

    return code.length == 6;
  }
}
