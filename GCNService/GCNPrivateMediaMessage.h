


#import <Foundation/Foundation.h>

#import "GCNMediaMessage.h"


@interface GCNPrivateMediaMessage : GCNMediaMessage {
}

@property (nonatomic, retain) NSString* Owner;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
