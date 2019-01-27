
///Index page
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {

  final String title;

  IndexPage({Key key, this.title}) : super(key:key);

  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<IndexPage> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, item) {
      return _IndexListItemView();
    });
  }
}

class _IndexListItemView extends Container {
  _IndexItem item;

  _IndexListItemView({this.item});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return super.build(context);
  }
}

class _IndexItem {
  String title;

  _IndexItem({this.title});
}