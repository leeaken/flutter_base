import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

// 常用事例演示
class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final List<String> bannerDatas = new List();

  @override
  void initState() {
    super.initState();

    bannerDatas.add("images/ad1.jpeg");
    bannerDatas.add("images/ad2.jpeg");
    bannerDatas.add("images/ad3.jpeg");
    bannerDatas.add("images/ad4.jpeg");
    bannerDatas.add("images/ad5.jpeg");
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.asset(bannerDatas[index], fit: BoxFit.cover));
  }

  Widget _buildBannerCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: Swiper(
        itemBuilder: _swiperBuilder,
        itemCount: bannerDatas.length,
        pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
          color: Colors.black54,
          activeColor: Colors.white,
        )),
        control: new SwiperControl(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点击了第$index个'),
      ),
    );
  }

  // 创建按钮
  Widget _buildButtonItem(String title, Icon icon, Color backgroundColor) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      child: FlatButton(
          onPressed: () {},
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 6.0),
                  child: CircleAvatar(
                    radius: 20.0,
                    child: icon,
                    backgroundColor: backgroundColor,
                  ),
                ),
                Container(
                  child: new Text(
                    title,
                    style: new TextStyle(color: Colors.black87, fontSize: 14.0),
                  ),
                )
              ],
            ),
          )),
    );
  }

  // 菜单中心
  Widget _buildService() {
    return new Container(
      margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          // 上排
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildButtonItem("我的收藏", Icon(Icons.book, color: Colors.white),
                    Colors.green),
                _buildButtonItem("我的生活",
                    Icon(Icons.flash_on, color: Colors.white), Colors.blue),
                _buildButtonItem(
                    "学习课堂",
                    Icon(Icons.subject, color: Colors.white),
                    Color(0xFFA68F52)),
                _buildButtonItem(
                    "咨询",
                    Icon(Icons.attach_money, color: Colors.white),
                    Color(0xFF355A9B))
              ],
            ),
          ),
          // 下排
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildButtonItem(
                    "已购",
                    Icon(Icons.shopping_basket, color: Colors.white),
                    Colors.pink),
                _buildButtonItem(
                    "优惠券", Icon(Icons.shop, color: Colors.white), Colors.red),
                _buildButtonItem(
                    "服务",
                    Icon(Icons.wifi_tethering, color: Colors.white),
                    Colors.brown),
                _buildButtonItem(
                    "订单",
                    Icon(Icons.shopping_cart, color: Colors.white),
                    Colors.cyan),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 广告
  Widget itemWidgetWithUrl(String url) {
    return Material(
      child: new InkWell(
        onTap: () {
        },
        child: Image.asset(
          url,
          fit: BoxFit.cover,
          width: 80.0,
          height: 80.0,
        ),
      ),
    );
  }
   List<Widget> _gridItemList() {
    List<Widget> wList = new List();
    wList.add(itemWidgetWithUrl('images/ad1.jpeg'));
    wList.add(itemWidgetWithUrl('images/ad2.jpeg'));
    wList.add(itemWidgetWithUrl('images/ad3.jpeg'));
    wList.add(itemWidgetWithUrl('images/ad4.jpeg'));
    return wList;
  }
  Widget _buildAdCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.width / 2 + 10,
       child:GridView.count(
        childAspectRatio: 2.0,
        primary: false,
        // padding: const EdgeInsets.all(10.0),
        physics: new NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10.0,
        crossAxisCount: 2,
        mainAxisSpacing: 6.0,
        children: _gridItemList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
          appBar: new AppBar(title: new Text('常用演示')),
          body: Container(
            color: Color.fromRGBO(235, 235, 235, 1.0),
            child: ListView(
              children: <Widget>[
                // 广告
                _buildBannerCard(),
                // 菜单中心
                _buildService(),
                _buildAdCard()
              ],
            ),
          )),
    );
  }

}
