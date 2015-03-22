


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNSubSection.h"

@implementation GCNSubSection
@synthesize ID;
@synthesize SectionID;
@synthesize Text;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *IDRef = [dictionary objectForKey:@"ID"];
		if([IDRef isKindOfClass:[NSNull class]]) {
			self.ID = nil;
		}
		else {
			self.ID = [dictionary objectForKey: @"ID"];
		}
						
		NSObject *SectionIDRef = [dictionary objectForKey:@"SectionID"];
		if([SectionIDRef isKindOfClass:[NSNull class]]) {
			self.SectionID = nil;
		}
		else {
			self.SectionID = [dictionary objectForKey: @"SectionID"];
		}
						
		NSObject *TextRef = [dictionary objectForKey:@"Text"];
		if([TextRef isKindOfClass:[NSNull class]]) {
			self.Text = nil;
		}
		else {
			self.Text = [dictionary objectForKey: @"Text"];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.ID forKey:@"ID"];
	[dictionary setValue:self.SectionID forKey:@"SectionID"];
	[dictionary setValue:self.Text forKey:@"Text"];
	return dictionary;
}

@end
