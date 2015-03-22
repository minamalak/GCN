


#import <Foundation/Foundation.h>




@interface GCNGetReports : NSObject {
}

@property (nonatomic, retain) NSString* username;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end