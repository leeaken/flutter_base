import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_ui/layout/model/layoutListBean.dart';
import 'package:flutter_base_ui/home/model/homeListBean.dart';

// 布局
class LayoutPage extends StatefulWidget {
  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  final List<LayoutListBean> homeItemData = new List();
  final List<LayoutListBean> hotData = new List();
  final List<HomeListBean> recomData = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // hot
    hotData.add(LayoutListBean("images/row.jpg", "Row", "行布局"));
    hotData.add(LayoutListBean("images/column.jpg", "Column", "列布局"));
    hotData.add(LayoutListBean("images/container.jpg", "Container", "容器布局"));
    hotData.add(LayoutListBean("images/center.jpg", "Center", "居中布局"));

    // 推荐
    recomData.add(HomeListBean(Icons.text_fields, "Text", "文本",Colors.blue));
    recomData.add(HomeListBean(Icons.text_format, "TextField", "文本框",Colors.brown));
    recomData.add(HomeListBean(Icons.save, "Image", "图片",Colors.lightBlueAccent));
    recomData.add(HomeListBean(Icons.mail, "Button", "按钮",Colors.redAccent));
    recomData.add(HomeListBean(Icons.view_list, "ListView", "列表",Colors.lightGreenAccent));
    recomData.add(HomeListBean(Icons.switch_camera, "Switch", "切换开关",Colors.greenAccent));
    recomData.add(HomeListBean(Icons.slideshow, "Slider", "滑块",Colors.purpleAccent));
    recomData.add(HomeListBean(Icons.tab, "Appbar", "栏1",Colors.pinkAccent));

    // list
    homeItemData.add(LayoutListBean("images/row.jpg", "Row", "行布局"));
    homeItemData.add(LayoutListBean("images/column.jpg", "Column", "列布局"));
    homeItemData.add(LayoutListBean("images/container.jpg", "Container", "容器布局"));
    homeItemData.add(LayoutListBean("images/padding.jpg", "Padding", "衬垫布局"));
    homeItemData.add(LayoutListBean("images/center.jpg", "Center", "居中布局"));
    homeItemData.add(LayoutListBean("images/align.jpg", "Align", "排序布局"));
    homeItemData.add(LayoutListBean("images/baseline.jpg", "Baseline", "基线布局"));
    homeItemData.add(LayoutListBean("images/sizebox.jpg", "SizeBox", "箱子尺寸布局"));
    homeItemData.add(LayoutListBean("images/stack.jpg", "Stack", "堆布局"));
    homeItemData.add(LayoutListBean("images/expanded.jpg", "Expanded", "延伸布局"));
    homeItemData.add(LayoutListBean("images/listview.jpg", "ListView", "列表布局"));
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('布局'),
        ),
        body: _buildList(),
      ),
    );
  }

  Widget _buildHot() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 80.0,
      child: ListView.builder(
        itemCount: hotData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: (MediaQuery.of(context).size.width - 25) / 4,
            // color: Colors.pink,
            margin: new EdgeInsets.only(top: 10.0, left: 5.0), // 外部
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ClipOval(
                  //这个一般可以作为圆形的裁剪哦。
                  child: new SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: Container(
                      child: new Image.asset(homeItemData[index].iconName,
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Text(hotData[index].title)
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecom() {
    return Container(
      height: 135.0,
      // color: Colors.lime,
      child: ListView.builder(
        itemCount: (recomData.length / 2).toInt(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Container(
                    // color: Colors.green,
                    width: (MediaQuery.of(context).size.width - 25) / 4,
                    height: 60.0,
                    child: Column(children: <Widget>[
                      Icon(recomData[index].iconName,
                          color: recomData[index].color),
                      Padding(
                          padding: new EdgeInsets.only(top: 3.0),
                          child: Text(
                            recomData[index].title,
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black87),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ))
                    ]),
                    padding: new EdgeInsets.only(
                        left: 13.0,
                        top: 5.0,
                        bottom: 5.0,
                        right: 13.0), // 内部元素
                    margin: new EdgeInsets.only(top: 5.0, left: 5.0), // 外部
                  ),
                  Container(
                    // color: Colors.green,
                    width: (MediaQuery.of(context).size.width - 25) / 4,
                    height: 60.0,
                    child: Column(children: <Widget>[
                      Icon(recomData[index + 4].iconName,
                          color: recomData[index + 4].color),
                      Padding(
                          padding: new EdgeInsets.only(top: 3.0),
                          child: Text(
                            recomData[index + 4].title,
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.black87),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ))
                    ]),
                    padding: new EdgeInsets.only(
                        left: 13.0, top: 5.0, bottom: 5.0, right: 13.0),
                    margin: new EdgeInsets.only(top: 5.0, left: 5.0),
                  ),
                ],
              ));
        },
      ),
    );
  }

  Widget _headerView() {
    return Container(
        // color: Colors.pink,
        height: 230.0,
        child: Column(children: <Widget>[
          _buildHot(),
          Container(
              padding: EdgeInsets.only(top:5.0,left: 10.0, right: 10.0),
              child: Divider(color: Colors.black45, height: 1.0)),
          _buildRecom(),
          Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Divider(color: Colors.black45, height: 1.0))
        ]));
  }

  Widget _buildList() {
    return new ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            child: Column(
          children: <Widget>[
            _headerView(),
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: homeItemData.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  margin: new EdgeInsets.all(15.0),
                                  child: Image.asset(
                                      homeItemData[index].iconName)),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                  // color: Colors.purple,
                                  margin: EdgeInsets.only(right: 10.0),
                                  padding: new EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        homeItemData[index].title,
                                        style: TextStyle(
                                            fontSize: 26.0,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        homeItemData[index].subTitle,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black54),
                                      )
                                    ],
                                  )),
                            ),
                            Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                  Icon(Icons.chevron_right)
                                ]))
                          ]),
                      // 分割线
                      Divider(height: 1.0, color: Colors.black12)
                    ],
                  ),
                );
              },
            )
          ],
        ));
      },
    );
  }
}
