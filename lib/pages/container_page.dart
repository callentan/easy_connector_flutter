import 'package:easy_connector_flutter/pages/mine/mine_page.dart';
import 'package:easy_connector_flutter/pages/notification/notification_page.dart';
import 'package:easy_connector_flutter/pages/search/search_page.dart';
import 'package:flutter/material.dart';

import 'routes/routes_page.dart';

///这个页面是作为整个APP的最外层的容器，以Tab为基础控制每个item的显示与隐藏
class ContainerPage extends StatefulWidget {
  ContainerPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ContainerPageState();
  }
}

class _Item {
  String name;
  IconData activeIcon;
  IconData normalIcon;

  _Item(this.name, this.activeIcon, this.normalIcon);
}

class _ContainerPageState extends State<ContainerPage> {
  List<Widget> pages;

  final defaultItemColor = Color.fromARGB(255, 125, 125, 125);

  final itemNames = [
    _Item('Routes&Time', Icons.directions_bus_rounded,
        Icons.directions_bus_outlined),
    _Item('Search', Icons.search_rounded, Icons.search_rounded),
    _Item('Notification', Icons.notifications_none_rounded,
        Icons.notifications_none_outlined),
    _Item('Mine', Icons.account_box_rounded, Icons.account_box_outlined),
  ];

  List<BottomNavigationBarItem> itemList;

  @override
  void initState() {
    super.initState();
    print('initState _ContainerPageState');
    if (pages == null) {
      pages = [
        RoutesPage(),
        SearchPage(),
        NotificationPage(),
        MinePage(),
      ];
    }
    if (itemList == null) {
      itemList = itemNames
          .map((item) => BottomNavigationBarItem(
                icon: Icon(item.normalIcon),
                label: item.name,
                activeIcon: Icon(item.activeIcon),
              ))
          .toList();
    }
  }

  int _selectIndex = 0;

//Stack（层叠布局）+Offstage组合,解决状态被重置的问题
  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _selectIndex != index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages[index],
      ),
    );
  }

  @override
  void didUpdateWidget(ContainerPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
//    Scaffold({
//    Key key,
//    this.appBar,
//    this.body,
//    this.floatingActionButton,
//    this.floatingActionButtonLocation,
//    this.floatingActionButtonAnimator,
//    this.persistentFooterButtons,
//    this.drawer,
//    this.endDrawer,
//    this.bottomNavigationBar,
//    this.bottomSheet,
//    this.backgroundColor,
//    this.resizeToAvoidBottomPadding = true,
//    this.primary = true,
//    })
    print('build _ContainerPageState');
    return Scaffold(
      body: new Stack(
        children: [
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2),
          _getPagesWidget(3),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index) {
          ///这里根据点击的index来显示，非index的page均隐藏
          setState(() {
            _selectIndex = index;
          });
        },
        //图标大小
        iconSize: 24,
        //当前选中的索引
        currentIndex: _selectIndex,
        //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
