import 'package:flutter/material.dart';
import 'package:flutter_base_ui/home/model/homeListBean.dart';

// 首页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  final List<HomeListBean> homeItemData = new List();
  final List<HomeListBean> headerData = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  void initData() async {
    
    // header
    headerData.add(HomeListBean(Icons.text_fields, "Text", "文本",Colors.blue));
    headerData.add(HomeListBean(Icons.text_format, "TextField", "文本框",Colors.brown));
    headerData.add(HomeListBean(Icons.save, "Image", "图片",Colors.lightBlueAccent));
    headerData.add(HomeListBean(Icons.mail, "Button", "按钮",Colors.redAccent));
    headerData.add(HomeListBean(Icons.view_list, "ListView", "列表",Colors.lightGreenAccent));
    headerData.add(HomeListBean(Icons.switch_camera, "Switch", "切换开关",Colors.greenAccent));
    headerData.add(HomeListBean(Icons.slideshow, "Slider", "滑块",Colors.purpleAccent));
    headerData.add(HomeListBean(Icons.tab, "Appbar", "栏1",Colors.pinkAccent));
    // list
    homeItemData.add(HomeListBean(Icons.text_fields, "Text", "文本",Colors.black));
    homeItemData.add(HomeListBean(Icons.text_fields, "TextField", "文本框",Colors.black));
    homeItemData.add(HomeListBean(Icons.save, "Image", "图片",Colors.black));
    homeItemData.add(HomeListBean(Icons.mail, "RaisedButton", "按钮",Colors.black));
    homeItemData.add(HomeListBean(Icons.view_list, "ListView", "列表",Colors.black));
    homeItemData.add(HomeListBean(Icons.view_list, "GridView", "网格列表",Colors.black));
    homeItemData.add(HomeListBean(Icons.switch_camera, "Switch", "切换开关",Colors.black));
    homeItemData.add(HomeListBean(Icons.slideshow, "Slider", "滑块",Colors.black));
    homeItemData.add(HomeListBean(Icons.tab, "Appbar", "栏1",Colors.black));
    homeItemData.add(HomeListBean(Icons.tab_unselected, "TabBar", "水平栏",Colors.black));
    homeItemData.add(HomeListBean(Icons.radio, "Radio", "选择框",Colors.black));
  }

  @override
  Widget build(BuildContext context) {
    // final widthSrcreen = MediaQuery.of(context).size.width/3.0 - 1;
    
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
          appBar: new AppBar(title: new Text('首页')),
          body: _buildList()
        ),
    );
  }

  Widget _headerView(){
      return Container(
        // color: Colors.lime,
        height: 200.0,
        child: Column(
          children: <Widget>[
            Container(
              height: 199.0,
              child: ListView.builder(
                itemCount: (headerData.length/2).toInt(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    child:Column(
                      children: <Widget>[
                        Container(
                          // color: Colors.green,
                          width: (MediaQuery.of(context).size.width - 25) / 4,
                          height: MediaQuery.of(context).size.width / 4 - 14,
                          child: Column(
                            children: <Widget>[
                              Icon(
                                headerData[index].iconName,
                                color:headerData[index].color
                              ),
                             Padding(
                               padding: new EdgeInsets.only(top: 3.0),
                               child: Text(
                                  headerData[index].title,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black87
                                  ),
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                )
                             )
                             
                            ]
                          ),
                          padding: new EdgeInsets.only(left: 13.0, top: 15.0, bottom: 15.0, right: 13.0),// 内部元素
                          margin: new EdgeInsets.only(top: 10.0, left: 5.0),// 外部
                        ),
                        Container(
                          // color: Colors.green,
                          width: (MediaQuery.of(context).size.width - 25) / 4,
                          height: MediaQuery.of(context).size.width / 4 - 14,
                          child: Column(
                            children: <Widget>[
                              Icon(
                                headerData[index + 4].iconName,
                                color:headerData[index + 4].color
                              ),
                             Padding(
                               padding: new EdgeInsets.only(top: 3.0),
                               child: Text(
                                  headerData[index + 4].title,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black87
                                  ),
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                )
                             )
                            ]
                          ),
                          padding: new EdgeInsets.only(left: 13.0, top: 15.0, bottom: 15.0, right: 13.0),
                          margin: new EdgeInsets.only(top: 10.0, left: 5.0),
                        ),
                      ],
                    )
                  );
                },
              ),
            ),
            Container(child:Divider(color: Colors.black45,height: 1.0))
          ],
        )
          // margin: new EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
      );
  }

  Widget _buildList(){
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
                                        child:Icon(homeItemData[index].iconName)),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                        // color: Colors.purple,
                                        margin: EdgeInsets.only(right: 10.0),
                                        padding: new EdgeInsets.all(5.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                        mainAxisAlignment:
                                              MainAxisAlignment.end,
                                        children: <Widget>[
                                          Icon(Icons.chevron_right)
                                        ]
                                      ))
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