import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

  private let liveActivityManager: LiveActivityManager = LiveActivityManager()

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let diChannel =  FlutterMethodChannel(name: "DI", binaryMessenger: controller.binaryMessenger)

    diChannel.setMethodCallHandler({ [weak self] (
           call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                switch call.method {
                case "startLiveActivity":
                    self?.liveActivityManager.startLiveActivity(
                        data: call.arguments as? Dictionary<String,Any>,
                        result: result)
                    break
                    
                case "updateLiveActivity":
                    self?.liveActivityManager.updateLiveActivity(
                        data: call.arguments as? Dictionary<String,Any>,
                        result: result)
                    break
                    
                case "stopLiveActivity":
                    self?.liveActivityManager.stopLiveActivity(result: result)
                    break
                    
                default:
                    result(FlutterMethodNotImplemented)
            }
       })


    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
