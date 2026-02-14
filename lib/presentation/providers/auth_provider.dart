import 'dart:async';
import 'package:flutter/material.dart';
import '../../domain/entities/otp_request.dart';
import '../../domain/usecases/send_otp.dart';
import '../../domain/usecases/verify_otp.dart';
import 'dart:math';


class AuthProvider extends ChangeNotifier {
  String? _lastSentOtp;
  final SendOtp sendOtpUseCase;
  final VerifyOtp verifyOtpUseCase;

  AuthProvider({
    required this.sendOtpUseCase,
    required this.verifyOtpUseCase,
  });

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  bool loading = false;
  bool canResend = false;
  int secondsRemaining = 60;
  Timer? _timer;

// baraye gozashtan 0 dar textfield phone
  bool isValidPhone() {
    final phone = phoneController.text;
    return phone.startsWith('0') && phone.length == 11;
  }


  // in function baraye ersal otp mibashad baraye code verify be shomare telephone :)
  Future<bool> sendOtp() async {

    if(!isValidPhone()){
      throw Exception('invalid phone number');
    }

    loading = true;
    notifyListeners();


    final otpCode = _generateOtp();
    _lastSentOtp = otpCode;

 //baraye ersal code be shomare telephone :0
    try {
      await sendOtpUseCase(
        OtpRequest(
          mobile: phoneController.text,
          code: otpCode,
          template: 1,
        ),
      );
      _startTimer();
      return true;
    } catch (_) {
      return false;
    } finally {
      loading = false;
      notifyListeners();
    }
  }






 // timer reset shodan code verify baraye bar mojadad
  void _startTimer() {
    secondsRemaining = 60;
    canResend = false;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining == 0) {
        canResend = true;
        timer.cancel();
      } else {
        secondsRemaining--;
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    otpController.dispose();
    _timer?.cancel();
    super.dispose();
  }


  // baraye random kardan code otp like random
  String _generateOtp() {
    final random = Random();
    return (100000 + random.nextInt(900000)).toString();
  }
// baraye
  Future<bool> verifyOtp() async {
    return otpController.text == _lastSentOtp;
  }

}
