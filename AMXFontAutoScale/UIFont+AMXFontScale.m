//
//  UIFont+AMXFontScale.m
//  AMXFontAutoScale
//
//  Created by Alexandru Maimescu on 3/15/17.
//  Copyright © 2017 Alex Maimescu. All rights reserved.
//

#import "UIFont+AMXFontScale.h"
#import "NSObject+AMXFontScale.h"

@implementation UIFont (AMXFontScale)

- (instancetype)amx_scaledFontForReferenceScreenSize:(AMXScreenSize)screenSize
{
    CGFloat multiplier = [self amx_fontPointSizeMultiplierForReferenceScreenSize:screenSize];
    UIFont *finalFont = self;
    
    if (multiplier != 1) {
        CGFloat finalSize = self.pointSize * multiplier;
        finalFont = [UIFont fontWithDescriptor:self.fontDescriptor size:finalSize];
    }
    
    return finalFont;
}

- (CGFloat)amx_fontPointSizeMultiplierForReferenceScreenSize:(AMXScreenSize)screenSize
{
    return [self amx_currentScreenWidth] / [self amx_screenWidthForScreenSize:screenSize];
}

- (CGFloat)amx_screenWidthForScreenSize:(AMXScreenSize)screenSize
{
    switch (screenSize) {
        case AMXScreenSize3p5Inch:
        case AMXScreenSize4Inch:
            return 320;
        case AMXScreenSize4p7Inch:
        case AMXScreenSize5p8Inch:
            return 375;
        case AMXScreenSize5p5Inch:
        case AMXScreenSize6p1Inch:
        case AMXScreenSize6p5Inch:
            return 414;
        case AMXScreenSize7p9Inch:
        case AMXScreenSize9p7Inch:
            return 768;
        case AMXScreenSize10p5Inch:
        case AMXScreenSize11Inch:
            return 834;
        case AMXScreenSize12p9Inch:
            return 1024;
        case AMXScreenSizeCurrent:
        default:
            break;
    }
    
    return [self amx_currentScreenWidth];
}

- (CGFloat)amx_currentScreenWidth
{
    return CGRectGetWidth([[UIScreen mainScreen] bounds]);
}

@end
