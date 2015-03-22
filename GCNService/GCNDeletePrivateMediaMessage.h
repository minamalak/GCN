


#import <Foundation/Foundation.h>




@interface GCNDeletePrivateMediaMessage : NSObject {
}

@property (nonatomic, retain) NSString* messageID;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end