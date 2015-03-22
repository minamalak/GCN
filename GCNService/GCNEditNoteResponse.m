


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNEditNoteResponse.h"


@implementation GCNEditNoteResponse

@synthesize EditNoteResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		self.EditNoteResult = [dictionary objectForKey: @"EditNoteResult"];
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.EditNoteResult forKey:@"EditNoteResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?EditNoteResult=%@&", self.EditNoteResult ? @"true" : @"false"];
}

@end