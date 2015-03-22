


#import <Foundation/Foundation.h>

@class GCNSubSection;


@interface GCNSection : NSObject {
}

@property (nonatomic, retain) NSString* ID;
@property (nonatomic, retain) NSString* MessageID;
@property (nonatomic, retain) NSMutableArray* SubSections;
@property (nonatomic, retain) NSString* Text;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
