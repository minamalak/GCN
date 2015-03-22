


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

	#import "GCNMediaMessage.h"
	#import "GCNGetBriefcaseMessagesResponse.h"


@implementation GCNGetBriefcaseMessagesResponse

@synthesize GetBriefcaseMessagesResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetBriefcaseMessagesResult = [[NSMutableArray alloc] init];
		NSObject *GetBriefcaseMessagesResultArrRef = nil;
			GetBriefcaseMessagesResultArrRef = [dictionary objectForKey:@"GetBriefcaseMessagesResult"];

		if([GetBriefcaseMessagesResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetBriefcaseMessagesResultArr = (NSArray *)GetBriefcaseMessagesResultArrRef;
			for(NSDictionary * childObj in GetBriefcaseMessagesResultArr) {
				[GetBriefcaseMessagesResult addObject:[[GCNMediaMessage alloc] initWithData:childObj]];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(GCNMediaMessage* childObj in GetBriefcaseMessagesResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetBriefcaseMessagesResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end