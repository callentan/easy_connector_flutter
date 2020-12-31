import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    print('build notification page');
    return Scaffold(
      body: new Center(
        child: new Text('notification'),
      ),
    );
  }
}
