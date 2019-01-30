package com.edgar.flutter.fluttersample;

import android.os.Bundle;

import com.edgar.flutter.fluttersample.api.FlutterApis;

import io.flutter.app.FlutterFragmentActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterFragmentActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    FlutterApis.get(getFlutterView(), getLifecycle());
  }
}