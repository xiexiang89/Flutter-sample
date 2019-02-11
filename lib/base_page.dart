
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///基础页面父类
abstract class BasicPage<T extends BasePageState> extends StatefulWidget {

  String title;

  BasicPage({Key key,this.title}): super(key:key);

  @override
  State<StatefulWidget> createState() => createBaseUiState();

  @protected
  T createBaseUiState();
}

abstract class BasePageState extends State<BasicPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: createBody(),
    );
  }

  Widget createBody();
}