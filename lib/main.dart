import 'package:flutter/material.dart';
import 'package:flutter_base_ui/home/view/root_page.dart';

void main() => runApp(new LayoutUI());

class LayoutUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter UI",
      home: new RootViewPage(),
    );
  }
}



