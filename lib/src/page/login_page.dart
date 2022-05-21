import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lipoic/src/lipoic_app.dart';
import 'package:lipoic/src/theme/theme.dart';
import 'package:lipoic/src/util/painter_util.dart';

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
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Container(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
              ),
              color: AppTheme.color.cyanBackground,
              child: const CustomPaint(
                  painter: _BackgroundPainter(), child: _LoginWidget())),
        ),
      ),
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
          width: min(size.width * 0.85, 300),
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
              const SizedBox(height: kSplitHight * 2.5),
              TextField(
                style: const TextStyle(color: Color(0xFFABABAB)),
                decoration: InputDecoration(
                    hintText: '密碼',
                    prefixIcon: const Icon(Icons.key),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: kSplitHight),
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
                      Text('保持登入', style: AppTheme.text.small),
                    ],
                  ),
                  TextButton(
                    child: Text('忘記密碼 ?', style: AppTheme.text.small),
                    onPressed: () {},
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
        ),
      ],
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  const _BackgroundPainter();

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    final paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFA4DFDA);

    final paint2 = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = const Color(0xFF819FA4);

    final double sideLength = min(min(height,width) / 2 * sqrt(2) * max(0.8, 1.1 - width / height), 600);

    Path topLeftTri = Path()
      ..moveTo(0, 0)
      ..lineTo(sideLength * sqrt(2) / 2, 0)
      ..lineTo(0, sideLength * sqrt(2) / 2);


    Path pathShadow = Path()
      ..moveTo(-10, -10)
      ..lineTo(sideLength * sqrt(2) / 2 + 15, -10)
      ..lineTo(-10, sideLength * sqrt(2) / 2 + 15);

    canvas.drawShadow(pathShadow, const Color(0xFF000000), 10, false);
    canvas.drawPath(topLeftTri, paint);


    Path bottomRightTri = Path()
      ..moveTo(width, height)
      ..lineTo(width - 5 * min(sideLength/8, width/20), height)
      ..lineTo(width, height - 4* min(sideLength/8, width/20));

    Path path2Shadow = Path()
      ..moveTo(width + 10, height + 10)
      ..lineTo(width - 5 * min(sideLength/8, width/20), height + 10)
      ..lineTo(width + 10, height - min(sideLength/8, width/20));

    canvas.drawShadow(path2Shadow, const Color(0xFF000000), 10, false);
    canvas.drawPath(bottomRightTri, paint2);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
