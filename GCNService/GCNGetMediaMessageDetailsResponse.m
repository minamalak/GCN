


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

	#import "GCNMediaMessage.h"
	#import "GCNGetMediaMessageDetailsResponse.h"


@implementation GCNGetMediaMessageDetailsResponse

@synthesize GetMediaMessageDetailsResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		NSObject *GetMediaMessageDetailsResultRef = [dictionary objectForKey:@"GetMediaMessageDetailsResult"];
		if([GetMediaMessageDetailsResultRef isKindOfClass:[NSNull class]]) {  
			self.GetMediaMessageDetailsResult = nil;
		}
		else {
			self.GetMediaMessageDetailsResult = [[GCNMediaMessage alloc] initWithData:[dictionary objectForKey: @"GetMediaMessageDetailsResult"]];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[self.GetMediaMessageDetailsResult JSONDictionary] forKey:@"GetMediaMessageDetailsResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?=&"];
}

@end