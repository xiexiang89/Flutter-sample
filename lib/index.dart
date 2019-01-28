///Index page
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  final String title;

  IndexPage({Key key, this.title}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<IndexPage> {
  final List<_IndexItem> itemList = [
    _IndexItem(title: 'Image'),
    _IndexItem(title: 'Text'),
    _IndexItem(title: 'Button'),
    _IndexItem(title: 'Text'),
    _IndexItem(title: 'Button'),
    _IndexItem(title: 'Text'),
    _IndexItem(title: 'Button'),
    _IndexItem(title: 'Text'),
    _IndexItem(title: 'Button'),
    _IndexItem(title: 'Text'),
    _IndexItem(title: 'Button'),
    _IndexItem(title: 'ViewPager'),
    _IndexItem(title: 'Button'),
    _IndexItem(title: 'Text'),
    _IndexItem(title: 'Button'),
    _IndexItem(title: 'Text'),
    _IndexItem(title: 'Button'),
    _IndexItem(title: 'ViewPager')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (BuildContext context, int index) {
            return _IndexListItemView(item: itemList[index]);
          }
        ));
  }
}

class _IndexListItemView extends Container {
  final _IndexItem item;

  _IndexListItemView({this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => this._handleOnTapItem(item),
      child: Container(height: 50, alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(10),
          child: Text(item.title, style: TextStyle(inherit: true, fontSize: 20)))
    );
  }

  void _handleOnTapItem(_IndexItem item) {
    print(item.title);
  }
}

class _IndexItem {
  String title;

  _IndexItem({this.title});
}
