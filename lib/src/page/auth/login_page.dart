import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lipoic/src/lipoic_app.dart';
import 'package:lipoic/src/page/auth/base_auth_page.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool keepLogin = true;
  ButtonStyle buttonTextStyle = ButtonStyle(
      textStyle: MaterialStateProperty.all(AppTheme.text.medium),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 100)));
  double oauthIconSize = 48;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseAuthPage(fields: [
      TextField(
        decoration: InputDecoration(
            hintText: '使用者名稱或電子郵件',
            prefixIcon: const Icon(Icons.account_circle),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
      const SizedBox(height: kSplitHeight * 2.5),
      TextField(
        decoration: InputDecoration(
            hintText: '密碼',
            prefixIcon: const Icon(Icons.key),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
      const SizedBox(height: kSplitHeight),
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
      const SizedBox(height: kSplitHeight),
      ElevatedButton(
        style: buttonTextStyle,
        onPressed: () {},
        child: Text('登入', style: AppTheme.text.medium),
      ),
      const SizedBox(height: kSplitHeight),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Expanded(
              child: Divider(height: kSplitHeight * 3, thickness: 3)),
          const SizedBox(width: kSplitWidth * 2),
          Text('或',
              style: AppTheme.text.medium
                  .copyWith(color: const Color(0xFF777777))),
          const SizedBox(width: kSplitWidth * 2),
          const Expanded(
              child: Divider(height: kSplitHeight * 3, thickness: 3)),
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
              icon:
                  Image.asset('assets/images/oauth/taiwan_cloud_education.png'),
              iconSize: oauthIconSize,
              onPressed: () {})
        ],
      ),
      const SizedBox(height: kSplitHeight),
      Text('還沒有帳號嗎？', style: AppTheme.text.regular),
      const SizedBox(height: kSplitHeight),
      ElevatedButton(
        style: buttonTextStyle,
        onPressed: () {
          Navigator.pushNamed(context, SignUpPage.routeName);
        },
        child: Text('註冊', style: AppTheme.text.medium),
      ),
    ]);
  }
}
