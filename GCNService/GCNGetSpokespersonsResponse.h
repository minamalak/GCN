


#import <Foundation/Foundation.h>


	@class GCNSpokesperson;
	

@interface GCNGetSpokespersonsResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetSpokespersonsResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end