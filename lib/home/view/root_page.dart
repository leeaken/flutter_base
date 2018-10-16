import 'package:flutter/material.dart';
import 'package:flutter_base_ui/base/navigation_view.dart';
import 'package:flutter_base_ui/home/view/home_page.dart';
import 'package:flutter_base_ui/layout/view/layout_page.dart';
import 'package:flutter_base_ui/demo/demo_page.dart';
import 'package:flutter_base_ui/my/my_page.dart';

// 首页
class RootViewPage extends StatefulWidget {
  @override
  _RootViewPageState createState() => _RootViewPageState();
}

class _RootViewPageState extends State<RootViewPage> with TickerProviderStateMixin {

  int _currentIndex = 0;
  List<NavigationView> _navViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage; 

  @override
    void initState() {
      // TODO: implement initState
      super.initState();

      _navViews = <NavigationView>[
        new NavigationView(
          icon: Icon(Icons.home),
          title: Text("控件"),
          vsync: this,
        ),
        new NavigationView(
          icon: Icon(Icons.storage),
          title: Text("布局"),
          vsync: this,
        ),
        new NavigationView(
          icon: Icon(Icons.menu),
          title: Text("演示"),
          vsync: this,
        ),
        new NavigationView(
          icon: Icon(Icons.perm_identity),
          title: Text("我的"),
          vsync: this,
        )
      ];

      for (NavigationView view in _navViews) {
        view.controller.addListener(_rebuild);
      } 

      _pageList = <StatefulWidget>[
        new HomePage(),
        new LayoutPage(),
        new DemoPage(),
        new MyPage()
      ];
       _currentPage = _pageList[_currentIndex];
    }

  void _rebuild(){
    setState((){});
  }

  @override
  void dispose() {
    super.dispose();
    for (NavigationView view in _navViews) {
      view.controller.dispose();
    }
  }
  @override
  Widget build(BuildContext context) {

    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
        items: _navViews
            .map((NavigationView navigationIconView) => navigationIconView.item)
            .toList(),
      currentIndex: _currentIndex,
      fixedColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState((){
          _navViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navViews[_currentIndex].controller.forward();
          _currentPage = _pageList[_currentIndex];
        });
      }
    );
    
    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
            child: _currentPage
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
      theme: new ThemeData(
            primarySwatch: Colors.blue,
          ),
    );
  }
}