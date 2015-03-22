


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNDeleteNoteResponse.h"


@implementation GCNDeleteNoteResponse

@synthesize DeleteNoteResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.DeleteNoteResult = [dictionary objectForKey: @"DeleteNoteResult"];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.DeleteNoteResult forKey:@"DeleteNoteResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?DeleteNoteResult=%@&", self.DeleteNoteResult ? @"true" : @"false"];
}

@end