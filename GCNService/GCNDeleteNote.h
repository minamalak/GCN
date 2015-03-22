


#import <Foundation/Foundation.h>




@interface GCNDeleteNote : NSObject {
}

@property (nonatomic, retain) NSString* noteID;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end