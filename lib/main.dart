import 'package:flutter/material.dart';

import 'src/lipoic_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LipoicAPP());
}

class LipoicAPP extends StatelessWidget {
  const LipoicAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lipoic',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: const MaterialColor(0xffa3dfda, <int, Color>{
              50: Color.fromRGBO(94, 255, 228, 1),
              100: Color.fromRGBO(114, 188, 247, 1),
              200: Color.fromRGBO(127, 214, 245, 1),
              300: Color.fromRGBO(119, 203, 246, 1),
              400: Color.fromRGBO(125, 191, 247, 1),
              500: Color(0xff8ca0f9),
              600: Color.fromRGBO(123, 109, 214, 1),
              700: Color.fromARGB(255, 147, 106, 244),
              800: Color.fromRGBO(84, 107, 237, 1),
              900: Color.fromRGBO(181, 76, 255, 1),
            }),
            fontFamily: 'Roboto',
            textTheme: const TextTheme(
              subtitle1:
                  TextStyle(fontFamilyFallback: ['Roboto', 'NotoSansTC']),
            )),
        onGenerateInitialRoutes: (String initialRouteName) {
          return [NavigatorUtil.generateRoute(const RouteSettings(name: '/'))];
        },
        onGenerateRoute: (settings) => NavigatorUtil.generateRoute(settings),
        onUnknownRoute: (settings) => NavigatorUtil.generateRoute(settings));
  }
}
