


#import <Foundation/Foundation.h>




@interface GCNGetMediaMessageDetails : NSObject {
}

@property (nonatomic, retain) NSString* messageID;
@property (nonatomic, retain) NSNumber* isPrivate;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end