


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNGetMediaMessageDetails.h"


@implementation GCNGetMediaMessageDetails

@synthesize messageID;
@synthesize isPrivate;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		NSObject *messageIDRef = [dictionary objectForKey:@"messageID"];
		if([messageIDRef isKindOfClass:[NSNull class]]) {  
			self.messageID = nil;
		}
		else {
			self.messageID = [dictionary objectForKey: @"messageID"];
		}
		self.isPrivate = [dictionary objectForKey: @"isPrivate"];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.messageID forKey:@"messageID"];
	[dictionary setValue:self.isPrivate forKey:@"isPrivate"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?messageID=%@&isPrivate=%@&", self.messageID, self.isPrivate ? @"true" : @"false"];
}

@end