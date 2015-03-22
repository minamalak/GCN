//
//  SettingsController.m
//  MOEW
//
//  Created by Ehab Amer on 4/15/14.
//  Copyright (c) 2014 LinkDev. All rights reserved.
//

#import "SettingsController.h"

@implementation SettingsController

static NSString *currentToken;
static NSString *notificationToken;
static int imageID;

+(void)saveWithKey:(NSString *)key andValue:(id)value
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    [prefs setObject:value forKey:key];
    
    if ([prefs synchronize]) {
        //NSLog(@"%@ saved",key);
    }else {
        NSLog(@"%@ NOT saved",key);
    }
}

+(NSString *)getValueWithKey:(NSString *)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    if (![prefs objectForKey:key]) {
        return @"";
    }
    
    return [prefs objectForKey:key];
}

+(BOOL)isArabic
{
    NSString *val = [self getValueWithKey:@"isArabic"];
    return [val isEqualToString:@"YES"];
}

+(void)setIsArabic:(BOOL)isArabic
{
    if (isArabic) {
        [self saveWithKey:@"isArabic" andValue:@"YES"];
    }else{
        [self saveWithKey:@"isArabic" andValue:@"NO"];
    }
}

+(BOOL)isNotFirstTime
{
    NSString *val = [self getValueWithKey:@"isNotFirstTime"];
    return [val isEqualToString:@"YES"];
}

+(void)setIsNotFirstTime:(BOOL)isNotFirstTime
{
    if (isNotFirstTime) {
        [self saveWithKey:@"isNotFirstTime" andValue:@"YES"];
    }else{
        [self saveWithKey:@"isNotFirstTime" andValue:@"NO"];
    }
}

+(BOOL)hasLanguageSetting
{
    NSString *val = [self getValueWithKey:@"isArabic"];
    
    return !([val isEqualToString:@""]);
}

+(NSString *)getToken
{
    currentToken = [self getValueWithKey:@"UserToken"];
    
    if ([currentToken isEqualToString:@""]) {
        currentToken = nil;
    }
    
    if (currentToken) {
        return currentToken;
    }
//    return @"gcnadmin";
    return @"";
}

+(void)setToken:(NSString *)p_token
{
    currentToken = p_token;
    
    [self saveWithKey:@"UserToken" andValue:currentToken];
}

+(BOOL)isLoggedIn
{
    [self getToken];
    if (currentToken) {
        return YES;
    }
    return NO;
}

+(void)logout
{
    [self saveWithKey:@"UserToken" andValue:@""];
    currentToken = nil;
}

+(void)setDeviceToken:(NSString *)deviceToken
{
    notificationToken = deviceToken;
}

+(NSString *)getDeviceToken
{
    //	return notificationToken;
    return @"1234";
}

+(NSString *)getUsername
{
    return [self getValueWithKey:@"username"];
}

+(NSString *)getPassword
{
    return [self getValueWithKey:@"password"];
}

+(void)setUsername:(NSString *)username
{
    [self saveWithKey:@"username" andValue:username];
    
}

+(void)setPassword:(NSString *)password
{
    [self saveWithKey:@"password" andValue:password];
}

+(void)setDisplayNames:(NSString *)arName :(NSString *)enName
{
    [self saveWithKey:@"userDisplayNameAr" andValue:arName];
    [self saveWithKey:@"userDisplayNameEn" andValue:enName];
}

+(NSString *)getDisplayNameAr
{
    return [self getValueWithKey:@"userDisplayNameAr"];
}

+(NSString *)getDisplayNameEn
{
    return [self getValueWithKey:@"userDisplayNameEn"];
}

+(NSString *) getErrorText :(MessageType) type
{
    NSString *stReturnMessage = @"";
    switch (type) {
        case MessageEmptyUserName:
            stReturnMessage = @"من فضلك ادخل اسم المستخدم";
            break;
        case MessageEmptyPassword:
            stReturnMessage = @"من فضلك ادخل كلمة المرور ";
            break;
        case MessageWrongPassword:
            stReturnMessage = @"كلمة المرور غير صحيحة";
            break;
        case MessageUserDoesNotExist:
            stReturnMessage = @"اسم المستخدم او كلمة المرور غير صحيحة";
            break;
        case MessageBriefCaseAddedSuccessfully:
            stReturnMessage = @"تم اضافة الرسالة الي الحقيبة بنجاح";
            break;
        case MessageBriefcaseAlreadyExist:
            stReturnMessage = @"هذه الرسالة موجودة بالفعل";
            break;
        case MessageBriefCaseServererror:
            stReturnMessage = @"لقد حدث خطأ أثناء الاضافة";
            break;
        case MessageConnectionError:
            stReturnMessage = @"حدث خطأ في الاتصال";
            break;
        case MessageError:
            stReturnMessage = @"لقد حدث خطأ اثناء العملية";
            break;
        case MessageSuccessfulAdded:
            stReturnMessage = @"لقد تم انشاء الرسالة";
            break;
        case MessageSuccessfulDeleted:
            stReturnMessage = @"لقد تم حذف الرسالة";
            break;
        case MessageNoteEmpty:
            stReturnMessage = @"من فضلك ادخل الملاحظة";
            break;
        case MessageNoteSuccessfulAdded:
            stReturnMessage = @"لقد تم اضافة الملاحظة";
            break;
        case MessageNoteSuccessfulDeleted:
            stReturnMessage = @"لقد تم حذف الملاحظة";
            break;
        case MessageNoteSuccessfulUpdated:
            stReturnMessage = @"لقد تم تعديل الملاحظة";
            break;
        case MessageNoItems:
            stReturnMessage = @"لا توجد بيانات";
            break;
        case MessageEmptyFields:
            stReturnMessage = @"من فضلك اكمل البيانات";
            break;
            
        default:
            break;
    }
    return stReturnMessage;
}

@end
