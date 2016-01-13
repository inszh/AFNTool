//
//  AFNTool.h
//  LHand
//
//  Created by 小华 on 15/6/2.
//  Copyright (c) 2015年 小华. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AFNTool : NSObject

+(void)getWithURl:(NSString *)url parameters:(NSDictionary *)parames  success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;


+(void)postWithURl:(NSString *)url parameters:(NSDictionary *)parames  success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+(void)getHeardWithURl:(NSString *)url parameters:(NSDictionary *)parames success:(void (^)(id))success failure:(void (^)(NSError *))failure;

+ (void)postWithURL:(NSString *)url parameters:(NSDictionary *)params formDataArray:(NSArray *)formDataArray success:(void (^)(id))success failure:(void (^)(NSError *))failure;

@end


