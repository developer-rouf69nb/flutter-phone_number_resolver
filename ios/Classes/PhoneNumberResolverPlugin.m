#import "PhoneNumberResolverPlugin.h"
#import <phone_number_resolver/phone_number_resolver-Swift.h>

@implementation PhoneNumberResolverPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPhoneNumberResolverPlugin registerWithRegistrar:registrar];
}
@end
