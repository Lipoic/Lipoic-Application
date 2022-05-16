import 'package:flutter/material.dart';
import 'package:lipoic/src/lipoic_app.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  ButtonStyle buttonTextStyle = ButtonStyle(
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 25)),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 6, horizontal: 40)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(163, 223, 218, 1),
        child: Column(
          children: [
            Expanded(
                child: Center(
                    child: Text("歡迎來到\n Lipoic！", style: AppTheme.text.title))),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: buttonTextStyle.copyWith(
                            backgroundColor: MaterialStateProperty.all(
                                AppTheme.color.purple)),
                        child: const Text("登入",
                            style: TextStyle(color: Colors.white)),
                      ),
                      OutlinedButton(
                          onPressed: () {},
                          style: buttonTextStyle.copyWith(
                              side: MaterialStateProperty.all(BorderSide(
                                  color: AppTheme.color.purple, width: 3))),
                          child: const Text("註冊")),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: kSplitHight)
          ],
        ),
      ),
    );
  }
}
