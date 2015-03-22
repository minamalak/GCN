


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNSection.h"
#import "GCNMediaMessage.h"

@implementation GCNMediaMessage
@synthesize Date;
@synthesize ID;
@synthesize IsPrivate;
@synthesize Sections;
@synthesize Title;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *DateRef = [dictionary objectForKey:@"Date"];
		if([DateRef isKindOfClass:[NSNull class]]) {
			self.Date = nil;
		}
		else {
			self.Date = [dictionary objectForKey: @"Date"];
		}
						
		NSObject *IDRef = [dictionary objectForKey:@"ID"];
		if([IDRef isKindOfClass:[NSNull class]]) {
			self.ID = nil;
		}
		else {
			self.ID = [dictionary objectForKey: @"ID"];
		}
		self.IsPrivate = [dictionary objectForKey: @"IsPrivate"];
		Sections = [[NSMutableArray alloc] init];
		NSObject *SectionsArrRef = [dictionary objectForKey:@"Sections"];
		if([SectionsArrRef isKindOfClass:[NSArray class]]) {
			NSArray* SectionsArr = (NSArray *)SectionsArrRef;
			for(NSDictionary * childObj in SectionsArr) {
				[Sections addObject:[[GCNSection alloc] initWithData:childObj]];
			}
		}
						
		NSObject *TitleRef = [dictionary objectForKey:@"Title"];
		if([TitleRef isKindOfClass:[NSNull class]]) {
			self.Title = nil;
		}
		else {
			self.Title = [dictionary objectForKey: @"Title"];
		}
	}
	return self;
}

- (NSMutableDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.Date forKey:@"Date"];
	[dictionary setValue:self.ID forKey:@"ID"];
	[dictionary setValue:self.IsPrivate forKey:@"IsPrivate"];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(GCNSection* childObj in Sections) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"Sections"];
	[dictionary setValue:self.Title forKey:@"Title"];
	return dictionary;
}

@end
