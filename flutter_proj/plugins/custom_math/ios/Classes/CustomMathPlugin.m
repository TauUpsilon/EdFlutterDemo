#import "CustomMathPlugin.h"
#if __has_include(<custom_math/custom_math-Swift.h>)
#import <custom_math/custom_math-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "custom_math-Swift.h"
#endif

@implementation CustomMathPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCustomMathPlugin registerWithRegistrar:registrar];
}
@end
