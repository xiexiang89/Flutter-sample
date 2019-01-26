package com.edgar.flutter.fluttersample.utils;

import java.util.List;
import java.util.Map;

/**
 * Created by Edgar on 2019/1/26.
 */
public interface FlutterArguments {

    default Object get() { return null; }
    default Object get(String name) { return null; }
    default Object get(int index) { return null; }

    class Factory {
        public static FlutterArguments create(Object arguments) {
            if (arguments instanceof List) {
                return new FlutterArrayArguments((List<Object>) arguments);
            } else if (arguments instanceof Map) {
                return new FlutterMapArguments((Map<String,Object>) arguments);
            } else {
                return new DefaultArguments(arguments);
            }
        }
    }

    class DefaultArguments implements FlutterArguments {
        private Object arguments;

        private DefaultArguments(Object arguments) {
            this.arguments = arguments;
        }

        @Override
        public Object get() {
            return arguments;
        }
    }

    class FlutterMapArguments implements FlutterArguments {

        private Map<String,Object> argumentMap;

        private FlutterMapArguments(Map<String,Object> argumentMap) {
            this.argumentMap = argumentMap;
        }

        @Override
        public Object get(String name) {
            return argumentMap.get(name);
        }
    }

    class FlutterArrayArguments implements FlutterArguments {

        private List<Object> argumentList;

        private FlutterArrayArguments(List<Object> argumentList) {
            this.argumentList = argumentList;
        }

        @Override
        public Object get(int index) {
            return argumentList.get(index);
        }
    }
}