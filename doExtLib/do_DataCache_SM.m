//
//  do_DataCache_SM.m
//  DoExt_SM
//
//  Created by @userName on @time.
//  Copyright (c) 2015年 DoExt. All rights reserved.
//

#import "do_DataCache_SM.h"

#import "doScriptEngineHelper.h"
#import "doIScriptEngine.h"
#import "doInvokeResult.h"
#import "doJsonHelper.h"

@implementation do_DataCache_SM
#pragma mark -
#pragma mark - 同步异步方法的实现

//同步
- (void)loadData:(NSArray *)parms
{
    NSDictionary *_dictParas = [parms objectAtIndex:0];
    doInvokeResult *_invokeResult = [parms objectAtIndex:2];
    //自己的代码实现
    NSString* key = [doJsonHelper GetOneText: _dictParas :@"key" :@"" ];
    if(key.length<=0){
        [_invokeResult SetResultValue:[NSNull null]];
        return;
    }
    [_invokeResult SetResultValue:[[NSUserDefaults standardUserDefaults] objectForKey:key]];
}
- (void)saveData:(NSArray *)parms
{
    NSDictionary *_dictParas = [parms objectAtIndex:0];
    doInvokeResult *_invokeResult = [parms objectAtIndex:2];
    NSString* key = [doJsonHelper GetOneText: _dictParas :@"key" :@"" ];
    NSString* value = [doJsonHelper GetOneText: _dictParas :@"value" :@"" ];
    if(key.length<=0){
        [_invokeResult SetResultBoolean:NO];
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [_invokeResult SetResultBoolean:YES];
}
//异步

@end