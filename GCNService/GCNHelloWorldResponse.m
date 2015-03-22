


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNHelloWorldResponse.h"


@implementation GCNHelloWorldResponse

@synthesize HelloWorldResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		NSObject *HelloWorldResultRef = [dictionary objectForKey:@"HelloWorldResult"];
		if([HelloWorldResultRef isKindOfClass:[NSNull class]]) {  
			self.HelloWorldResult = nil;
		}
		else {
			self.HelloWorldResult = [dictionary objectForKey: @"HelloWorldResult"];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.HelloWorldResult forKey:@"HelloWorldResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?HelloWorldResult=%@&", self.HelloWorldResult];
}

@end