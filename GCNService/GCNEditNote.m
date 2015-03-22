


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNEditNote.h"


@implementation GCNEditNote

@synthesize noteID;
@synthesize username;
@synthesize noteText;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		NSObject *noteIDRef = [dictionary objectForKey:@"noteID"];
		if([noteIDRef isKindOfClass:[NSNull class]]) {  
			self.noteID = nil;
		}
		else {
			self.noteID = [dictionary objectForKey: @"noteID"];
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
	[dictionary setValue:self.noteID forKey:@"noteID"];
	[dictionary setValue:self.username forKey:@"username"];
	[dictionary setValue:self.noteText forKey:@"noteText"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?noteID=%@&username=%@&noteText=%@&", self.noteID, self.username, self.noteText];
}

@end