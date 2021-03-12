#import "SentryCurrentDateProvider.h"
#import "SentryDefines.h"

@class SentryOptions, SentryCurrentDateProvider;

NS_ASSUME_NONNULL_BEGIN

@interface SentryOutOfMemoryTracker : NSObject
SENTRY_NO_INIT

- (instancetype)initWithOptions:(SentryOptions *)options;

- (void)start;
- (void)stop;

@end

NS_ASSUME_NONNULL_END
