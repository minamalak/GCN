


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNSubSection.h"
#import "GCNSection.h"

@implementation GCNSection
@synthesize ID;
@synthesize MessageID;
@synthesize SubSections;
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
						
		NSObject *MessageIDRef = [dictionary objectForKey:@"MessageID"];
		if([MessageIDRef isKindOfClass:[NSNull class]]) {
			self.MessageID = nil;
		}
		else {
			self.MessageID = [dictionary objectForKey: @"MessageID"];
		}
		SubSections = [[NSMutableArray alloc] init];
		NSObject *SubSectionsArrRef = [dictionary objectForKey:@"SubSections"];
		if([SubSectionsArrRef isKindOfClass:[NSArray class]]) {
			NSArray* SubSectionsArr = (NSArray *)SubSectionsArrRef;
			for(NSDictionary * childObj in SubSectionsArr) {
				[SubSections addObject:[[GCNSubSection alloc] initWithData:childObj]];
			}
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
	[dictionary setValue:self.MessageID forKey:@"MessageID"];
	NSMutableArray *arr = nil;
	arr = [[NSMutableArray alloc] init];
	for(GCNSubSection* childObj in SubSections) {
		[arr addObject:[childObj JSONDictionary]];
	}
	[dictionary setValue:arr forKey:@"SubSections"];
	[dictionary setValue:self.Text forKey:@"Text"];
	return dictionary;
}

@end
