


#import <Foundation/Foundation.h>


	@class GCNPrivateMediaMessage;
	

@interface GCNCreatePrivateMediaMessage : NSObject {
}

@property (nonatomic, retain) GCNPrivateMediaMessage* privateMessage;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end