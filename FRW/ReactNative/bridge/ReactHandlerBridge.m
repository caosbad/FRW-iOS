//
//  ReactHandlerBridge.m
//  FRW
//
//  Created by cat on 2023/12/28.
//
#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ReactHandler, NSObject)


RCT_EXTERN_METHOD(getAddress:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)

@end
