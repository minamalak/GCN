


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNLoginResponse.h"


@implementation GCNLoginResponse

@synthesize LoginResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.LoginResult = [[dictionary objectForKey: @"LoginResult"] intValue];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:[NSNumber numberWithInt:self.LoginResult] forKey:@"LoginResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?LoginResult=%d&", self.LoginResult];
}

@end