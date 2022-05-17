import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lipoic/src/lipoic_app.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(color: Theme.of(context).backgroundColor),
      ),
      body: Container(
          constraints: const BoxConstraints.expand(),
          color: AppTheme.color.cyanBackground,
          child: const CustomPaint(
              painter: _BackgroundPainter(), child: _LoginWidget())),
    );
  }
}

class _LoginWidget extends StatefulWidget {
  const _LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<_LoginWidget> {
  bool keepLogin = true;
  ButtonStyle buttonTextStyle = ButtonStyle(
      textStyle: MaterialStateProperty.all(AppTheme.text.medium),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 100)));
  double oauthIconSize = 48;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: kSplitHight),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: kSplitWidth),
            Transform.scale(
                scale: 2, child: const BackButton(color: Color(0XFF457676)))
          ],
        ),
        SizedBox(height: size.height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 60,
                height: 60,
                child: Image.asset('assets/images/logo.png')),
            Text('Lipoic',
                style:
                    AppTheme.text.large.copyWith(fontWeight: FontWeight.bold))
          ],
        ),
        SizedBox(height: size.height * 0.05),
        SizedBox(
          width: size.width * 0.8,
          child: Column(
            children: [
              TextField(
                style: const TextStyle(color: Color(0xFFABABAB)),
                decoration: InputDecoration(
                    hintText: '使用者名稱或電子郵件',
                    prefixIcon: const Icon(Icons.account_circle),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: size.width * 0.08),
              TextField(
                style: const TextStyle(color: Color(0xFFABABAB)),
                decoration: InputDecoration(
                    hintText: '密碼',
                    prefixIcon: const Icon(Icons.key),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: keepLogin,
                          onChanged: (value) {
                            keepLogin = value!;
                            setState(() {});
                          }),
                      const Text('保持登入',
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                    ],
                  ),
                  const Text(
                    '忘記密碼 ?',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )
                ],
              ),
              const SizedBox(height: kSplitHight),
              ElevatedButton(
                style: buttonTextStyle,
                onPressed: () {},
                child: Text('登入', style: AppTheme.text.medium),
              ),
              const SizedBox(height: kSplitHight),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(
                      child: Divider(height: kSplitHight * 3, thickness: 3)),
                  const SizedBox(width: kSplitWidth * 2),
                  Text('或', style: AppTheme.text.medium),
                  const SizedBox(width: kSplitWidth * 2),
                  const Expanded(
                      child: Divider(height: kSplitHight * 3, thickness: 3)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: const FaIcon(FontAwesomeIcons.google),
                      iconSize: oauthIconSize,
                      onPressed: () {}),
                  IconButton(
                      icon: const FaIcon(FontAwesomeIcons.facebook),
                      iconSize: oauthIconSize,
                      onPressed: () {}),
                  IconButton(
                      icon: Image.asset(
                          'assets/images/oauth/taiwan_cloud_education.png'),
                      iconSize: oauthIconSize,
                      onPressed: () {})
                ],
              ),
              const SizedBox(height: kSplitHight),
              Text('還沒有帳號嗎？', style: AppTheme.text.regular),
              const SizedBox(height: kSplitHight),
              ElevatedButton(
                style: buttonTextStyle,
                onPressed: () {},
                child: Text('註冊', style: AppTheme.text.medium),
              ),
            ],
          ),
        )
      ],
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
      ..color = const Color(0xFFA4DFDA);

    final paint3 = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = const Color(0xFF819FA4);

    final double sideLength =
        width / 2 * sqrt(2) * max(0.8, 1.1 - width / height);
    canvas.save();
    Path path = Path()
      ..moveTo(-10, -10)
      ..lineTo(sideLength * sqrt(2) / 2 + 15, -10)
      ..lineTo(-10, sideLength * sqrt(2) / 2 + 15);

    canvas.drawShadow(path, const Color(0xFF000000), 10, false);
    canvas.restore();

    canvas.save();
    Rect rect = Offset.zero & Size(sideLength, sideLength);
    canvas.translate(-sideLength / 2, -sideLength / 2);
    rotate(canvas, rect.width, rect.height, 45 * 3.14 / 180);
    canvas.drawRect(rect, paint);

    canvas.restore();

    canvas.save();
    Path path2 = Path()
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
