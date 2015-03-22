


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNGetBriefcaseMessages.h"


@implementation GCNGetBriefcaseMessages

@synthesize username;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		NSObject *usernameRef = [dictionary objectForKey:@"username"];
		if([usernameRef isKindOfClass:[NSNull class]]) {  
			self.username = nil;
		}
		else {
			self.username = [dictionary objectForKey: @"username"];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.username forKey:@"username"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?username=%@&", self.username];
}

@end