//
//  XLDataUtils.m
//  FrameWork
//
//  Created by chuxiaolong on 15/8/10.
//  Copyright (c) 2015年 BST. All rights reserved.
//

#import "BLSafeFetchDataFunctions.h"

BOOL isEmptyString(NSString *string)
{
    return !string || [string isEqual:[NSNull null]] || (([string isKindOfClass:[NSString class]] && [@"" isEqualToString:[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]]) || [@"\"null\"" isEqualToString:string]);
}

NSArray *arrayFromObject(NSDictionary *dictionary, NSString *key)
{
    if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
        return [NSArray array];
    }
    
    id object = [dictionary valueForKey:key];
    if ([object isKindOfClass:[NSString class]] &&
        (isEmptyString(object) || [@"<null>" isEqualToString:object])) {
        return [NSArray array];
    }
    
    if ([object isKindOfClass:[NSArray class]]) {
        return object;
    }
    
    return [NSArray array];
}

NSDictionary *dictionaryFromObject(NSDictionary *dictionary, NSString *key)
{
    if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
        return [NSDictionary dictionary];
    }
    
    id object = [dictionary valueForKey:key];
    if ([object isKindOfClass:[NSString class]] &&
        (isEmptyString(object) || [@"<null>" isEqualToString:object])) {
        return [NSDictionary dictionary];
    }
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        return object;
    }
    
    return [NSDictionary dictionary];
}

NSString *stringFromObject(NSDictionary *dictionary, NSString *key)
{
    if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
        return @"";
    }
    
    id object = [dictionary valueForKey:key];
    if ([object isKindOfClass:[NSString class]] &&
        (isEmptyString(object) || [@"<null>" isEqualToString:object])) {
        return @"";
    }
    
    if ([object isKindOfClass:[NSString class]]) {
        return object;
    } else if ([object isKindOfClass:[NSNumber class]]) {
        NSString *doubleString = [NSString stringWithFormat:@"%lf", [object doubleValue]];
        NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
        return [decNumber stringValue];
    }
    
    return @"";
}

NSInteger integerFromObject(NSDictionary *dictionary, NSString *key)
{
    if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
        return 0;
    }
    
    id object = [dictionary valueForKey:key];
    if (!object || !([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]])) {
        return 0;
    }
    
    return [object integerValue];
}

BOOL boolFromObject(NSDictionary *dictionary, NSString *key)
{
    if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
        return 0;
    }
    
    id object = [dictionary valueForKey:key];
    if (!object || !([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]])) {
        return 0;
    }
    
    return [object boolValue];
}

NSInteger integerFromObjectPoll(NSDictionary *dictionary, NSString *key)
{
    if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
        return 1000;
    }
    
    id object = [dictionary valueForKey:key];
    if (!object || !([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]])) {
        return 1000;
    }
    
    return [object integerValue];
}


CGFloat doubleFromObject(NSDictionary *dictionary, NSString *key)
{
    if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
        return 0.0;
    }
    
    id object = [dictionary valueForKey:key];
    if (!object || !([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]])) {
        return 0.0;
    }
    NSString *doubleString = [NSString stringWithFormat:@"%lf", [object doubleValue]];
    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber doubleValue];
}

NSDate *dateFromeObject(NSDictionary *dictionary, NSString *key)
{
    if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    id object = [dictionary valueForKey:key];
    if (!object || !([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]])) {
        return nil;
    }
    
    return [NSDate dateWithTimeIntervalSince1970:[object doubleValue]];
}

BOOL isEqualString(NSString *string1, NSString *string2)
{
    BOOL isEmpty = isEmptyString(string1);
    if (isEmpty && isEmptyString(string2)) {
        return YES;
    }
    
    if (isEmpty) {
        return NO;
    }
    
    return [string1 isEqualToString:string2];
}

//NSString* MBNonEmptyString(id obj){
//    if (obj == nil || obj == [NSNull null] ||
//        ([obj isKindOfClass:[NSString class]] && [obj length] == 0)) {
//        return @"";
//    } else if ([obj isKindOfClass:[NSNumber class]]) {
//        return MBNonEmptyString([obj stringValue]);
//    }
//    return obj;
//}
//
//
//NSString* MBNonEmptyStringNoThing(id obj){
//    if (obj == nil || obj == [NSNull null] ||
//        ([obj isKindOfClass:[NSString class]] && [obj length] == 0)) {
//        return @"";
//    } else if ([obj isKindOfClass:[NSNumber class]]) {
//        return MBNonEmptyString([obj stringValue]);
//    }
//    return obj;
//}
