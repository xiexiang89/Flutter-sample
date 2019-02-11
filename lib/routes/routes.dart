
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/edit_sample.dart';

class Routes {

  static Map<String, WidgetBuilder> getRoutes() {
    return <String,WidgetBuilder> {
      '/input_page': (BuildContext context) => EditSamplePage()
    };
  }
}