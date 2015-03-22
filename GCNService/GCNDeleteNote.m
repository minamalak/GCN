


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNDeleteNote.h"


@implementation GCNDeleteNote

@synthesize noteID;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		NSObject *noteIDRef = [dictionary objectForKey:@"noteID"];
		if([noteIDRef isKindOfClass:[NSNull class]]) {  
			self.noteID = nil;
		}
		else {
			self.noteID = [dictionary objectForKey: @"noteID"];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.noteID forKey:@"noteID"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?noteID=%@&", self.noteID];
}

@end