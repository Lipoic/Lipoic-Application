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
  Color textColor = const Color(0xFF395C59);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(color: Theme.of(context).backgroundColor),
      ),
      body: Container(
        color: const Color(0xFF5F8385),
        child: CustomPaint(
          painter: const _BackgroundPainter(),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.23,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    const SizedBox(width: 30),
                    Text(
                      '歡迎來到\nLipoic！',
                      style: AppTheme.text.large.copyWith(
                          color: textColor,
                          shadows: [
                            const Shadow(
                                offset: Offset(0, 5.0),
                                blurRadius: 6.0,
                                color: Color(0x55777777))
                          ]),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    ColoredBox(
                        color: textColor,
                        child: Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color(0x66777777),
                                spreadRadius: 0,
                                blurRadius: 6,
                                offset: Offset(0, 6.0))
                          ]),
                          child: const SizedBox(
                            width: 90,
                            height: 11,
                          ),
                        )),
                  ],
                ),
              ),
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
    double width = size.width;
    double height = size.height;

    final paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = const Color(0xFF819FA4);

    final paint2 = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFA3DfDA);

    final path = Path()
      ..moveTo(width * 78 / 120, height * 0.24)
      ..lineTo(width, height * 0.24 - width * 42 / 120)
      ..lineTo(width, height * 0.6);
    path.close();

    final path2 = Path()
      ..moveTo(0, 0)
      ..lineTo(width / 2, 0)
      ..lineTo(width, height * 0.6)
      ..lineTo(width, height)
      ..lineTo(0, height);
    path.close();

    final pathShadow = Path()
      ..moveTo(width * 0.7, height * 0.24 - 15)
      ..lineTo(width, height * 0.24 - width * 42 / 120 - 15)
      ..lineTo(width, height * 0.6 - 15);
    path.close();

    final path2Shadow = Path()
      ..moveTo(10, 0)
      ..lineTo(width / 2 + 10, 0)
      ..lineTo(width + 10, height * 0.6)
      ..lineTo(width + 10, height)
      ..lineTo(10, height);
    path.close();

    canvas.drawShadow(pathShadow, Colors.black, 10, false);
    canvas.drawPath(path, paint);
    canvas.drawShadow(path2Shadow, Colors.black, 10, false);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
