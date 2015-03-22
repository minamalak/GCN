


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNDeletePrivateMediaMessageResponse.h"


@implementation GCNDeletePrivateMediaMessageResponse

@synthesize DeletePrivateMediaMessageResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.DeletePrivateMediaMessageResult = [dictionary objectForKey: @"DeletePrivateMediaMessageResult"];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.DeletePrivateMediaMessageResult forKey:@"DeletePrivateMediaMessageResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?DeletePrivateMediaMessageResult=%@&", self.DeletePrivateMediaMessageResult ? @"true" : @"false"];
}

@end