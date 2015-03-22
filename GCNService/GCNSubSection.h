


#import <Foundation/Foundation.h>



@interface GCNSubSection : NSObject {
}

@property (nonatomic, retain) NSString* ID;
@property (nonatomic, retain) NSString* SectionID;
@property (nonatomic, retain) NSString* Text;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
