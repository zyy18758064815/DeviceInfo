//
//  UIDevice+MMDeviceInfo.m
//  MMDeviceInfo
//
//  Created by yunyunzhang on 2017/8/14.
//  Copyright © 2017年 yunyunzhang. All rights reserved.
//

#import "UIDevice+DeviceInfo.h"
#import <sys/utsname.h>


#define iPhone_1G  @"iPhone 1G"
#define iPhone_3G  @"iPhone 3G"
#define iPhone_3GS @"iPhone 3GS"
#define iPhone_4   @"iPhone 4"
#define iPhone_4S  @"iPhone 4S"
#define iPhone_5   @"iPhone 5"
#define iPhone_5C  @"iPhone 5C"
#define iPhone_5S  @"iPhone 5S"
#define iPhone_6   @"iPhone 6"
#define iPhone_6P  @"iPhone 6 Plus"
#define iPhone_6S  @"iPhone 6s"
#define iPhone_6SP @"iPhone 6s Plus"
#define iPhone_SE  @"iPhone SE";
#define iPhone_7   @"iPhone 7"
#define iPhone_7P  @"iPhone 7 Plus"

#define iPod_1G    @"iPod Touch 1G"
#define iPod_2G    @"iPod Touch 2G"
#define iPod_3G    @"iPod Touch 3G"
#define iPod_4G    @"iPod Touch 4G"
#define iPod_5G    @"iPod Touch 5G"
#define iPod_6G    @"iPod Touch 6G"

#define iPad_1G    @"iPad 1G"
#define iPad_2     @"iPad 2"
#define iPad_3     @"iPad 3"
#define iPad_4     @"iPad 4"
#define iPad_5     @"iPad 5"
#define iPad_6    @"iPad 6"
#define iPad_Mini_1  @"iPad Mini 1"

//https://www.theiphonewiki.com/wiki/Models#HomePod
@implementation UIDevice (DeviceInfo)

- (BOOL)deviceIsSupported
{
    if ([[self deviceModelName] isEqualToString:iPhone_1G] ||
        [[self deviceModelName] isEqualToString:iPhone_3G] ||
        [[self deviceModelName] isEqualToString:iPhone_3GS] ||
        [[self deviceModelName] isEqualToString:iPhone_4] ||
        [[self deviceModelName] isEqualToString:iPhone_4S] ||
        [[self deviceModelName] isEqualToString:iPhone_5] ||
        [[self deviceModelName] isEqualToString:iPhone_5C] ||
        
        [[self deviceModelName] isEqualToString:iPod_1G] ||
        [[self deviceModelName] isEqualToString:iPod_2G] ||
        [[self deviceModelName] isEqualToString:iPod_3G] ||
        [[self deviceModelName] isEqualToString:iPod_4G] ||
        [[self deviceModelName] isEqualToString:iPod_5G] ||
        
        [[self deviceModelName] isEqualToString:iPad_1G] ||
        [[self deviceModelName] isEqualToString:iPad_2] ||
        [[self deviceModelName] isEqualToString:iPad_3] ||
        [[self deviceModelName] isEqualToString:iPad_4] ||
        
        [[self deviceModelName] isEqualToString:iPad_Mini_1]
        )
    {
        return NO;
    }
    return YES;
}

- (NSString *)deviceModelName
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    // iphone
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"]
        ||[deviceString isEqualToString:@"iPhone3,2"]
        ||[deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"]
        ||[deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"]
        ||[deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone6,1"]
        ||[deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([deviceString isEqualToString:@"iPhone9,1"]
        ||[deviceString isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,2"]
        ||[deviceString isEqualToString:@"iPhone9,4"])   return @"iPhone 7 Plus";
    
    //ipod
    if ([deviceString isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    if ([deviceString isEqualToString:@"iPod7,1"])   return @"iPod Touch 6G"; //
    
    //ipad
    if ([deviceString isEqualToString:@"iPad1,1"])   return @"iPad 1G";

    if ([deviceString isEqualToString:@"iPad2,1"]
        ||[deviceString isEqualToString:@"iPad2,2"]
        ||[deviceString isEqualToString:@"iPad2,3"]
        ||[deviceString isEqualToString:@"iPad2,4"])   return @"iPad 2";
    
    if ([deviceString isEqualToString:@"iPad3,1"]
        ||[deviceString isEqualToString:@"iPad3,2"]
        ||[deviceString isEqualToString:@"iPad3,3"])   return @"iPad 3";
    
    if ([deviceString isEqualToString:@"iPad3,4"]
        ||[deviceString isEqualToString:@"iPad3,5"]
        ||[deviceString isEqualToString:@"iPad3,6"])   return @"iPad 4";
    
    if ([deviceString isEqualToString:@"iPad4,1"]
        ||[deviceString isEqualToString:@"iPad4,2"]
        ||[deviceString isEqualToString:@"iPad4,3"])   return @"iPad Air";
    
    if ([deviceString isEqualToString:@"iPad5,3"]
        ||[deviceString isEqualToString:@"iPad5,4"])   return @"iPad Air 2";
    
    if ([deviceString isEqualToString:@"iPad6,7"]
        ||[deviceString isEqualToString:@"iPad6,8"])      return @"iPad pro (12.9-inch)";
    
    if ([deviceString isEqualToString:@"iPad6,3"]
        ||[deviceString isEqualToString:@"iPad6,4"])      return @"iPad pro (9.7-inch)";
    
    if ([deviceString isEqualToString:@"iPad6,11"]
        ||[deviceString isEqualToString:@"iPad6,12"])      return @"iPad 5";
    
    if ([deviceString isEqualToString:@"iPad7,1"]
        ||[deviceString isEqualToString:@"iPad7,2"])      return @"iPad pro (12.9-inch,2)";
    if ([deviceString isEqualToString:@"iPad7,3"]
        ||[deviceString isEqualToString:@"iPad7,4"])      return @"iPad pro (10.5-inch)";
    
    // mini
    if ([deviceString isEqualToString:@"iPad2,5"]
        ||[deviceString isEqualToString:@"iPad2,6"]
        ||[deviceString isEqualToString:@"iPad2,7"])   return @"iPad Mini 1";
    
    if ([deviceString isEqualToString:@"iPad4,4"]
        ||[deviceString isEqualToString:@"iPad4,5"]
        ||[deviceString isEqualToString:@"iPad4,6"])      return @"iPad mini 2";
    
    if ([deviceString isEqualToString:@"iPad4,7"]
        ||[deviceString isEqualToString:@"iPad4,8"]
        ||[deviceString isEqualToString:@"iPad4,9"])      return @"iPad mini 3";
    
    if ([deviceString isEqualToString:@"iPad5,1"]
        ||[deviceString isEqualToString:@"iPad5,2"])      return @"iPad mini 4";
    
    if ([deviceString isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([deviceString isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    return deviceString;
}



@end

