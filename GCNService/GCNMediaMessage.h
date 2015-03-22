


#import <Foundation/Foundation.h>

@class GCNSection;


@interface GCNMediaMessage : NSObject {
}

@property (nonatomic, retain) NSString* Date;
@property (nonatomic, retain) NSString* ID;
@property (nonatomic, retain) NSNumber* IsPrivate;
@property (nonatomic, retain) NSMutableArray* Sections;
@property (nonatomic, retain) NSString* Title;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSMutableDictionary *)JSONDictionary;

@end
