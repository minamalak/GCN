


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNAddNoteResponse.h"


@implementation GCNAddNoteResponse

@synthesize AddNoteResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.AddNoteResult = [dictionary objectForKey: @"AddNoteResult"];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.AddNoteResult forKey:@"AddNoteResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?AddNoteResult=%@&", self.AddNoteResult ? @"true" : @"false"];
}

@end