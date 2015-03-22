


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

	#import "GCNPrivateMediaMessage.h"
	#import "GCNCreatePrivateMediaMessage.h"


@implementation GCNCreatePrivateMediaMessage

@synthesize privateMessage;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		NSObject *privateMessageRef = [dictionary objectForKey:@"privateMessage"];
		if([privateMessageRef isKindOfClass:[NSNull class]]) {  
			self.privateMessage = nil;
		}
		else {
			self.privateMessage = [[GCNPrivateMediaMessage alloc] initWithData:[dictionary objectForKey: @"privateMessage"]];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[self.privateMessage JSONDictionary] forKey:@"privateMessage"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?=&"];
}

@end