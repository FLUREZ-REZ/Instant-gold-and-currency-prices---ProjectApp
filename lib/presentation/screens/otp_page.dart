import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldapp/core/app_strings.dart';
import 'package:goldapp/presentation/screens/phone_page.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/locale_provider.dart';
import 'home_page.dart';
import 'main_page.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final List<TextEditingController> _controllers =
  List.generate(6, (_) => TextEditingController());

  final List<FocusNode> _focusNodes =
  List.generate(6, (_) => FocusNode());

  void _onOtpChanged(BuildContext context) {
    final auth = context.read<AuthProvider>();

    final otp = _controllers.map((c) => c.text).join();
    auth.otpController.text = otp;
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final isFa = context.watch<LocaleProvider>().isPersian;

    return SafeArea(
      child: Scaffold(
      
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color.fromRGBO(51, 54, 61, 1),
              child: Column(
                children: [
          
                  Image.asset('assets/slogo.png'),
          
                  Text('${AppStrings.of('Sent verify code to', isFa)} ${auth.phoneController.text}', style: TextStyle(color: Colors.white , fontSize: 14),),
          
                  const SizedBox(height: 24),
          
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (index) {
                        return SizedBox(
                          width: 45,
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.orangeAccent,
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: const InputDecoration(

                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orangeAccent),
                                  borderRadius: BorderRadius.all(Radius.circular(25))
                              ),
                              counterText: '',
          
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(25))
          
                              ),
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty && index < 5) {
                                _focusNodes[index + 1].requestFocus();
                              }
                              if (value.isEmpty && index > 0) {
                                _focusNodes[index - 1].requestFocus();
                              }
          
                              _onOtpChanged(context);
                            },
                          ),
                        );
                      }),
                    ),
                  ),
          
                  const SizedBox(height: 24),
          
                  Container(
                    width: MediaQuery.of(context).size.width / 2 + 20 ,
                    child: ElevatedButton(
                      onPressed: () async {
                        final isValid = await auth.verifyOtp();
          
                        if (isValid) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const MainPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                              content: Text(AppStrings.of('Verify code is invalid', isFa)),
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.white30)
                      ),
                      child:  Text(AppStrings.of('Verify', isFa) , style: TextStyle(color: Colors.white),),
                    ),
                  ),
          
                  const SizedBox(height: 16),
          
                  auth.canResend
                      ? Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PhonePage()));
                        }, child: Text(AppStrings.of('Change phone ?', isFa)  , style: TextStyle(color: Colors.white70 , fontSize: 12),)),
                        TextButton(
                          onPressed: () async {
                            await auth.sendOtp();
                            for (final c in _controllers) {
                              c.clear();
                            }
                            _focusNodes.first.requestFocus();
                          },
                          child:  Text(AppStrings.of('Resend verify code', isFa) , style: TextStyle(color: Colors.white70 , fontSize: 12),),
                        )
                      ],
                    ),
                  )
                      : Text(
                    '${AppStrings.of('Resend verify code in', isFa)} ${auth.secondsRemaining}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
