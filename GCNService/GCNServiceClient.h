
#import <Foundation/Foundation.h>
#import "WebService.h"


@class GCNHelloWorld;
@class GCNHelloWorldResponse;
@class GCNLogin;
@class GCNLoginResponse;
@class GCNGetReports;
@class GCNGetReportsResponse;
@class GCNGetSpokespersons;
@class GCNGetSpokespersonsResponse;
@class GCNGetMediaMessages;
@class GCNGetMediaMessagesResponse;
@class GCNGetMediaMessageDetails;
@class GCNGetMediaMessageDetailsResponse;
@class GCNAddMessageToBriefcase;
@class GCNAddMessageToBriefcaseResponse;
@class GCNRemoveMessageFromBriefcase;
@class GCNRemoveMessageFromBriefcaseResponse;
@class GCNGetBriefcaseMessages;
@class GCNGetBriefcaseMessagesResponse;
@class GCNGetNotes;
@class GCNGetNotesResponse;
@class GCNAddNote;
@class GCNAddNoteResponse;
@class GCNEditNote;
@class GCNEditNoteResponse;
@class GCNDeleteNote;
@class GCNDeleteNoteResponse;
@class GCNCreatePrivateMediaMessage;
@class GCNCreatePrivateMediaMessageResponse;
@class GCNDeletePrivateMediaMessage;
@class GCNDeletePrivateMediaMessageResponse;

@protocol GCNServiceClientCaller <NSObject>

@optional
- (void)HelloWorldCallback:(GCNHelloWorldResponse *)response error:(NSError *)error;
- (void)LoginCallback:(GCNLoginResponse *)response error:(NSError *)error;
- (void)GetReportsCallback:(GCNGetReportsResponse *)response error:(NSError *)error;
- (void)GetSpokespersonsCallback:(GCNGetSpokespersonsResponse *)response error:(NSError *)error;
- (void)GetMediaMessagesCallback:(GCNGetMediaMessagesResponse *)response error:(NSError *)error;
- (void)GetMediaMessageDetailsCallback:(GCNGetMediaMessageDetailsResponse *)response error:(NSError *)error;
- (void)AddMessageToBriefcaseCallback:(GCNAddMessageToBriefcaseResponse *)response error:(NSError *)error;
- (void)RemoveMessageFromBriefcaseCallback:(GCNRemoveMessageFromBriefcaseResponse *)response error:(NSError *)error;
- (void)GetBriefcaseMessagesCallback:(GCNGetBriefcaseMessagesResponse *)response error:(NSError *)error;
- (void)GetNotesCallback:(GCNGetNotesResponse *)response error:(NSError *)error;
- (void)AddNoteCallback:(GCNAddNoteResponse *)response error:(NSError *)error;
- (void)EditNoteCallback:(GCNEditNoteResponse *)response error:(NSError *)error;
- (void)DeleteNoteCallback:(GCNDeleteNoteResponse *)response error:(NSError *)error;
- (void)CreatePrivateMediaMessageCallback:(GCNCreatePrivateMediaMessageResponse *)response error:(NSError *)error;
- (void)DeletePrivateMediaMessageCallback:(GCNDeletePrivateMediaMessageResponse *)response error:(NSError *)error;
@end

typedef enum GCNMethodCall {
	GCNMethodCallHelloWorld = 1,
	GCNMethodCallLogin = 2,
	GCNMethodCallGetReports = 3,
	GCNMethodCallGetSpokespersons = 4,
	GCNMethodCallGetMediaMessages = 5,
	GCNMethodCallGetMediaMessageDetails = 6,
	GCNMethodCallAddMessageToBriefcase = 7,
	GCNMethodCallRemoveMessageFromBriefcase = 8,
	GCNMethodCallGetBriefcaseMessages = 9,
	GCNMethodCallGetNotes = 10,
	GCNMethodCallAddNote = 11,
	GCNMethodCallEditNote = 12,
	GCNMethodCallDeleteNote = 13,
	GCNMethodCallCreatePrivateMediaMessage = 14,
	GCNMethodCallDeletePrivateMediaMessage = 15,
} GCNMethodCall;

@interface GCNServiceClient : NSObject<WebServiceCaller> {
	
}

- (GCNHelloWorldResponse *)HelloWorldIsPost:(BOOL)isPost input: (GCNHelloWorld *)input error:(NSError **)error;
- (void)HelloWorldAsyncIsPost:(BOOL)isPost input: (GCNHelloWorld *)input caller:(id<GCNServiceClientCaller>)caller;
- (GCNLoginResponse *)LoginIsPost:(BOOL)isPost input: (GCNLogin *)input error:(NSError **)error;
- (void)LoginAsyncIsPost:(BOOL)isPost input: (GCNLogin *)input caller:(id<GCNServiceClientCaller>)caller;
- (GCNGetReportsResponse *)GetReportsIsPost:(BOOL)isPost input: (GCNGetReports *)input error:(NSError **)error;
- (void)GetReportsAsyncIsPost:(BOOL)isPost input: (GCNGetReports *)input caller:(id<GCNServiceClientCaller>)caller;
- (GCNGetSpokespersonsResponse *)GetSpokespersonsIsPost:(BOOL)isPost input: (GCNGetSpokespersons *)input error:(NSError **)error;
- (void)GetSpokespersonsAsyncIsPost:(BOOL)isPost input: (GCNGetSpokespersons *)input caller:(id<GCNServiceClientCaller>)caller;
- (GCNGetMediaMessagesResponse *)GetMediaMessagesIsPost:(BOOL)isPost input: (GCNGetMediaMessages *)input error:(NSError **)error;
- (void)GetMediaMessagesAsyncIsPost:(BOOL)isPost input: (GCNGetMediaMessages *)input caller:(id<GCNServiceClientCaller>)caller;
- (GCNGetMediaMessageDetailsResponse *)GetMediaMessageDetailsIsPost:(BOOL)isPost input: (GCNGetMediaMessageDetails *)input error:(NSError **)error;
- (void)GetMediaMessageDetailsAsyncIsPost:(BOOL)isPost input: (GCNGetMediaMessageDetails *)input caller:(id<GCNServiceClientCaller>)caller;
- (GCNAddMessageToBriefcaseResponse *)AddMessageToBriefcaseIsPost:(BOOL)isPost input: (GCNAddMessageToBriefcase *)input error:(NSError **)error;
- (void)AddMessageToBriefcaseAsyncIsPost:(BOOL)isPost input: (GCNAddMessageToBriefcase *)input caller:(id<GCNServiceClientCaller>)caller;
- (GCNRemoveMessageFromBriefcaseResponse *)RemoveMessageFromBriefcaseIsPost:(BOOL)isPost input: (GCNRemoveMessageFromBriefcase *)input error:(NSError **)error;
- (void)RemoveMessageFromBriefcaseAsyncIsPost:(BOOL)isPost input: (GCNRemoveMessageFromBriefcase *)input caller:(id<GCNServiceClientCaller>)caller;
- (GCNGetBriefcaseMessagesResponse *)GetBriefcaseMessagesIsPost:(BOOL)isPost input: (GCNGetBriefcaseMessages *)input error:(NSError **)error;
- (void)GetBriefcaseMessagesAsyncIsPost:(BOOL)isPost input: (GCNGetBriefcaseMessages *)input caller:(id<GCNServiceClientCaller>)caller;
- (GCNGetNotesResponse *)GetNotesIsPost:(BOOL)isPost input: (GCNGetNotes *)input error:(NSError **)error;
- (void)GetNotesAsyncIsPost:(BOOL)isPost input: (GCNGetNotes *)input caller:(id<GCNServiceClientCaller>)caller;
- (GCNAddNoteResponse *)AddNoteIsPost:(BOOL)isPost input: (GCNAddNote *)input error:(NSError **)error;
- (void)AddNoteAsyncIsPost:(BOOL)isPost input: (GCNAddNote *)input caller:(id<GCNServiceClientCaller>)caller;
- (GCNEditNoteResponse *)EditNoteIsPost:(BOOL)isPost input: (GCNEditNote *)input error:(NSError **)error;
- (void)EditNoteAsyncIsPost:(BOOL)isPost input: (GCNEditNote *)input caller:(id<GCNServiceClientCaller>)caller;
- (GCNDeleteNoteResponse *)DeleteNoteIsPost:(BOOL)isPost input: (GCNDeleteNote *)input error:(NSError **)error;
- (void)DeleteNoteAsyncIsPost:(BOOL)isPost input: (GCNDeleteNote *)input caller:(id<GCNServiceClientCaller>)caller;
- (GCNCreatePrivateMediaMessageResponse *)CreatePrivateMediaMessageIsPost:(BOOL)isPost input: (GCNCreatePrivateMediaMessage *)input error:(NSError **)error;
- (void)CreatePrivateMediaMessageAsyncIsPost:(BOOL)isPost input: (GCNCreatePrivateMediaMessage *)input caller:(id<GCNServiceClientCaller>)caller;
- (GCNDeletePrivateMediaMessageResponse *)DeletePrivateMediaMessageIsPost:(BOOL)isPost input: (GCNDeletePrivateMediaMessage *)input error:(NSError **)error;
- (void)DeletePrivateMediaMessageAsyncIsPost:(BOOL)isPost input: (GCNDeletePrivateMediaMessage *)input caller:(id<GCNServiceClientCaller>)caller;

@end