


#import <Foundation/Foundation.h>


	@class GCNNote;
	

@interface GCNGetNotesResponse : NSObject {
}

@property (nonatomic, retain) NSMutableArray* GetNotesResult;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;
- (NSString *)requestGETParams;

@end