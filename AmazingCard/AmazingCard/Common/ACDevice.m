//
//  ACDevice.m
//  AmazingCard
//
//  Created by 杨琦 on 2018/12/5.
//  Copyright © 2018 A.C. All rights reserved.
//

#import "ACDevice.h"
#import <UIKit/UIDevice.h>
#import <AdSupport/AdSupport.h>
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import "BFENumbers.h"

@implementation ACDevice

+ (BOOL)isPhone {
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone);
}

+ (BOOL)isPad {
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}

+ (BOOL)is3p5InchPhone {
    return [self toDecideDeviceSize:480];
}

+ (BOOL)is4InchPhone {
    return [self toDecideDeviceSize:568];
}

+ (BOOL)is4p7InchPhone {
   return [self toDecideDeviceSize:667];
}

+ (BOOL)is5p5InchPhone {
    return [self toDecideDeviceSize:736];
}

+ (BOOL)is5p8FullScreen {
    return [self toDecideDeviceSize:812];
}

+ (BOOL)is4p7InchPhoneOrIs5p8FullScreen {
    return [self is4p7InchPhone] || [self is5p8FullScreen];
}

+ (BOOL)toDecideDeviceSize:(CGFloat)deviceHeight {
    CGFloat height = MAX(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
    return ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) && deviceHeight == height);
    return NO;
}

@end
