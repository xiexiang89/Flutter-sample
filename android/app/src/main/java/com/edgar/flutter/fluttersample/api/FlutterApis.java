package com.edgar.flutter.fluttersample.api;

import android.os.Build;
import android.util.Log;

import com.edgar.flutter.fluttersample.utils.FlutterArguments;

import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class FlutterApis implements MethodChannel.MethodCallHandler {

    private static final String API_NAME = "native_api";
    private static final Map<BinaryMessenger, FlutterApis> sNativeApiMap = new HashMap<>();

    public static FlutterApis get(BinaryMessenger messenger) {
        synchronized (sNativeApiMap) {
            FlutterApis api = sNativeApiMap.get(messenger);
            if (api == null) {
                api = new FlutterApis(messenger);
                sNativeApiMap.put(messenger,api);
            }
            return api;
        }
    }

    private final WeakReference<BinaryMessenger> mBinaryMessengerRef;
    private final MethodChannel mMethodChannel;

    private FlutterApis(BinaryMessenger messenger) {
        mBinaryMessengerRef = new WeakReference<>(messenger);
        mMethodChannel = new MethodChannel(messenger, API_NAME);
        mMethodChannel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        if (methodCall.method.equals("log")) {
            Log.e("MainActivity",""+FlutterArguments.Factory.create(methodCall.arguments).get(0));
        } else if (methodCall.method.equals("getPhoneModel")) {
            result.success(Build.MODEL);
        }
    }

    public void onDestroy() {
        sNativeApiMap.remove(mBinaryMessengerRef.get());
    }
}