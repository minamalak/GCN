


#import <Foundation/Foundation.h>




@interface GCNEditNoteResponse : NSObject {
}

@property (nonatomic, retain) NSNumber* EditNoteResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end