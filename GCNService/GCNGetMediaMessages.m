


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNGetMediaMessages.h"


@implementation GCNGetMediaMessages


- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end