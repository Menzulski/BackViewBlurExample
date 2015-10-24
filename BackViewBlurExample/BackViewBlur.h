//
//  BackViewBlur.h
//  BackViewBlurExample
//
//  Created by Stanislav Menzulski on 16.10.15.
//  Copyright © 2015 Stanislav Menzulski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BackViewBlur : UIView

// Use the following property to set the tintColor. Set it to nil to reset.
@property (nonatomic, strong) UIColor *blurTintColor;

-(void) changeBackViewBlurColor:(UIColor*)color;
-(void) backViewBlackStyle:(BOOL)useBlack;
-(void) backViewBlurAlpha:(float)alpha;

@end