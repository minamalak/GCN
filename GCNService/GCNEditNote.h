


#import <Foundation/Foundation.h>




@interface GCNEditNote : NSObject {
}

@property (nonatomic, retain) NSString* noteID;
@property (nonatomic, retain) NSString* username;
@property (nonatomic, retain) NSString* noteText;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end