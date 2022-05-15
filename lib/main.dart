import 'package:flutter/material.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: const Center(child: Text('hello world')),
    );
  }
}
