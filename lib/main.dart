import 'package:flutter/material.dart';
import 'package:toonflix_webapp/screen/home_screen.dart';
import 'package:toonflix_webapp/services/api_service.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  //key를 StatelessWidget의 슈퍼클래스에 보내는 거
  //ID같은 식별자 역할
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
