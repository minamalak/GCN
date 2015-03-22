


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNCreatePrivateMediaMessageResponse.h"


@implementation GCNCreatePrivateMediaMessageResponse

@synthesize CreatePrivateMediaMessageResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.CreatePrivateMediaMessageResult = [dictionary objectForKey: @"CreatePrivateMediaMessageResult"];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.CreatePrivateMediaMessageResult forKey:@"CreatePrivateMediaMessageResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?CreatePrivateMediaMessageResult=%@&", self.CreatePrivateMediaMessageResult ? @"true" : @"false"];
}

@end