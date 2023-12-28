//
//  ReactHandlerBridge.m
//  FRW
//
//  Created by cat on 2023/12/28.
//

#import "ReactHandlerBridge.h"
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ReactHandler, NSObject)

RCT_EXTERN_METHOD(getAddress)

@end
