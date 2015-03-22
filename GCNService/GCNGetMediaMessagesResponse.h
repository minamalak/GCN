


#import <Foundation/Foundation.h>


	@class GCNMediaMessage;
	

@interface GCNGetMediaMessagesResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetMediaMessagesResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end