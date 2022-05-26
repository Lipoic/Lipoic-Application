import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lipoic/src/lipoic_app.dart';

class BaseAuthPage extends StatelessWidget {
  final List<Widget> fields;

  const BaseAuthPage({Key? key, required this.fields}) : super(key: key);

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
              child: CustomPaint(
                  painter: const _BackgroundPainter(),
                  child: _ChildWidget(fields: fields))),
        ),
      ),
    );
  }
}

class _ChildWidget extends StatelessWidget {
  final List<Widget> fields;

  const _ChildWidget({
    Key? key,
    required this.fields,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: kSplitHeight),
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
        SizedBox(height: size.height * 0.03),
        SizedBox(
          width: min(size.width * 0.85, 300),
          child: Column(
            children: fields,
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

    final double sideLength = min(
        min(height, width) / 2 * sqrt(2) * max(0.8, 1.1 - width / height), 600);

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
      ..lineTo(width - 5 * min(sideLength / 10, width / 30), height)
      ..lineTo(width, height - 4 * min(sideLength / 10, width / 30));

    Path path2Shadow = Path()
      ..moveTo(width + 10, height + 10)
      ..lineTo(width - 5 * min(sideLength / 10, width / 30), height + 10)
      ..lineTo(width + 10, height - min(sideLength / 10, width / 30));

    canvas.drawShadow(path2Shadow, const Color(0xFF000000), 10, false);
    canvas.drawPath(bottomRightTri, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
