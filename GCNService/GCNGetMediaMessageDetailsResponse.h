


#import <Foundation/Foundation.h>


	@class GCNMediaMessage;
	

@interface GCNGetMediaMessageDetailsResponse : NSObject {
}

@property (nonatomic, retain) GCNMediaMessage* GetMediaMessageDetailsResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end