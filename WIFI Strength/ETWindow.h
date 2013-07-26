//
//  ETWindow.h
//  WIFI Strength
//
//  Created by Xiaoxuan Tang on 13-7-26.
//  Copyright (c) 2013年 TieTie tech. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ETWindow : NSWindow
@property (nonatomic, strong)   IBOutlet    NSTextField* agrCtlRSSI;
@property (nonatomic, strong)   IBOutlet    NSTextField* SSID;
@property (nonatomic, strong)   IBOutlet    NSTextField* agrCtlNoise;
@property (nonatomic, strong)   IBOutlet    NSTextField* channel;
@property (nonatomic, strong)   IBOutlet    NSTextField* linkauth;
@end
