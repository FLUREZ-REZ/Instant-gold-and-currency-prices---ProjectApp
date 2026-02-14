class OtpRequest {
  final String mobile;
  final String code;
  final int template;

  OtpRequest({
    required this.mobile,
    required this.code,
    required this.template,
  });
}
