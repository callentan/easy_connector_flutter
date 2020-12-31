import 'package:flutter/material.dart';
import 'package:easy_connector_flutter/pages/container_page.dart';

///打开APP首页
class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  var container = ContainerPage();

  @override
  Widget build(BuildContext context) {
    print('build splash');
    return Scaffold(
      body: container,
    );
    return Stack(
      children: <Widget>[
        Offstage(
          child: container,
        ),
      ],
    );
  }
}
