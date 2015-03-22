


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNAddNote.h"


@implementation GCNAddNote

@synthesize messageID;
@synthesize username;
@synthesize noteText;

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
		NSObject *noteTextRef = [dictionary objectForKey:@"noteText"];
		if([noteTextRef isKindOfClass:[NSNull class]]) {  
			self.noteText = nil;
		}
		else {
			self.noteText = [dictionary objectForKey: @"noteText"];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.messageID forKey:@"messageID"];
	[dictionary setValue:self.username forKey:@"username"];
	[dictionary setValue:self.noteText forKey:@"noteText"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?messageID=%@&username=%@&noteText=%@&", self.messageID, self.username, self.noteText];
}

@end