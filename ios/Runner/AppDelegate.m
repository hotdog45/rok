#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
//通信标识
#define ChannelName    @"hh://MethodChannelPlugin"
//打开人脸识别页面
#define OPEN_FACE_LIVE_PAGE    @"hh://openFaceLivePage"
//打开视频监控页面
#define OPEN_CAMERA_PAGE    @"hh://openCameraPage"
//人脸识别回调
#define FACE_PATH    @"hh://facePath"


@implementation AppDelegate{
    FlutterMethodChannel* _channel;
}

/// <#Description#>
/// @param application <#application description#>
/// @param launchOptions <#launchOptions description#>
- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    
    //注册通知
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationFuncion:) name:@"ios.to.flutter" object:nil];
       

    FlutterViewController* controller =
            (FlutterViewController*)self.window.rootViewController;
    
     _channel = [FlutterMethodChannel
            methodChannelWithName:ChannelName
                  binaryMessenger:controller];
//        __weak typeof(self) weakSelf = self;
    [_channel setMethodCallHandler:^(FlutterMethodCall* call,
                                               FlutterResult result) {
        NSLog(@"call.method: %@",call.method);
      if ([OPEN_FACE_LIVE_PAGE isEqualToString:call.method]) {
          
          NSLog(@"打开人脸识别页面: %@",call.arguments);
          [_channel invokeMethod:FACE_PATH arguments:@"44444444444"];
          result(@"");
        
      } else if ([OPEN_CAMERA_PAGE isEqualToString:call.method]) {
         [_channel invokeMethod:FACE_PATH arguments:@"111111333333331111111"];
          NSLog(@"打开视频监控页面: %@",call.arguments);
          result(@"");
        
      } else{
        result(FlutterMethodNotImplemented);
      }
    }];
     [_channel invokeMethod:FACE_PATH arguments:@"1111111111111"];
    
    
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
- (void)notificationFuncion: (NSNotification *) notification {
    // iOS 中其他页面向Flutter 中发送消息通过这里
    NSString *info = [notification object];
    NSLog(@"接收 object传递的消息：%@",info);
    [_channel invokeMethod:FACE_PATH arguments:info];

    
}

- (void)dealloc {
    //单条移除观察者
    //[[NSNotificationCenter defaultCenter] removeObserver:self name:@"REFRESH_TABLEVIEW" object:nil];
    //移除所有观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
