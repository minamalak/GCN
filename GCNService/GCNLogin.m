


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNLogin.h"


@implementation GCNLogin

@synthesize username;
@synthesize password;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		NSObject *usernameRef = [dictionary objectForKey:@"username"];
		if([usernameRef isKindOfClass:[NSNull class]]) {  
			self.username = nil;
		}
		else {
			self.username = [dictionary objectForKey: @"username"];
		}
		NSObject *passwordRef = [dictionary objectForKey:@"password"];
		if([passwordRef isKindOfClass:[NSNull class]]) {  
			self.password = nil;
		}
		else {
			self.password = [dictionary objectForKey: @"password"];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.username forKey:@"username"];
	[dictionary setValue:self.password forKey:@"password"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?username=%@&password=%@&", self.username, self.password];
}

@end