import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    print('build mine page');
    return Scaffold(
      body: new Center(
        child: new Text('mine'),
      ),
    );
  }
}
