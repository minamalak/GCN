


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

	#import "GCNSpokesperson.h"
	#import "GCNGetSpokespersonsResponse.h"


@implementation GCNGetSpokespersonsResponse

@synthesize GetSpokespersonsResult;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
		GetSpokespersonsResult = [[NSMutableArray alloc] init];
		NSObject *GetSpokespersonsResultArrRef = nil;
			GetSpokespersonsResultArrRef = [dictionary objectForKey:@"GetSpokespersonsResult"];

		if([GetSpokespersonsResultArrRef isKindOfClass:[NSArray class]]) {
			NSArray* GetSpokespersonsResultArr = (NSArray *)GetSpokespersonsResultArrRef;
			for(NSDictionary * childObj in GetSpokespersonsResultArr) {
				[GetSpokespersonsResult addObject:[[GCNSpokesperson alloc] initWithData:childObj]];
			}
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(GCNSpokesperson* childObj in GetSpokespersonsResult) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"GetSpokespersonsResult"];
	return dictionary;
}

- (NSString *)requestGETParams {
	return [NSString stringWithFormat:@"?"];
}

@end