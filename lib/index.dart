///Index page
import 'package:flutter/material.dart';
import 'package:flutter_sample/routes/routes.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
          itemBuilder: (BuildContext context, int index) => _IndexListItemView(item: itemList[index])
        ));
  }
}

class _IndexListItemView extends Container {
  final _IndexItem item;

  _IndexListItemView({this.item});

  @override
  Widget build(BuildContext context) {
    //ink well 是水波纹效果的组件
    return InkWell(
      onTap: () => this._handleOnTapItem(context, item),
      child: Container(alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10,top: 15,right: 15,bottom: 20),
          child: Row(children: <Widget>[Image.asset('assets/images/ic_card_type_common.png',height: 30, fit: BoxFit.cover),
          Container(padding: EdgeInsets.only(left: 10),
              child: Column(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text('Title'),Text(item.title)]))
          ])
      )
    );
  }

  void _handleOnTapItem(BuildContext context, _IndexItem item) {
    Routes.push(context, Routes.INDEX_PAGE_NAME, {'title':item.title});
  }
}

class _IndexItem {
  String title;

  _IndexItem({this.title});
}
