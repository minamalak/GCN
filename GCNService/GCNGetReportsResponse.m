


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

	#import "GCNReport.h"
	#import "GCNGetReportsResponse.h"


@implementation GCNGetReportsResponse

@synthesize GetReportsResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetReportsResult = [[NSMutableArray alloc] init];
		NSObject *GetReportsResultArrRef = nil;
			GetReportsResultArrRef = [dictionary objectForKey:@"GetReportsResult"];

		if([GetReportsResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetReportsResultArr = (NSArray *)GetReportsResultArrRef;
			for(NSDictionary * childObj in GetReportsResultArr) {
				[GetReportsResult addObject:[[GCNReport alloc] initWithData:childObj]];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(GCNReport* childObj in GetReportsResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetReportsResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end