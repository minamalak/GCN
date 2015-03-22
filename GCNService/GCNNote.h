


#import <Foundation/Foundation.h>



@interface GCNNote : NSObject {
}

@property (nonatomic, retain) NSString* Date;
@property (nonatomic, retain) NSString* ID;
@property (nonatomic, retain) NSString* MessageID;
@property (nonatomic, retain) NSString* Owner;
@property (nonatomic, retain) NSString* Text;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
