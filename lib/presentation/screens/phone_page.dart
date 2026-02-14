import 'package:flutter/material.dart';
import 'package:goldapp/core/app_strings.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/locale_provider.dart';
import 'otp_page.dart';

class PhonePage extends StatelessWidget {
  const PhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final isFa = context.watch<LocaleProvider>().isPersian;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(51, 54, 61, 1),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(onPressed: (){
                context.read<LocaleProvider>().toggleLocale();
              }, icon: Icon(Icons.language , color: Colors.white, size: 30,)),
            )
          ],
        ),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color.fromRGBO(51, 54, 61, 1),
              child: Column(
                children: [
          
                  Image.asset("assets/mlogo.png"),
                  const SizedBox(height: 60),
                  Text(AppStrings.of('Login/signup', isFa) , style: TextStyle(color: Colors.white70 , fontSize: 20 , fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 + 70,
                    child: TextField(
                      onChanged: (value){
                        if(value.isNotEmpty && !value.startsWith('0')){
                          auth.phoneController.text = '0';
                          auth.phoneController.selection =  TextSelection.fromPosition(TextPosition(offset: 1));
                        }
                      },
                      cursorColor: Colors.orange,
                      style: TextStyle(fontSize: 15 , color: Colors.white ,),
                      controller: auth.phoneController,
                      keyboardType: TextInputType.phone,
                      maxLength: 11,
                      decoration:  InputDecoration(
                          labelStyle: TextStyle(color: Colors.white38),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white10)
                        ),
                          labelText: AppStrings.of('Phone Number', isFa) ,
                          suffixIcon: Icon(Icons.star ,
                            color: Colors.red, size: 9,)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 + 70,
                    child: TextField(
                      style: TextStyle(fontSize: 15 , color: Colors.white),
          
                      decoration:  InputDecoration(
                        labelStyle: TextStyle(color: Colors.white38),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white10)
                        ),
                        labelText: AppStrings.of('Email not Required', isFa) , ),
                    ),
                  ),
          
                  const SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 + 70,
                    height: 57 ,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.white30),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      onPressed: auth.loading
                          ? null
                          : () async {
                        try{
                        final success = await auth.sendOtp();
                        if (success) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const OtpPage()),
                          );
                        }
                      } catch (_) {ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("The phone number is invalid")));}},
                      child: auth.loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          :  Text(AppStrings.of('login', isFa)),

                    ),
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
