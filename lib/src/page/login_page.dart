import 'dart:math';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _loginWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Material(
            color: const Color(0xFF4D4D4D),
            child: Column(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 57,
                    child: TextField(
                      style: const TextStyle(color: Color(0xFFABABAB)),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: const Color(0x557C7B7B),
                          filled: true),
                    )),
                SizedBox(height: MediaQuery.of(context).size.width * 0.08),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 57,
                    child: TextField(
                      style: const TextStyle(color: Color(0xFFABABAB)),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: const Color(0x557C7B7B),
                          filled: true),
                    )),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: true,
                            onChanged: (value) {
                              value = !value!;
                            }),
                        const Text(
                          "保持登入",
                          style:
                              TextStyle(fontSize: 15, color: Color(0xFFFFFFFF)),
                        ),
                      ],
                    ),
                    const Text(
                      "忘記密碼 ?",
                      style: TextStyle(fontSize: 15, color: Color(0xFFFFFFFF)),
                    )
                  ],
                ),
                const SizedBox(height: 50),
                TextButton(
                    child: Container(
                      color: const Color(0xFF7B6DD6),
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 40,
                      child: const Center(
                          child: Text(
                        "登入",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),
                      )),
                    ),
                    onPressed: () {}),
                const SizedBox(height: 50),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
          color: const Color(0xFF4D4D4D),
          child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height),
              painter: MyPainter(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height),
              child: _loginWidget(context))),
    );
  }
}

class MyPainter extends CustomPainter {
  double width = 0.0, height = 0.0;

  MyPainter(double w, double h) {
    width = w;
    height = h;
  }

  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    drawRect(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void drawRect(Canvas canvas) {
    final paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFA4DFDA);

    final paint3 = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = const Color(0xFF819FA4);

    final double sideLength =
        width / 2 * sqrt(2) * max(0.8, 1.1 - width / height);
    canvas.save();
    var path = Path()
      ..moveTo(-10, -10)
      ..lineTo(sideLength * sqrt(2) / 2 + 15, -10)
      ..lineTo(-10, sideLength * sqrt(2) / 2 + 15);

    canvas.drawShadow(path, const Color(0xFF000000), 10, false);
    canvas.restore();

    canvas.save();
    var rect = Offset.zero & Size(sideLength, sideLength);
    canvas.translate(-sideLength / 2, -sideLength / 2);
    rotate(canvas, rect.width, rect.height, 45 * 3.14 / 180);
    canvas.drawRect(rect, paint);

    canvas.restore();

    canvas.save();
    var path2 = Path()
      ..moveTo(width + 10, height + 10)
      ..lineTo(width - 100, height + 10)
      ..lineTo(width + 10, height - 80);

    canvas.drawShadow(path2, const Color(0xFF000000), 10, false);
    canvas.restore();

    canvas.save();
    var rect3 = Offset.zero & const Size(100, 100);
    canvas.translate(width - 52, height - 40);
    rotate(canvas, rect3.width, rect3.height, 50 * 3.14 / 180);
    canvas.drawRect(rect3, paint3);

    canvas.restore();
  }

  void rotate(Canvas canvas, double dx, double dy, double angle) {
    final r = sqrt(dx * dx + dy * dy) / 2;
    final alpha = atan(dx / dy);
    final beta = alpha + angle;
    final shiftY = r * sin(beta);
    final shiftX = r * cos(beta);
    final translateX = dx / 2 - shiftX;
    final translateY = dy / 2 - shiftY;
    canvas.translate(translateX, translateY);
    canvas.rotate(angle);
  }
}
