


#import <Foundation/Foundation.h>




@interface GCNAddNote : NSObject {
}

@property (nonatomic, retain) NSString* messageID;
@property (nonatomic, retain) NSString* username;
@property (nonatomic, retain) NSString* noteText;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end