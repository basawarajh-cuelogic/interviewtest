//
//  APIRequester.h
//  CJM
//
//  Created by cdp on 5/14/15.
//  Copyright (c) 2015 TS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

typedef enum
{
    kTagHttpMethodPost=1,
    kTagHttpMethodGet=2,
    kTagHttpMultipart=3,
}kTagHttpMethod;


typedef enum
{
    kRequestSerializerJson,
    kRequestSerializerHTTP
    
}kRequestSerializer;

#define URL_HOST @"http://192.168.10.104/imageData.php"


@protocol APIResponseListnerDelegate <NSObject>

-(void)onOffline:(id)requesterObj;
-(void)onTimedOut:(id)requesterObj;
-(void)onSuccess:(NSData *)dataResponse ApiRequester:(id)requesterObj;
-(void)onFailure:(NSError *)errorObj ApiRequester:(id)requesterObj;
-(void)onFailure:(NSError *)errorObj ApiRequester:(id)requesterObj withStatusCode:(NSInteger)statusCode;
@end



@interface APIRequester : NSObject
@property (weak,nonatomic) id<APIResponseListnerDelegate> delResponseListner;
@property (strong,nonatomic) NSMutableDictionary *dictPost;
@property (strong,nonatomic) AFHTTPRequestOperationManager *requestManager;
@property (strong,nonatomic) NSTimer *timer;
@property (nonatomic) NSInteger tag;





@property BOOL isTimedOut;


#pragma mark - Public Method
-(void)startWithDelegate:(id)delegate withPostParameters:(id)dictParameters httpMethod:(kTagHttpMethod)httpRequestMethod withURL:(NSString *)strUrl withTimeOutValue:(NSInteger )timeOutValue withImageData:(NSData *)dataImage  withCompletionBlock:(void(^)(id))compledtionBlock withRequestSeriealizer:(kRequestSerializer)requestSerializer;
@end
