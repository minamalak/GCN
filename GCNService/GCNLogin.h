


#import <Foundation/Foundation.h>




@interface GCNLogin : NSObject {
}

@property (nonatomic, retain) NSString* username;
@property (nonatomic, retain) NSString* password;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end