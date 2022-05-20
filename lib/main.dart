import 'package:flutter/material.dart';

import 'src/lipoic_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigHelper.init();
  runApp(const LipoicAPP());
}

class LipoicAPP extends StatelessWidget {
  const LipoicAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lipoic',
        theme: AppTheme.defaultTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => NavigatorUtil.generateRoute(settings),
        onUnknownRoute: (settings) => NavigatorUtil.generateRoute(settings));
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
