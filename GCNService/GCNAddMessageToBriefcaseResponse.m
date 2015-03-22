


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNAddMessageToBriefcaseResponse.h"


@implementation GCNAddMessageToBriefcaseResponse

@synthesize AddMessageToBriefcaseResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.AddMessageToBriefcaseResult = [[dictionary objectForKey: @"AddMessageToBriefcaseResult"] intValue];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[NSNumber numberWithInt:self.AddMessageToBriefcaseResult] forKey:@"AddMessageToBriefcaseResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?AddMessageToBriefcaseResult=%d&", self.AddMessageToBriefcaseResult];
}

@end