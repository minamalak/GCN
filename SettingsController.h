//
//  SettingsController.h
//  MOEW
//
//  Created by Ehab Amer on 4/15/14.
//  Copyright (c) 2014 LinkDev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    MessageEmptyUserName = 1,
    MessageEmptyPassword = 2,
    MessageWrongPassword = 3,
    MessageUserDoesNotExist = 4,
    MessageBriefCaseAddedSuccessfully = 5,
    MessageBriefcaseAlreadyExist = 6,
    MessageBriefCaseServererror = 7,
    MessageConnectionError = 8,
    MessageSuccessfulAdded = 9,
    MessageSuccessfulDeleted = 10,
    MessageError = 11,
    MessageNoteSuccessfulAdded = 12,
    MessageNoteSuccessfulDeleted = 13,
    MessageNoteSuccessfulUpdated = 14,
    MessageNoteEmpty = 15,
    MessageNoItems = 16,
    MessageEmptyFields = 17
} MessageType;

@interface SettingsController : NSObject
{
	
}

+(void)saveWithKey:(NSString *)key andValue:(id)value;
+(NSString *)getValueWithKey:(NSString *)key;

+(BOOL)isArabic;
+(void)setIsArabic:(BOOL)isArabic;
+(BOOL)hasLanguageSetting;
+(NSString *)getToken;
+(void)setToken:(NSString *)p_token;
+(BOOL)isLoggedIn;
+(void)logout;
+(void)setDeviceToken:(NSString *)deviceToken;
+(NSString *)getDeviceToken;

+(void)setIsNotFirstTime:(BOOL)isNotFirstTime;
+(BOOL)isNotFirstTime;

+(NSString *)getUsername;
+(NSString *)getPassword;
+(void)setUsername:(NSString *)username;
+(void)setPassword:(NSString *)password;

+(void)setDisplayNames:(NSString *)arName :(NSString *)enName;
+(NSString *)getDisplayNameAr;
+(NSString *)getDisplayNameEn;

+(NSString *) getErrorText :(MessageType) type;
@end
