
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/edit_sample.dart';
import 'package:flutter_sample/index.dart';
import 'package:flutter_sample/widget/custom_paint.dart';

class Routes {

  static const String INDEX_PAGE_NAME = '/index_page';
  static const String INPUT_PAGE_NAME = '/input_page';
  static const String CUSTOM_PAINT_NAME = '/custom_paint';

  static final Map<String, WidgetBuilder> _routes = {
    INPUT_PAGE_NAME: (BuildContext context) => EditSamplePage(),
    CUSTOM_PAINT_NAME: (BuildContext context) => MyCustomView()
  };

  static Map<String, WidgetBuilder> getRoutes() {
    return _routes;
  }

  static Future<T> pushNamed<T extends Object>(BuildContext context, String routeName) {
    return Navigator.pushNamed(context, routeName);
  }

  static Future<T> push<T extends Object>(BuildContext context, String routeName, Map<String,Object> params) {
    Widget widget;
    switch(routeName) {
      case INDEX_PAGE_NAME:
        widget = IndexPage(title: params['title']);
        break;
    }
    return widget != null ? Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => widget)) : null;
  }
}