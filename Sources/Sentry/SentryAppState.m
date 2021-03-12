#import <Foundation/Foundation.h>
#import <SentryAppState.h>

@implementation SentryAppState

- (instancetype)initWithAppVersion:(NSString *)appVersion osVersion:(NSString *)osVersion;
{
    if (self = [super init]) {
        _appVersion = appVersion;
        _osVersion = osVersion;
    }
    return self;
}

- (nullable instancetype)initWithJSONObject:(NSDictionary *)jsonObject
{
    if (self = [super init]) {
        id appVersion = [jsonObject valueForKey:@"app_version"];
        if (appVersion == nil || ![appVersion isKindOfClass:[NSString class]]) {
            return nil;
        } else {
            _appVersion = appVersion;
        }

        id osVersion = [jsonObject valueForKey:@"os_version"];
        if (osVersion == nil || ![osVersion isKindOfClass:[NSString class]]) {
            return nil;
        } else {
            _osVersion = osVersion;
        }
    }
    return self;
}

- (NSDictionary<NSString *, id> *)serialize
{
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];

    [data setValue:self.appVersion forKey:@"app_version"];
    [data setValue:self.osVersion forKey:@"os_version"];

    return data;
}

@end
