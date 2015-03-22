


#import <Foundation/Foundation.h>


	@class GCNMediaMessage;
	

@interface GCNGetBriefcaseMessagesResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetBriefcaseMessagesResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end