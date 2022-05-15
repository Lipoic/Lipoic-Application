import 'package:flutter/material.dart';
import 'package:lipoic/page/main_page.dart';

void main() {
  runApp(const LipoicAPP());
}

class LipoicAPP extends StatelessWidget {
  const LipoicAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lipoic',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto',
          textTheme: const TextTheme(
            subtitle1: TextStyle(fontFamilyFallback: ['Roboto', 'NotoSansTC']),
          )),
      home: const MainPage(),
    );
  }
}