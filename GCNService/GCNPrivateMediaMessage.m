


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNPrivateMediaMessage.h"

@implementation GCNPrivateMediaMessage
@synthesize Owner;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super initWithData:dictionary]) {
						
		NSObject *OwnerRef = [dictionary objectForKey:@"Owner"];
		if([OwnerRef isKindOfClass:[NSNull class]]) {
			self.Owner = nil;
		}
		else {
			self.Owner = [dictionary objectForKey: @"Owner"];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [super JSONDictionary];
	[dictionary setValue:self.Owner forKey:@"Owner"];
	return dictionary;
}

@end
