package com.edgar.flutter.fluttersample.api;

import android.arch.lifecycle.Lifecycle;
import android.arch.lifecycle.LifecycleObserver;
import android.arch.lifecycle.OnLifecycleEvent;
import android.os.Build;
import android.util.Log;

import com.edgar.flutter.fluttersample.utils.FlutterArguments;

import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class FlutterApis implements MethodChannel.MethodCallHandler, LifecycleObserver {

    private static final String TAG = "FlutterApis";
    private static final String API_NAME = "native_api";
    private static final Map<BinaryMessenger, FlutterApis> NATIVE_API_MAP = new HashMap<>();

    public static FlutterApis get(BinaryMessenger messenger, Lifecycle lifecycle) {
        synchronized (NATIVE_API_MAP) {
            FlutterApis api = NATIVE_API_MAP.get(messenger);
            if (api == null) {
                api = new FlutterApis(messenger,lifecycle);
                NATIVE_API_MAP.put(messenger,api);
            }
            return api;
        }
    }

    public static FlutterApis peek(BinaryMessenger messenger) {
        synchronized (NATIVE_API_MAP) {
            return NATIVE_API_MAP.get(messenger);
        }
    }

    private final WeakReference<BinaryMessenger> mBinaryMessengerRef;
    private final MethodChannel mMethodChannel;

    private FlutterApis(BinaryMessenger messenger, Lifecycle lifecycle) {
        mBinaryMessengerRef = new WeakReference<>(messenger);
        mMethodChannel = new MethodChannel(messenger, API_NAME);
        mMethodChannel.setMethodCallHandler(this);
        lifecycle.addObserver(this);
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        if (methodCall.method.equals("log")) {
            Log.e(TAG,""+FlutterArguments.Factory.create(methodCall.arguments).get(0));
        } else if (methodCall.method.equals("getPhoneModel")) {
            result.success(Build.MODEL);
        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_DESTROY)
    public void onDestroy() {
        NATIVE_API_MAP.remove(mBinaryMessengerRef.get());
    }
}