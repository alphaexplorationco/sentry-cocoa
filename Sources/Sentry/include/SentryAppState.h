#import "SentryDefines.h"
#import "SentrySerializable.h"

NS_ASSUME_NONNULL_BEGIN

@interface SentryAppState : NSObject <SentrySerializable>
SENTRY_NO_INIT

- (instancetype)initWithAppVersion:(NSString *)appVersion osVersion:(NSString *)osVersion;

/**
 * Initializes SentryAppState from a JSON object.
 *
 * @param jsonObject The jsonObject containing the session.
 *
 * @return The SentrySession or nil if the JSONObject contains an error.
 */
- (nullable instancetype)initWithJSONObject:(NSDictionary *)jsonObject;

@property (readonly, nonatomic, strong) NSString *appVersion;

@property (readonly, nonatomic, strong) NSString *osVersion;

@end

NS_ASSUME_NONNULL_END
