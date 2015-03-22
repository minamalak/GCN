


#import <Foundation/Foundation.h>



@interface GCNSpokesperson : NSObject {
}

@property (nonatomic, retain) NSString* Category;
@property (nonatomic, retain) NSString* Email;
@property (nonatomic, retain) NSString* ID;
@property (nonatomic, retain) NSString* JobTitle;
@property (nonatomic, retain) NSString* MobileNumber;
@property (nonatomic, retain) NSString* Name;
@property (nonatomic, retain) NSString* WorkNumber;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
