import 'package:flutter/material.dart';
import 'package:toonflix_webapp/screen/home_screen.dart';
// import 'packages:toonflix_webapp/services/api_service.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();

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
