package com.edgar.flutter.fluttersample;

import android.os.Bundle;

import com.edgar.flutter.fluttersample.api.FlutterApis;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    FlutterApis.get(getFlutterView());
  }

  @Override
  protected void onDestroy() {
    super.onDestroy();
    FlutterApis.get(getFlutterView()).onDestroy();
  }
}
