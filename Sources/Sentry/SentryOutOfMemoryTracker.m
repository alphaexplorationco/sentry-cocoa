#import "SentryFileManager.h"
#import <Foundation/Foundation.h>
#import <SentryClient+Private.h>
#import <SentryHub.h>
#import <SentryOptions.h>
#import <SentryOutOfMemoryTracker.h>
#import <SentrySDK.h>

@interface
SentryOutOfMemoryTracker ()

@property (nonatomic, strong) SentryOptions *options;

@end

@implementation SentryOutOfMemoryTracker : NSObject

- (instancetype)initWithOptions:(SentryOptions *)options
{
    if (self = [super init]) {
        self.options = options;
    }
    return self;
}

- (void)start
{
    SentryFileManager *fileManager = [[[SentrySDK currentHub] getClient] fileManager];

    [fileManager readAppState];

    [SentrySDK captureMessage:@"Out Of Memory"];
}
- (void)stop
{
}

@end
