package com.taishinbank.custom_math;

import androidx.annotation.NonNull;

import java.util.List;
import java.util.logging.Logger;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** CustomMathPlugin */
public class CustomMathPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "custom_math");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

    System.out.println("Java - start to calculate");
    System.out.println(String.format("Java - calculation method is %s", call.method));

    Double mathResult = 0.0;

    List args = (List) call.arguments;
    Double firstNum = (Double) args.get(0);
    Double secondNum = (Double) args.get(1);

    if (call.method.equals("add")) {
      mathResult = firstNum + secondNum;
    } else if (call.method.equals("subtract")) {
      mathResult = firstNum - secondNum;
    } else if (call.method.equals("multiply")) {
      mathResult = firstNum * secondNum;
    } else if (call.method.equals("divide")) {
      mathResult = firstNum / secondNum;
    }

    System.out.println(String.format("Java - calculation result is %s", mathResult));

    result.success(mathResult);
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
