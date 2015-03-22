


#import <Foundation/Foundation.h>




@interface GCNAddNoteResponse : NSObject {
}

@property (nonatomic, retain) NSNumber* AddNoteResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end