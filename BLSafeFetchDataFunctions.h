//
//  XLDataUtils.h
//  FrameWork
//
//  Created by chuxiaolong on 15/8/10.
//  Copyright (c) 2015年 BST. All rights reserved.
//

#import <UIKit/UIKit.h>

#if defined __cplusplus
extern "C" {
#endif
    BOOL isEmptyString(NSString *string);
    NSArray *arrayFromObject(NSDictionary *dictionary, NSString *key);
    NSDictionary *dictionaryFromObject(NSDictionary *dictionary, NSString *key);
    NSString *stringFromObject(NSDictionary *dictionary, NSString *key);
    NSInteger integerFromObject(NSDictionary *dictionary, NSString *key);
    BOOL boolFromObject(NSDictionary *dictionary, NSString *key);
    NSInteger integerFromObjectPoll(NSDictionary *dictionary, NSString *key);
    CGFloat doubleFromObject(NSDictionary *dictionary, NSString *key);
    NSDate *dateFromeObject(NSDictionary *dictionary, NSString *key);
    
    BOOL isEqualString(NSString *string1, NSString *string2);
#if defined __cplusplus
};
#endif


//NSString* MBNonEmptyString(id obj);
//
//NSString* MBNonEmptyStringNoThing(id obj);
