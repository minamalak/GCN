


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNReport.h"

@implementation GCNReport
@synthesize Description;
@synthesize ID;
@synthesize PdfURL;
@synthesize Title;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *DescriptionRef = [dictionary objectForKey:@"Description"];
		if([DescriptionRef isKindOfClass:[NSNull class]]) {
			self.Description = nil;
		}
		else {
			self.Description = [dictionary objectForKey: @"Description"];
		}
						
		NSObject *IDRef = [dictionary objectForKey:@"ID"];
		if([IDRef isKindOfClass:[NSNull class]]) {
			self.ID = nil;
		}
		else {
			self.ID = [dictionary objectForKey: @"ID"];
		}
						
		NSObject *PdfURLRef = [dictionary objectForKey:@"PdfURL"];
		if([PdfURLRef isKindOfClass:[NSNull class]]) {
			self.PdfURL = nil;
		}
		else {
			self.PdfURL = [dictionary objectForKey: @"PdfURL"];
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

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.Description forKey:@"Description"];
	[dictionary setValue:self.ID forKey:@"ID"];
	[dictionary setValue:self.PdfURL forKey:@"PdfURL"];
	[dictionary setValue:self.Title forKey:@"Title"];
	return dictionary;
}

@end
