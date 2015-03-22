


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNRemoveMessageFromBriefcaseResponse.h"


@implementation GCNRemoveMessageFromBriefcaseResponse

@synthesize RemoveMessageFromBriefcaseResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.RemoveMessageFromBriefcaseResult = [dictionary objectForKey: @"RemoveMessageFromBriefcaseResult"];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.RemoveMessageFromBriefcaseResult forKey:@"RemoveMessageFromBriefcaseResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?RemoveMessageFromBriefcaseResult=%@&", self.RemoveMessageFromBriefcaseResult ? @"true" : @"false"];
}

@end