import '../../domain/entities/otp_request.dart';

class OtpRequestModel extends OtpRequest {
  OtpRequestModel({
    required super.mobile,
    required super.code,
    required super.template,
  });

  Map<String, dynamic> toJson() => {
    "mobile": mobile,
    "code": code,
    "template": template,
  };
}
