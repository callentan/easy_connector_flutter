import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    print('build search page');
    return Scaffold(
      body: new Center(
        child: new Text('search'),
      ),
    );
  }
}
