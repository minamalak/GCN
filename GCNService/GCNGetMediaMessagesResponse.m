


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

	#import "GCNMediaMessage.h"
	#import "GCNGetMediaMessagesResponse.h"


@implementation GCNGetMediaMessagesResponse

@synthesize GetMediaMessagesResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetMediaMessagesResult = [[NSMutableArray alloc] init];
		NSObject *GetMediaMessagesResultArrRef = nil;
			GetMediaMessagesResultArrRef = [dictionary objectForKey:@"GetMediaMessagesResult"];

		if([GetMediaMessagesResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetMediaMessagesResultArr = (NSArray *)GetMediaMessagesResultArrRef;
			for(NSDictionary * childObj in GetMediaMessagesResultArr) {
				[GetMediaMessagesResult addObject:[[GCNMediaMessage alloc] initWithData:childObj]];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(GCNMediaMessage* childObj in GetMediaMessagesResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetMediaMessagesResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end