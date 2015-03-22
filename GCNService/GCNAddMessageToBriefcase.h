


#import <Foundation/Foundation.h>




@interface GCNAddMessageToBriefcase : NSObject {
}

@property (nonatomic, retain) NSString* messageID;
@property (nonatomic, retain) NSString* username;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end