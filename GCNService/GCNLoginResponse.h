


#import <Foundation/Foundation.h>


	#import "GCNLoginStatus.h"
	

@interface GCNLoginResponse : NSObject {
}

@property (nonatomic) GCNLoginStatus LoginResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end