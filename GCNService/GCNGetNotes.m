


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNGetNotes.h"


@implementation GCNGetNotes

@synthesize messageID;
@synthesize username;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		NSObject *messageIDRef = [dictionary objectForKey:@"messageID"];
		if([messageIDRef isKindOfClass:[NSNull class]]) {  
			self.messageID = nil;
		}
		else {
			self.messageID = [dictionary objectForKey: @"messageID"];
		}
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
	[dictionary setValue:self.messageID forKey:@"messageID"];
	[dictionary setValue:self.username forKey:@"username"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?messageID=%@&username=%@&", self.messageID, self.username];
}

@end