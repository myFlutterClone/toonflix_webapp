import 'package:flutter/material.dart';
import 'package:toonflix_webapp/screen/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  //key를 StatelessWidget의 슈퍼클래스에 보내는 거
  //ID같은 식별자 역할
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
