
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/base_page.dart';
import 'package:flutter_sample/res.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditSamplePage extends BasicPage<_EditSampleState> {

  EditSamplePage():super(title: 'Edit Sample');

  @override
  _EditSampleState createBaseUiState() => _EditSampleState();
}

class _EditSampleState extends BasePageState {

  @override
  Widget createBody() {
    return Container(padding: EdgeInsets.only(left: 20,right: 20),
        child: TextField(onChanged: (String text) => this._onInputChanged(text),decoration: InputDecoration(hintText: ResStr.HINT_TEXT)));
  }
  
  void _onInputChanged(String text) {
    Fluttertoast.showToast(msg: text,fontSize: 10);
  }
}