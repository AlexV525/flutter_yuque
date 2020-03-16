///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/3/16 14:09
///
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:yuque/constants/constants.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController tokenController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode tokenNode = FocusNode();

  /// Function called when triggered listener.
  /// 触发页面监听器时，所有的输入框失焦，隐藏键盘。
  void dismissFocusNodes() {
    if (tokenNode?.hasFocus ?? false) {
      tokenNode?.unfocus();
    }
  }

  /// Content widget list.
  /// 内容部件列表
  List<Widget> get headerContent => <Widget>[
        Image.asset(
          R.ASSETS_IMAGES_LOGO_PNG,
          width: suSetWidth(90.0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: suSetHeight(12.0)),
          child: Text(
            '语雀',
            style: TextStyle(
              fontSize: suSetSp(40.0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '专业的云端知识库',
          style: TextStyle(
            fontSize: suSetSp(22.0),
            fontWeight: FontWeight.normal,
          ),
        ),
      ];

  Widget get tokenField => Container(
        margin: EdgeInsets.symmetric(vertical: suSetHeight(20.0)),
        child: TextField(
          controller: tokenController,
          focusNode: tokenNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: C.themeBorderColor,
                width: suSetWidth(1.0),
              ),
              borderRadius: BorderRadius.circular(suSetWidth(5.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[350],
                width: suSetWidth(1.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: C.themeBorderColor,
                width: suSetWidth(1.0),
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: suSetWidth(20.0)),
            isDense: true,
            prefixIcon: Icon(Icons.devices, size: suSetWidth(28.0)),
            hintText: 'Token',
            hintStyle: currentTheme.textTheme.caption.copyWith(
              fontSize: suSetSp(18.0),
            ),
          ),
          scrollPadding: EdgeInsets.zero,
          style: currentTheme.textTheme.body1.copyWith(
            fontSize: suSetSp(24.0),
          ),
        ),
      );

  Widget get loginButton => Consumer<LoginProvider>(
        builder: (BuildContext _, LoginProvider provider, Widget __) {
          return MaterialButton(
            minWidth: double.maxFinite,
            height: suSetHeight(50.0),
            color: C.themeColor,
            child: AnimatedCrossFade(
              crossFadeState:
                  provider.isLogin ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: kThemeAnimationDuration,
              firstChild: Text(
                '授权并登录',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: suSetSp(1.0),
                ),
              ),
              secondChild: SpinKitThreeBounce(color: Colors.white, size: suSetWidth(40.0)),
            ),
            onPressed: () {
              provider.requestLogin(tokenController.text);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(suSetWidth(5.0)),
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        behavior: HitTestBehavior.translucent,
        onPointerUp: (PointerUpEvent event) {
          dismissFocusNodes();
        },
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: suSetWidth(500.0)),
            padding: EdgeInsets.symmetric(
              horizontal: Screens.width * 0.05,
              vertical: suSetHeight(100.0),
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  ...headerContent,
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[tokenField, loginButton],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
