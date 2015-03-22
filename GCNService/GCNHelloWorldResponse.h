


#import <Foundation/Foundation.h>




@interface GCNHelloWorldResponse : NSObject {
}

@property (nonatomic, retain) NSString* HelloWorldResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end