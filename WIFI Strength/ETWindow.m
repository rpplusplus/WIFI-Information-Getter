//
//  ETWindow.m
//  WIFI Strength
//
//  Created by Xiaoxuan Tang on 13-7-26.
//  Copyright (c) 2013年 TieTie tech. All rights reserved.
//

#import "ETWindow.h"
#import "ETWIFIInformationGetter.h"
@implementation ETWindow

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(getWifiInfomation)
                                                    userInfo:nil
                                                     repeats:YES];
    [timer fire];
}

- (void) getWifiInfomation
{
    NSDictionary* dict = [ETWIFIInformationGetter getWIFIInfo];
//    NSLog(@"%@", dict);
    [self.agrCtlRSSI setStringValue:dict[@"agrCtlRSSI"]];
    [self.agrCtlNoise setStringValue:dict[@"agrCtlNoise"]];
    [self.SSID setStringValue:dict[@"SSID"]];
    [self.channel setStringValue:dict[@"channel"]];
    [self.linkauth setStringValue:dict[@"linkauth"]];
}
@end
