import Flutter
import UIKit

public class SwiftCustomMathPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "custom_math", binaryMessenger: registrar.messenger())
        let instance = SwiftCustomMathPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        print("Swift - start to calculate")
        print("Swift - calculation mehtod is \(call.method)")
        
        var mathResult = 0.0
        
        let args = call.arguments as! [Double]
        let firstNum = args[0]
        let secondNum = args[1]
        
        switch call.method {
            case "add":
                mathResult = firstNum + secondNum
            case "subtract":
                mathResult = firstNum - secondNum
            case "multiply":
                mathResult = firstNum * secondNum
            case "divide":
                mathResult = firstNum / secondNum
            default:
                break
        }
        
        print("Swift - calculation result is \(mathResult)")
        
        result(mathResult)
    }
}
