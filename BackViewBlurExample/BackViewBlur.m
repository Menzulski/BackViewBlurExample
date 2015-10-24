//
//  BackViewBlur.m
//  BackViewBlurExample
//
//  Created by Stanislav Menzulski on 16.10.15.
//  Copyright © 2015 Stanislav Menzulski. All rights reserved.
//

#import "BackViewBlur.h"

@interface BackViewBlur ()
{
    CALayer *extraColorLayer;
}

@property (nonatomic, strong) UIToolbar *toolbar;

@end

@implementation BackViewBlur

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    // If we don't clip to bounds the toolbar draws a thin shadow on top
    [self setClipsToBounds:YES];
    
    if (![self toolbar]) {
        [self setToolbar:[[UIToolbar alloc] initWithFrame:[self bounds]]];
        [self.toolbar setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self insertSubview:[self toolbar] atIndex:0];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_toolbar]|"
                                                                     options:0
                                                                     metrics:0
                                                                       views:NSDictionaryOfVariableBindings(_toolbar)]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_toolbar]|"
                                                                     options:0
                                                                     metrics:0
                                                                       views:NSDictionaryOfVariableBindings(_toolbar)]];
        
        extraColorLayer = [CALayer layer];
        extraColorLayer.frame = [self bounds];
        extraColorLayer.backgroundColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:extraColorLayer];
    }
}

-(void) backViewBlurAlpha:(float)alpha
{
    self.toolbar.alpha = alpha;
}

- (void) setBlurTintColor:(UIColor *)blurTintColor {
    [self.toolbar setBarTintColor:blurTintColor];
}

-(void) backViewBlackStyle:(BOOL)useBlack
{
    if(useBlack)
    {
        extraColorLayer.frame = [self bounds];
        extraColorLayer.backgroundColor = [UIColor clearColor].CGColor;
        self.toolbar.barStyle = UIBarStyleBlackTranslucent;
    }else{
        self.toolbar.barStyle = UIBarStyleDefault;
    }
}

-(void) changeBackViewBlurColor:(UIColor*)color
{
    self.toolbar.barStyle = UIBarStyleDefault;
    
    extraColorLayer.frame = [self bounds];
    extraColorLayer.backgroundColor = color.CGColor;
}

@end
