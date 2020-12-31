import 'package:flutter/material.dart';

class RoutesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutesPage> {
  @override
  Widget build(BuildContext context) {
    print('build routes page');
    return Scaffold(
      body: new Center(
        child: new Text('routes'),
      ),
    );
  }
}
