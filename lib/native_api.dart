
import 'package:flutter/services.dart';

class NativeApi {

  static const String _METHOD_CHANNEL = 'native_api';
  static NativeApi _instance;
  static NativeApi get instance => _getInstance();

  static NativeApi _getInstance() {
    if (_instance == null) {
      _instance = NativeApi._();
    }
    return _instance;
  }

  NativeApi._();

  final MethodChannel _methodChannel = MethodChannel(_METHOD_CHANNEL);

  Future<String> getPhoneModel() async {
    String phoneModel = await _methodChannel.invokeMethod('getPhoneModel');
    return phoneModel;
  }
}
