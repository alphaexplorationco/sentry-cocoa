#import <Foundation/Foundation.h>
#import <SentryOutOfMemoryTracker.h>
#import <SentryOutOfMemoryTrackingIntegration.h>

NS_ASSUME_NONNULL_BEGIN

@interface
SentryOutOfMemoryTrackingIntegration ()

@property (nonatomic, strong) SentryOutOfMemoryTracker *tracker;

@end

@implementation SentryOutOfMemoryTrackingIntegration

- (void)installWithOptions:(SentryOptions *)options
{
    if (options.enableAutoSessionTracking) { }
}

- (void)stop
{
    if (nil != self.tracker) {
        [self.tracker stop];
    }
}

@end

NS_ASSUME_NONNULL_END
