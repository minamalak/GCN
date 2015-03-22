


#import <Foundation/Foundation.h>


	#import "GCNBriefcaseStatus.h"
	

@interface GCNAddMessageToBriefcaseResponse : NSObject {
}

@property (nonatomic) GCNBriefcaseStatus AddMessageToBriefcaseResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end