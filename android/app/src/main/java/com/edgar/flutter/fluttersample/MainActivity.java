package com.edgar.flutter.fluttersample;

import android.os.Bundle;
import android.util.Log;

import com.edgar.flutter.fluttersample.utils.FlutterArguments;

import java.nio.ByteBuffer;
import java.util.Map;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.JSONMessageCodec;
import io.flutter.plugin.common.JSONMethodCodec;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    new MethodChannel(getFlutterView(),"nativeApi").setMethodCallHandler(new MethodChannel.MethodCallHandler() {
      @Override
      public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        if (methodCall.method.equals("log")) {
          Log.e("MainActivity",""+FlutterArguments.Factory.create(methodCall.arguments).get(0));
        }
      }
    });
  }
}
