
//  AFNTool.m
//  LHand
//
//  Created by 小华 on 15/6/2.
//  Copyright (c) 2015年 小华. All rights reserved.
//

#import "AFNTool.h"
#import "AFNetworking.h"

@implementation AFNTool

/**
 *  get
 *
 *
 */
+(void)getWithURl:(NSString *)url parameters:(NSDictionary *)parames success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
  AFHTTPRequestOperationManager *manger=[AFHTTPRequestOperationManager manager];
    
    [manger GET:url parameters:parames success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
            if (success) {
                success(responseObject);
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                
                failure(error);
            }
            
    } ];

}


+(void)getHeardWithURl:(NSString *)url parameters:(NSDictionary *)parames success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manger2=[AFHTTPRequestOperationManager manager];
//    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    manger2.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manger2.requestSerializer setValue:@"http://www.cnbeta.com/" forHTTPHeaderField:@"Referer"];

    [manger2 GET:url parameters:parames success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (success) {
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            
            failure(error);
        }
        
    } ];
    
}


/**
 *  post
 *
 * */
+(void)postWithURl:(NSString *)url parameters:(NSDictionary *)parames success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *manger=[AFHTTPRequestOperationManager manager];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;

    //[manger.requestSerializer setValue:@"cookie_uid=XXXXX & cookie_sig = xxxxxxx"forHTTPHeaderField:@"Accept"];
//    NSData *userSig = [[NSUserDefaults standardUserDefaults] objectForKey:USERSIG];
//    NSString *cookie_sig;
//    NSString *cookie_uid;
//    if (userSig) {
//        cookie_sig = [CyrusTools hexStringFromData:userSig];
//        cookie_uid = [[NSUserDefaults standardUserDefaults] objectForKey:USERID];
//    } else {
//        cookie_sig = @"";
//        cookie_uid = @"0";
//    }
//    [manger.requestSerializer setValue:cookie_sig forHTTPHeaderField:@"cookie_sig"];
//    [manger.requestSerializer setValue:cookie_uid forHTTPHeaderField:@"cookie_uid"];
    

//        manger.requestSerializer = [AFHTTPRequestSerializer serializer];
//        manger.responseSerializer = [AFHTTPResponseSerializer serializer];
//        manger.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];//设置相应内容类型
    
    [manger POST:url parameters:parames success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (success) {
            if([[responseObject objectForKey:@"success"] intValue] == 1){
            success(responseObject);
            }else{
                [MBProgressHUD showError:@"服务器内部参数错误~"];
            }
            [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;

        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
            [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;

        }
        
    } ];
    
}

///**
// *  发图片
// */
//+ (void)postWithURL:(NSString *)url parameters:(NSDictionary *)params formDataArray:(NSArray *)formDataArray success:(void (^)(id))success failure:(void (^)(NSError *))failure
//{
//    
//    
//    // 1.创建请求管理对象
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
//    mgr.requestSerializer.timeoutInterval = 30;
//    
//    // 鉴权信息
//    NSData *userSig = [[NSUserDefaults standardUserDefaults] objectForKey:USERSIG];
//    NSString *cookie_sig;
//    NSString *cookie_uid;
//    if (userSig) {
//        cookie_sig = [CyrusTools hexStringFromData:userSig];
//        cookie_uid = [[NSUserDefaults standardUserDefaults] objectForKey:USERID];
//    } else {
//        cookie_sig = @"";
//        cookie_uid = @"0";
//    }
//    
//    [mgr.requestSerializer setValue:cookie_sig forHTTPHeaderField:@"cookie_sig"];
//    [mgr.requestSerializer setValue:cookie_uid forHTTPHeaderField:@"cookie_uid"];
//    
//    // 2.发送请求
//    [mgr POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> totalFormData) {
//        for (LHFormData *formData in formDataArray) {
//            [totalFormData appendPartWithFileData:formData.data name:formData.name fileName:formData.filename mimeType:formData.mimeType];
//        }
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        if (success) {
//            success(responseObject);
//            [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
//            
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (failure) {
//            failure(error);
//            [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
//        }
//    }];
//}



@end
