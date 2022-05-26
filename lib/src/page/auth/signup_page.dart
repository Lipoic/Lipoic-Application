import 'package:flutter/material.dart';
import 'package:lipoic/src/lipoic_app.dart';
import 'package:lipoic/src/page/auth/base_auth_page.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/signup';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  ButtonStyle buttonTextStyle = ButtonStyle(
      textStyle: MaterialStateProperty.all(AppTheme.text.medium),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 100)));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseAuthPage(fields: [
      TextField(
        decoration: InputDecoration(
            hintText: '電子郵件',
            prefixIcon: const Icon(Icons.account_circle),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
      const SizedBox(height: kSplitHeight * 2),
      TextField(
        decoration: InputDecoration(
            hintText: '使用者名稱',
            prefixIcon: const Icon(Icons.account_circle),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
      const SizedBox(height: kSplitHeight * 2),
      TextField(
        decoration: InputDecoration(
            hintText: '密碼',
            prefixIcon: const Icon(Icons.key),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
      const SizedBox(height: kSplitHeight * 3),
      ElevatedButton(
        style: buttonTextStyle,
        onPressed: () {},
        child: Text('註冊', style: AppTheme.text.medium),
      ),
      const SizedBox(height: kSplitHeight * 7),
      Text('已經有帳號了嗎？', style: AppTheme.text.regular),
      const SizedBox(height: kSplitHeight),
      ElevatedButton(
        style: buttonTextStyle,
        onPressed: () {
          Navigator.pushNamed(context, LoginPage.routeName);
        },
        child: Text('登入', style: AppTheme.text.medium),
      ),
    ]);
  }
}
