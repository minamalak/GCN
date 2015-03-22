


#import <Foundation/Foundation.h>
#import "GCNServiceClient.h"
#import "WebServiceResponse.h"
#import "WebServiceRequest.h"
#import "WebService.h"

#import "GCNHelloWorld.h"
#import "GCNHelloWorldResponse.h"
#import "GCNLogin.h"
#import "GCNLoginResponse.h"
#import "GCNGetReports.h"
#import "GCNGetReportsResponse.h"
#import "GCNGetSpokespersons.h"
#import "GCNGetSpokespersonsResponse.h"
#import "GCNGetMediaMessages.h"
#import "GCNGetMediaMessagesResponse.h"
#import "GCNGetMediaMessageDetails.h"
#import "GCNGetMediaMessageDetailsResponse.h"
#import "GCNAddMessageToBriefcase.h"
#import "GCNAddMessageToBriefcaseResponse.h"
#import "GCNRemoveMessageFromBriefcase.h"
#import "GCNRemoveMessageFromBriefcaseResponse.h"
#import "GCNGetBriefcaseMessages.h"
#import "GCNGetBriefcaseMessagesResponse.h"
#import "GCNGetNotes.h"
#import "GCNGetNotesResponse.h"
#import "GCNAddNote.h"
#import "GCNAddNoteResponse.h"
#import "GCNEditNote.h"
#import "GCNEditNoteResponse.h"
#import "GCNDeleteNote.h"
#import "GCNDeleteNoteResponse.h"
#import "GCNCreatePrivateMediaMessage.h"
#import "GCNCreatePrivateMediaMessageResponse.h"
#import "GCNDeletePrivateMediaMessage.h"
#import "GCNDeletePrivateMediaMessageResponse.h"

#define serviceURL @"https://gcn.gov.ae/services/mobileservice.svc/"
//#define serviceURL @"http://10.2.50.47:9999/mobileservice.svc/"


@implementation GCNServiceClient

- (void)webServiceCallback:(WebServiceResponse *)response {
	id<GCNServiceClientCaller> caller = (id<GCNServiceClientCaller>)response.caller;
	switch (response.call) {
		case GCNMethodCallHelloWorld:
			{
				GCNHelloWorldResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[GCNHelloWorldResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(HelloWorldCallback:error:)]) {
					[caller HelloWorldCallback:output error:response.error];
				}
				break;
			}
		case GCNMethodCallLogin:
			{
				GCNLoginResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[GCNLoginResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(LoginCallback:error:)]) {
					[caller LoginCallback:output error:response.error];
				}
				break;
			}
		case GCNMethodCallGetReports:
			{
				GCNGetReportsResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[GCNGetReportsResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetReportsCallback:error:)]) {
					[caller GetReportsCallback:output error:response.error];
				}
				break;
			}
		case GCNMethodCallGetSpokespersons:
			{
				GCNGetSpokespersonsResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[GCNGetSpokespersonsResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetSpokespersonsCallback:error:)]) {
					[caller GetSpokespersonsCallback:output error:response.error];
				}
				break;
			}
		case GCNMethodCallGetMediaMessages:
			{
				GCNGetMediaMessagesResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[GCNGetMediaMessagesResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetMediaMessagesCallback:error:)]) {
					[caller GetMediaMessagesCallback:output error:response.error];
				}
				break;
			}
		case GCNMethodCallGetMediaMessageDetails:
			{
				GCNGetMediaMessageDetailsResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[GCNGetMediaMessageDetailsResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetMediaMessageDetailsCallback:error:)]) {
					[caller GetMediaMessageDetailsCallback:output error:response.error];
				}
				break;
			}
		case GCNMethodCallAddMessageToBriefcase:
			{
				GCNAddMessageToBriefcaseResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[GCNAddMessageToBriefcaseResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(AddMessageToBriefcaseCallback:error:)]) {
					[caller AddMessageToBriefcaseCallback:output error:response.error];
				}
				break;
			}
		case GCNMethodCallRemoveMessageFromBriefcase:
			{
				GCNRemoveMessageFromBriefcaseResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[GCNRemoveMessageFromBriefcaseResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(RemoveMessageFromBriefcaseCallback:error:)]) {
					[caller RemoveMessageFromBriefcaseCallback:output error:response.error];
				}
				break;
			}
		case GCNMethodCallGetBriefcaseMessages:
			{
				GCNGetBriefcaseMessagesResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[GCNGetBriefcaseMessagesResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetBriefcaseMessagesCallback:error:)]) {
					[caller GetBriefcaseMessagesCallback:output error:response.error];
				}
				break;
			}
		case GCNMethodCallGetNotes:
			{
				GCNGetNotesResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[GCNGetNotesResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(GetNotesCallback:error:)]) {
					[caller GetNotesCallback:output error:response.error];
				}
				break;
			}
		case GCNMethodCallAddNote:
			{
				GCNAddNoteResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[GCNAddNoteResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(AddNoteCallback:error:)]) {
					[caller AddNoteCallback:output error:response.error];
				}
				break;
			}
		case GCNMethodCallEditNote:
			{
				GCNEditNoteResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[GCNEditNoteResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(EditNoteCallback:error:)]) {
					[caller EditNoteCallback:output error:response.error];
				}
				break;
			}
		case GCNMethodCallDeleteNote:
			{
				GCNDeleteNoteResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[GCNDeleteNoteResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(DeleteNoteCallback:error:)]) {
					[caller DeleteNoteCallback:output error:response.error];
				}
				break;
			}
		case GCNMethodCallCreatePrivateMediaMessage:
			{
				GCNCreatePrivateMediaMessageResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[GCNCreatePrivateMediaMessageResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(CreatePrivateMediaMessageCallback:error:)]) {
					[caller CreatePrivateMediaMessageCallback:output error:response.error];
				}
				break;
			}
		case GCNMethodCallDeletePrivateMediaMessage:
			{
				GCNDeletePrivateMediaMessageResponse *output = nil;
				if(!response.error) {
					NSError *jsonParsingError = nil;
					NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:response.content options:0 error:&jsonParsingError];
					//NSDictionary *deserializedData = [response.content objectFromJSONData];
					output = [[GCNDeletePrivateMediaMessageResponse alloc] initWithData:deserializedData];
				}
				if(caller && [caller respondsToSelector:@selector(DeletePrivateMediaMessageCallback:error:)]) {
					[caller DeletePrivateMediaMessageCallback:output error:response.error];
				}
				break;
			}
	}
}

- (GCNHelloWorldResponse *)HelloWorldIsPost:(BOOL)isPost input: (GCNHelloWorld *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@HelloWorld", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@HelloWorld%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	GCNHelloWorldResponse *output = [[GCNHelloWorldResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)HelloWorldAsyncIsPost:(BOOL)isPost input: (GCNHelloWorld *)input caller:(id<GCNServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = GCNMethodCallHelloWorld;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@HelloWorld", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@HelloWorld%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (GCNLoginResponse *)LoginIsPost:(BOOL)isPost input: (GCNLogin *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@Login", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@Login%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	GCNLoginResponse *output = [[GCNLoginResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)LoginAsyncIsPost:(BOOL)isPost input: (GCNLogin *)input caller:(id<GCNServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = GCNMethodCallLogin;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@Login", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@Login%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (GCNGetReportsResponse *)GetReportsIsPost:(BOOL)isPost input: (GCNGetReports *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetReports", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetReports%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	GCNGetReportsResponse *output = [[GCNGetReportsResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetReportsAsyncIsPost:(BOOL)isPost input: (GCNGetReports *)input caller:(id<GCNServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = GCNMethodCallGetReports;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetReports", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetReports%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (GCNGetSpokespersonsResponse *)GetSpokespersonsIsPost:(BOOL)isPost input: (GCNGetSpokespersons *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetSpokespersons", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetSpokespersons%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	GCNGetSpokespersonsResponse *output = [[GCNGetSpokespersonsResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetSpokespersonsAsyncIsPost:(BOOL)isPost input: (GCNGetSpokespersons *)input caller:(id<GCNServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = GCNMethodCallGetSpokespersons;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetSpokespersons", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetSpokespersons%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (GCNGetMediaMessagesResponse *)GetMediaMessagesIsPost:(BOOL)isPost input: (GCNGetMediaMessages *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetMediaMessages", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetMediaMessages%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	GCNGetMediaMessagesResponse *output = [[GCNGetMediaMessagesResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetMediaMessagesAsyncIsPost:(BOOL)isPost input: (GCNGetMediaMessages *)input caller:(id<GCNServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = GCNMethodCallGetMediaMessages;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetMediaMessages", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetMediaMessages%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (GCNGetMediaMessageDetailsResponse *)GetMediaMessageDetailsIsPost:(BOOL)isPost input: (GCNGetMediaMessageDetails *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetMediaMessageDetails", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetMediaMessageDetails%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	GCNGetMediaMessageDetailsResponse *output = [[GCNGetMediaMessageDetailsResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetMediaMessageDetailsAsyncIsPost:(BOOL)isPost input: (GCNGetMediaMessageDetails *)input caller:(id<GCNServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = GCNMethodCallGetMediaMessageDetails;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetMediaMessageDetails", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetMediaMessageDetails%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (GCNAddMessageToBriefcaseResponse *)AddMessageToBriefcaseIsPost:(BOOL)isPost input: (GCNAddMessageToBriefcase *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@AddMessageToBriefcase", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@AddMessageToBriefcase%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	GCNAddMessageToBriefcaseResponse *output = [[GCNAddMessageToBriefcaseResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)AddMessageToBriefcaseAsyncIsPost:(BOOL)isPost input: (GCNAddMessageToBriefcase *)input caller:(id<GCNServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = GCNMethodCallAddMessageToBriefcase;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@AddMessageToBriefcase", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@AddMessageToBriefcase%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (GCNRemoveMessageFromBriefcaseResponse *)RemoveMessageFromBriefcaseIsPost:(BOOL)isPost input: (GCNRemoveMessageFromBriefcase *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@RemoveMessageFromBriefcase", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@RemoveMessageFromBriefcase%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	GCNRemoveMessageFromBriefcaseResponse *output = [[GCNRemoveMessageFromBriefcaseResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)RemoveMessageFromBriefcaseAsyncIsPost:(BOOL)isPost input: (GCNRemoveMessageFromBriefcase *)input caller:(id<GCNServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = GCNMethodCallRemoveMessageFromBriefcase;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@RemoveMessageFromBriefcase", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@RemoveMessageFromBriefcase%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (GCNGetBriefcaseMessagesResponse *)GetBriefcaseMessagesIsPost:(BOOL)isPost input: (GCNGetBriefcaseMessages *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetBriefcaseMessages", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetBriefcaseMessages%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	GCNGetBriefcaseMessagesResponse *output = [[GCNGetBriefcaseMessagesResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetBriefcaseMessagesAsyncIsPost:(BOOL)isPost input: (GCNGetBriefcaseMessages *)input caller:(id<GCNServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = GCNMethodCallGetBriefcaseMessages;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetBriefcaseMessages", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetBriefcaseMessages%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (GCNGetNotesResponse *)GetNotesIsPost:(BOOL)isPost input: (GCNGetNotes *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetNotes", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetNotes%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	GCNGetNotesResponse *output = [[GCNGetNotesResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)GetNotesAsyncIsPost:(BOOL)isPost input: (GCNGetNotes *)input caller:(id<GCNServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = GCNMethodCallGetNotes;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@GetNotes", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@GetNotes%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (GCNAddNoteResponse *)AddNoteIsPost:(BOOL)isPost input: (GCNAddNote *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@AddNote", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@AddNote%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	GCNAddNoteResponse *output = [[GCNAddNoteResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)AddNoteAsyncIsPost:(BOOL)isPost input: (GCNAddNote *)input caller:(id<GCNServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = GCNMethodCallAddNote;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@AddNote", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@AddNote%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (GCNEditNoteResponse *)EditNoteIsPost:(BOOL)isPost input: (GCNEditNote *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@EditNote", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@EditNote%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	GCNEditNoteResponse *output = [[GCNEditNoteResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)EditNoteAsyncIsPost:(BOOL)isPost input: (GCNEditNote *)input caller:(id<GCNServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = GCNMethodCallEditNote;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@EditNote", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@EditNote%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (GCNDeleteNoteResponse *)DeleteNoteIsPost:(BOOL)isPost input: (GCNDeleteNote *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@DeleteNote", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@DeleteNote%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	GCNDeleteNoteResponse *output = [[GCNDeleteNoteResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)DeleteNoteAsyncIsPost:(BOOL)isPost input: (GCNDeleteNote *)input caller:(id<GCNServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = GCNMethodCallDeleteNote;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@DeleteNote", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@DeleteNote%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (GCNCreatePrivateMediaMessageResponse *)CreatePrivateMediaMessageIsPost:(BOOL)isPost input: (GCNCreatePrivateMediaMessage *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@CreatePrivateMediaMessage", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@CreatePrivateMediaMessage%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	GCNCreatePrivateMediaMessageResponse *output = [[GCNCreatePrivateMediaMessageResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)CreatePrivateMediaMessageAsyncIsPost:(BOOL)isPost input: (GCNCreatePrivateMediaMessage *)input caller:(id<GCNServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = GCNMethodCallCreatePrivateMediaMessage;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@CreatePrivateMediaMessage", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil;
        NSDictionary *dic= [input JSONDictionary];
		request.body = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@CreatePrivateMediaMessage%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

- (GCNDeletePrivateMediaMessageResponse *)DeletePrivateMediaMessageIsPost:(BOOL)isPost input: (GCNDeletePrivateMediaMessage *)input error:(NSError **)error {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@DeletePrivateMediaMessage", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@DeletePrivateMediaMessage%@", serviceURL, [input requestGETParams]];
    }
	
	WebService *service = [[WebService alloc] initWithRequest:request];
	NSURLResponse *response = nil;
	NSData *data = [service dataContentIsPost:isPost response:&response error:error];
	//NSDictionary *deserializedData = [data objectFromJSONData];
	NSError *jsonParsingError = nil;
	NSDictionary *deserializedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
	GCNDeletePrivateMediaMessageResponse *output = [[GCNDeletePrivateMediaMessageResponse alloc] initWithData:deserializedData];
	return output;
}
- (void)DeletePrivateMediaMessageAsyncIsPost:(BOOL)isPost input: (GCNDeletePrivateMediaMessage *)input caller:(id<GCNServiceClientCaller>)caller {
	WebServiceRequest *request = [[WebServiceRequest alloc] init];
	request.caller = caller;
	request.call = GCNMethodCallDeletePrivateMediaMessage;
	if (isPost) {
		request.url = [[NSString alloc] initWithFormat:@"%@DeletePrivateMediaMessage", serviceURL];
		//request.body = [[input JSONDictionary] JSONData];
		NSError *writeError = nil; 
		request.body = [NSJSONSerialization dataWithJSONObject:[input JSONDictionary] options:NSJSONWritingPrettyPrinted error:&writeError];
    }
    else {
        request.url = [[NSString alloc] initWithFormat:@"%@DeletePrivateMediaMessage%@", serviceURL, [input requestGETParams]];
    }

	WebService *service = [[WebService alloc] initWithRequest:request caller:self];
	[service dataWithContentAsyncIsPost:isPost];
}

@end

