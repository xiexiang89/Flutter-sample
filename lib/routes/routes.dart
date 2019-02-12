
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/edit_sample.dart';
import 'package:flutter_sample/index.dart';

class Routes {

  static const String INDEX_PAGE_NAME = '/index_page';
  static const String INPUT_PAGE_NAME = '/input_page';

  static final Map<String, WidgetBuilder> _routes = {
    INPUT_PAGE_NAME: (BuildContext context) => EditSamplePage()
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
    return widget != null ? Navigator.push(context, _createRoute(context, (BuildContext context) => widget)) : null;
  }

  static MaterialPageRoute<T> _createRoute<T extends Object>(BuildContext context, WidgetBuilder builder) {
    return MaterialPageRoute(builder: builder);
  }
}