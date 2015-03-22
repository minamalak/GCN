


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNDeletePrivateMediaMessage.h"


@implementation GCNDeletePrivateMediaMessage

@synthesize messageID;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		NSObject *messageIDRef = [dictionary objectForKey:@"messageID"];
		if([messageIDRef isKindOfClass:[NSNull class]]) {  
			self.messageID = nil;
		}
		else {
			self.messageID = [dictionary objectForKey: @"messageID"];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.messageID forKey:@"messageID"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?messageID=%@&", self.messageID];
}

@end