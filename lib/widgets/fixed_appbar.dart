///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2019-11-19 10:06
///
import 'package:flutter/material.dart';

import 'package:yuque/constants/constants.dart';

/// Customized appbar.
/// 自定义的顶栏。
class FixedAppBar extends StatelessWidget {
  const FixedAppBar({
    Key key,
    this.automaticallyImplyLeading = true,
    this.title,
    this.centerTitle = true,
    this.backgroundColor,
    this.elevation = 2.0,
    this.actions,
    this.actionsPadding,
  }) : super(key: key);

  final Widget title;
  final List<Widget> actions;
  final EdgeInsetsGeometry actionsPadding;
  final bool automaticallyImplyLeading;
  final bool centerTitle;
  final Color backgroundColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    Widget _title = title;
    if (centerTitle) {
      _title = Center(child: _title);
    }
    return Material(
      type: MaterialType.transparency,
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        height: suSetHeight(kAppBarHeight) + MediaQuery.of(context).padding.top,
        decoration: BoxDecoration(
          boxShadow: elevation > 0
              ? <BoxShadow>[
                  BoxShadow(
                    color: Color(0x0d000000),
                    blurRadius: suSetHeight(elevation * 1.0),
                    offset: Offset(0, elevation * 2.0),
                  ),
                ]
              : null,
          color: backgroundColor ?? Theme.of(context).primaryColor,
        ),
        child: Row(
          children: <Widget>[
            if (automaticallyImplyLeading && Navigator.of(context).canPop()) BackButton(),
            Expanded(
              child: DefaultTextStyle(
                child: _title,
                style: Theme.of(context).textTheme.title.copyWith(fontSize: suSetSp(23.0)),
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (automaticallyImplyLeading &&
                Navigator.of(context).canPop() &&
                (actions?.isEmpty ?? true))
              SizedBox(width: 48.0)
            else if (actions?.isNotEmpty ?? false)
              Padding(
                padding: actionsPadding ?? EdgeInsets.only(right: suSetWidth(10.0)),
                child: Row(mainAxisSize: MainAxisSize.min, children: actions),
              ),
          ],
        ),
      ),
    );
  }
}

/// Wrapper for [FixedAppBar]. Avoid elevation covered by body.
/// 顶栏封装。防止内容块层级高于顶栏导致遮挡阴影。
class FixedAppBarWrapper extends StatelessWidget {
  const FixedAppBarWrapper({
    Key key,
    @required this.appBar,
    @required this.body,
  })  : assert(
          appBar != null && body != null,
          'All fields must not be null.',
        ),
        super(key: key);

  final FixedAppBar appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: suSetHeight(kAppBarHeight) + MediaQuery.of(context).padding.top,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: body,
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: appBar,
          ),
        ],
      ),
    );
  }
}
