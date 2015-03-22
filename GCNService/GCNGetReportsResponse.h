


#import <Foundation/Foundation.h>


	@class GCNReport;
	

@interface GCNGetReportsResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetReportsResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end