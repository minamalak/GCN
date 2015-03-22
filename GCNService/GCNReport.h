


#import <Foundation/Foundation.h>



@interface GCNReport : NSObject {
}

@property (nonatomic, retain) NSString* Description;
@property (nonatomic, retain) NSString* ID;
@property (nonatomic, retain) NSString* PdfURL;
@property (nonatomic, retain) NSString* Title;

- (id)initWithData: (NSDictionary *)dictionary;
- (NSDictionary *)JSONDictionary;

@end
