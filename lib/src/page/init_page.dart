import 'package:flutter/material.dart';
import 'package:lipoic/src/lipoic_app.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  ButtonStyle buttonTextStyle = ButtonStyle(
      textStyle: MaterialStateProperty.all(AppTheme.text.medium),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 50)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(163, 223, 218, 1),
        child: Column(
          children: [
            Expanded(
                child: Center(
                    child: Text('歡迎來到\n Lipoic！',
                        style: AppTheme.text.large.copyWith(
                            color: const Color.fromRGBO(57, 92, 89, 1))))),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginPage.routeName);
                        },
                        style: buttonTextStyle,
                        child: const Text('登入',
                            style: TextStyle(color: Colors.white)),
                      ),
                      OutlinedButton(
                          onPressed: () {},
                          style: buttonTextStyle,
                          child: const Text('註冊')),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: kSplitHight + 5)
          ],
        ),
      ),
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  const _BackgroundPainter();

  @override
  void paint(Canvas canvas, Size size) {
    drawRect(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void drawRect(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
  }
}
