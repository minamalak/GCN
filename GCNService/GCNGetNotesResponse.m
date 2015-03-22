


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

	#import "GCNNote.h"
	#import "GCNGetNotesResponse.h"


@implementation GCNGetNotesResponse

@synthesize GetNotesResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetNotesResult = [[NSMutableArray alloc] init];
		NSObject *GetNotesResultArrRef = nil;
			GetNotesResultArrRef = [dictionary objectForKey:@"GetNotesResult"];

		if([GetNotesResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetNotesResultArr = (NSArray *)GetNotesResultArrRef;
			for(NSDictionary * childObj in GetNotesResultArr) {
				[GetNotesResult addObject:[[GCNNote alloc] initWithData:childObj]];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(GCNNote* childObj in GetNotesResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetNotesResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end