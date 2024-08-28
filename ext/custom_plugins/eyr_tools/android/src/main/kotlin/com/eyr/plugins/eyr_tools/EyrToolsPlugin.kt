package com.eyr.plugins.eyr_tools

import android.annotation.SuppressLint
import android.os.Handler
import android.os.Looper
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.text.SimpleDateFormat
import java.util.Date

/** EyrToolsPlugin */
class EyrToolsPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(binding.binaryMessenger, "eyr_tools")
    channel.setMethodCallHandler(this)

    EventChannel(binding.binaryMessenger, "eyr_tools_on_the_air")
      .setStreamHandler(OnTheAirHandler)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  object OnTheAirHandler : EventChannel.StreamHandler {
    // Handle event in main thread.
    private var handler = Handler(Looper.getMainLooper())

    // Declare our eventSink later it will be initialized
    private var eventSink: EventChannel.EventSink? = null

    @SuppressLint("SimpleDateFormat")
    override fun onListen(p0: Any?, sink: EventChannel.EventSink) {
      eventSink = sink

      // every second send the time
      val r: Runnable = object : Runnable {
        override fun run() {
          handler.post {
            val dateFormat = SimpleDateFormat("HH:mm:ss")
            val time = dateFormat.format(Date())
            eventSink?.success(time)
          }
          handler.postDelayed(this, 1000)
        }
      }
      handler.postDelayed(r, 1000)
    }

    override fun onCancel(p0: Any?) {
      handler.removeCallbacksAndMessages(null)
      eventSink = null
    }
  }
}
