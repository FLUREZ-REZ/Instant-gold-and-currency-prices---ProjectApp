import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('🎉 خوش آمدید', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
