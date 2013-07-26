//
//  ETWIFIInformationGetter.m
//  WIFI Strength
//
//  Created by Xiaoxuan Tang on 13-7-26.
//  Copyright (c) 2013年 TieTie tech. All rights reserved.
//

#import "ETWIFIInformationGetter.h"

#include <string>
#include <iostream>
#include <stdio.h>

std::string exec(const char* cmd) {
    FILE* pipe = popen(cmd, "r");
    if (!pipe) return "ERROR";
    char buffer[128];
    std::string result = "";
    while(!feof(pipe)) {
    	if(fgets(buffer, 128, pipe) != NULL)
    		result += buffer;
    }
    pclose(pipe);
    return result;
}

@implementation ETWIFIInformationGetter


+ (NSDictionary*) getWIFIInfo
{
    NSString *input = @"/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I";
    
    std::string str = exec([input UTF8String]);
    NSString* output = [NSString stringWithFormat:@"%s",str.c_str()];
    NSArray* arr = [output componentsSeparatedByString:@"\n"];

    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    for (NSString* str in arr) {
        NSString* new_str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSRange range = [new_str rangeOfString:@":"];
        if (range.length == 1)
        {
            NSString* key = [new_str substringToIndex:range .location];
            NSString* value = [new_str substringFromIndex:range.location + 1];
            [dict setValue:value forKey:key];
        }
    }
    
    return dict;
}
@end
