


#import <Foundation/Foundation.h>
#import "WebServiceEntities.h"

#import "GCNSpokesperson.h"

@implementation GCNSpokesperson
@synthesize Category;
@synthesize Email;
@synthesize ID;
@synthesize JobTitle;
@synthesize MobileNumber;
@synthesize Name;
@synthesize WorkNumber;

- (id)initWithData: (NSDictionary *)dictionary {
	if(self = [super init]) {
						
		NSObject *CategoryRef = [dictionary objectForKey:@"Category"];
		if([CategoryRef isKindOfClass:[NSNull class]]) {
			self.Category = nil;
		}
		else {
			self.Category = [dictionary objectForKey: @"Category"];
		}
						
		NSObject *EmailRef = [dictionary objectForKey:@"Email"];
		if([EmailRef isKindOfClass:[NSNull class]]) {
			self.Email = nil;
		}
		else {
			self.Email = [dictionary objectForKey: @"Email"];
		}
						
		NSObject *IDRef = [dictionary objectForKey:@"ID"];
		if([IDRef isKindOfClass:[NSNull class]]) {
			self.ID = nil;
		}
		else {
			self.ID = [dictionary objectForKey: @"ID"];
		}
						
		NSObject *JobTitleRef = [dictionary objectForKey:@"JobTitle"];
		if([JobTitleRef isKindOfClass:[NSNull class]]) {
			self.JobTitle = nil;
		}
		else {
			self.JobTitle = [dictionary objectForKey: @"JobTitle"];
		}
						
		NSObject *MobileNumberRef = [dictionary objectForKey:@"MobileNumber"];
		if([MobileNumberRef isKindOfClass:[NSNull class]]) {
			self.MobileNumber = nil;
		}
		else {
			self.MobileNumber = [dictionary objectForKey: @"MobileNumber"];
		}
						
		NSObject *NameRef = [dictionary objectForKey:@"Name"];
		if([NameRef isKindOfClass:[NSNull class]]) {
			self.Name = nil;
		}
		else {
			self.Name = [dictionary objectForKey: @"Name"];
		}
						
		NSObject *WorkNumberRef = [dictionary objectForKey:@"WorkNumber"];
		if([WorkNumberRef isKindOfClass:[NSNull class]]) {
			self.WorkNumber = nil;
		}
		else {
			self.WorkNumber = [dictionary objectForKey: @"WorkNumber"];
		}
	}
	return self;
}

- (NSDictionary *)JSONDictionary {
	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	[dictionary setValue:self.Category forKey:@"Category"];
	[dictionary setValue:self.Email forKey:@"Email"];
	[dictionary setValue:self.ID forKey:@"ID"];
	[dictionary setValue:self.JobTitle forKey:@"JobTitle"];
	[dictionary setValue:self.MobileNumber forKey:@"MobileNumber"];
	[dictionary setValue:self.Name forKey:@"Name"];
	[dictionary setValue:self.WorkNumber forKey:@"WorkNumber"];
	return dictionary;
}

@end
