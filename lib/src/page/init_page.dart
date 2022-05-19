import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lipoic/src/lipoic_app.dart';
import 'package:lipoic/src/util/painter_util.dart';

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
  Color textColor = const Color(0xFF395C59);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(color: Theme.of(context).backgroundColor),
      ),
      body: Container(
        color: const Color.fromRGBO(163, 223, 218, 1),
        child: CustomPaint(
          painter: const _BackgroundPainter(),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Text(
                '歡迎來到\n Lipoic！',
                style: AppTheme.text.large.copyWith(color: textColor),
                textAlign: TextAlign.left,
              ),
              ColoredBox(
                  color: textColor,
                  child: const SizedBox(
                    width: 120,
                    height: 11,
                  )),
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

    final paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = const Color(0xFF819FA4);

    // final double sideLength =
    //     width / 2 * sqrt(2) * max(0.8, 1.1 - width / height);

    // Rect rect = const Offset(200, -250) & Size(sideLength, sideLength);
    // canvas.translate(-sideLength / 2, -sideLength / 2);
    // PainterUtil.rotate(canvas, rect.width, rect.height, 45 * 3.14 / 180);
    // canvas.drawRect(rect, paint);
  }
}
