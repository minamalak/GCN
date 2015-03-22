


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNGetSpokespersons.h"


@implementation GCNGetSpokespersons


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