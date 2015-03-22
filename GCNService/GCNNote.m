


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNNote.h"

@implementation GCNNote
@synthesize Date;
@synthesize ID;
@synthesize MessageID;
@synthesize Owner;
@synthesize Text;

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
						
		NSObject *MessageIDRef = [dictionary objectForKey:@"MessageID"];
		if([MessageIDRef isKindOfClass:[NSNull class]]) {
			self.MessageID = nil;
		}
		else {
			self.MessageID = [dictionary objectForKey: @"MessageID"];
		}
						
		NSObject *OwnerRef = [dictionary objectForKey:@"Owner"];
		if([OwnerRef isKindOfClass:[NSNull class]]) {
			self.Owner = nil;
		}
		else {
			self.Owner = [dictionary objectForKey: @"Owner"];
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
	[dictionary setValue:self.Date forKey:@"Date"];
	[dictionary setValue:self.ID forKey:@"ID"];
	[dictionary setValue:self.MessageID forKey:@"MessageID"];
	[dictionary setValue:self.Owner forKey:@"Owner"];
	[dictionary setValue:self.Text forKey:@"Text"];
	return dictionary;
}

@end
