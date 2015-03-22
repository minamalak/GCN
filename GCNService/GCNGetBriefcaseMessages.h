


#import <Foundation/Foundation.h>




@interface GCNGetBriefcaseMessages : NSObject {
}

@property (nonatomic, retain) NSString* username;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end