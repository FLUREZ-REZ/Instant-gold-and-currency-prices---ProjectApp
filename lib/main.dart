import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goldapp/presentation/providers/locale_provider.dart';
import 'package:goldapp/presentation/providers/theme_provider.dart';
import 'package:goldapp/presentation/screens/main_page.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'core/secure_storage.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/usecases/send_otp.dart';
import 'domain/usecases/verify_otp.dart';
import 'presentation/providers/auth_provider.dart';
import 'presentation/screens/phone_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await SecureStorage.saveToken(
      'rj+2/hRiUEKACj/GlIoJDx4yumjZdVtIeDUVbMvhVsxpbEGYG4o3AECOnoaEf09j/xq29U0WQRVxIB+d4YRjHpjzUCTlquw8VyHYHbKQGLY='
  );

  final remote = AuthRemoteDataSource(
    http.Client(),

  );

  final repository = AuthRepositoryImpl(remote);

  runApp(
    MultiProvider(
        providers:  [

          ChangeNotifierProvider(
              create: (_) => ThemeProvider()),

          ChangeNotifierProvider(
            create: (_) => AuthProvider(
              sendOtpUseCase: SendOtp(repository),
              verifyOtpUseCase: VerifyOtp(repository),
  ),
  ),
          ChangeNotifierProvider(
            create: (_) => LocaleProvider(),
  ),
  ],child:  MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final themeProvider = context.watch<ThemeProvider>();
    final locale = context.watch<LocaleProvider>().locale;
    final isFa = locale.languageCode == 'fa';

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,

      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),

      locale: locale,
      home: Directionality(
          textDirection: isFa ? TextDirection.rtl : TextDirection.ltr,
          child: PhonePage()),
    );
  }
}
