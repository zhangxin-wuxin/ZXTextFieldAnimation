//
//  ZXTextField.m
//  sport
//
//  Created by zhangxin on 16/3/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#define DURATION_TIME 0.1

#import "ZXTextField.h"

@interface ZXTextField()<UITextFieldDelegate>

@property (nonatomic,strong) NSString *PlaceholderText;

@property (nonatomic,strong) UILabel *text1;

@property (nonatomic,strong) UILabel *text2;

@property (nonatomic,strong) UILabel *text3;

@property (nonatomic,strong) UILabel *text4;

@property (nonatomic,strong) UILabel *text5;

@property (nonatomic,strong) UILabel *text6;

@property (nonatomic,strong) UILabel *text7;

@property (nonatomic,strong) UILabel *text8;

@property (nonatomic,strong) UILabel *text9;

@property (nonatomic,strong) UILabel *text10;

@property (nonatomic,assign) CGRect textFieldFrame;

@end

@implementation ZXTextField

-(instancetype)initWithFrame:(CGRect)frame withIcon:(NSString *)iconName withPlaceholderText:(NSString *)placeText{
    self = [super init];
    if (self) {
        
        self.PlaceholderText = placeText;
        
        CGFloat margin = 10;
        CGFloat iconW = 20;
        CGFloat iconH = 20;
        
        UIImageView *icon = [[UIImageView alloc]init];
        icon.image = [UIImage imageNamed:iconName];
        icon.frame = CGRectMake(margin, margin, iconW, iconH);
        [self addSubview:icon];
        
        UIImageView *line = [[UIImageView alloc]init];
        line.image = [UIImage imageNamed:@"dl_short_line"];
        line.frame = CGRectMake(CGRectGetMaxX(icon.frame) + margin, margin, 2, iconH);
        [self addSubview:line];
        
        UITextField *inputText = [[UITextField alloc]init];
        inputText.textColor = [UIColor whiteColor];
        [inputText setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
        inputText.font = [UIFont systemFontOfSize:18]; //SYS_FONT(18);
        self.textFieldFrame = CGRectMake(CGRectGetMaxX(line.frame) + margin, margin, frame.size.width - CGRectGetMaxX(line.frame) - (2 * margin), iconH);
        inputText.frame = self.textFieldFrame;
        inputText.delegate = self;
        self.inputText = inputText;
        [self.inputText setReturnKeyType:UIReturnKeyNext];
        [self addSubview:inputText];
        
        UIImageView *downLine = [[UIImageView alloc]init];
        downLine.frame = CGRectMake(0, CGRectGetMaxY(icon.frame) + margin, frame.size.width, 2);
        downLine.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:0.5];
        [self addSubview:downLine];
        
        [self testVoid];
    }
    return self;
}

-(UILabel *)makeWithFrame:(CGRect)frame withRange:(int)range
{
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(self.textFieldFrame.origin.x + 20 * range, self.textFieldFrame.origin.y, 20, 20);
    NSRange ranges = NSMakeRange(range, 1);
    label.textColor = [UIColor grayColor];
    label.text = [self.PlaceholderText substringWithRange:ranges];
    return label;
}

-(void)testVoid
{
    for (int i = 0; i < self.PlaceholderText.length; i ++) {
        if (i == 0) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.text1 = [self makeWithFrame:frame withRange:i];
            [self addSubview:self.text1];
        }else if (i == 1) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.text2 = [self makeWithFrame:frame withRange:i];
            [self addSubview:self.text2];
        }else if (i == 2) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.text3 = [self makeWithFrame:frame withRange:i];
            [self addSubview:self.text3];
        }else if (i == 3) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.text4 = [self makeWithFrame:frame withRange:i];
            [self addSubview:self.text4];
        }else if (i == 4) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.text5 = [self makeWithFrame:frame withRange:i];
            [self addSubview:self.text5];
        }else if (i == 5) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.text6 = [self makeWithFrame:frame withRange:i];
            [self addSubview:self.text6];
        }else if (i == 6) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.text7 = [self makeWithFrame:frame withRange:i];
            [self addSubview:self.text7];
        }else if (i == 7) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.text8 = [self makeWithFrame:frame withRange:i];
            [self addSubview:self.text8];
        }else if (i == 8) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.text9 = [self makeWithFrame:frame withRange:i];
            [self addSubview:self.text9];
        }else if (i == 9) {
            CGRect frame = CGRectMake(50 + 22 * i, 150, 20, 20);
            self.text10 = [self makeWithFrame:frame withRange:i];
            [self addSubview:self.text10];
        }
    }
    
    [self bringSubviewToFront:self.inputText];
}

-(void)addBeginAnimationWithLabel:(UILabel *)label withIndex:(CGFloat)index
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((DURATION_TIME * 0.5) * index * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CGRect frame = label.frame;
        CABasicAnimation *aniBounds = [CABasicAnimation animationWithKeyPath:@"bounds"];
        aniBounds.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, CGRectGetWidth(frame), 0)];
        aniBounds.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        
        CABasicAnimation *aniScale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        aniScale.fromValue = [NSNumber numberWithFloat:1.0];
        aniScale.toValue = [NSNumber numberWithFloat:0.8];
        
        CABasicAnimation *aniPosition = [CABasicAnimation animationWithKeyPath:@"position"];
        aniPosition.fromValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMinX(frame), label.frame.origin.y)];
        aniPosition.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMinX(frame) - index * 4, label.frame.origin.y - 10)];
        
        CABasicAnimation *aniAnchorPoint = [CABasicAnimation animationWithKeyPath:@"anchorPoint"];
        aniAnchorPoint.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 1)];
        aniAnchorPoint.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 1)];
        
//        CABasicAnimation *aniOpacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
//        aniOpacity.fromValue = [NSNumber numberWithFloat:0.0];
//        aniOpacity.toValue = [NSNumber numberWithFloat:1.0];
        
        CAAnimationGroup *anis = [CAAnimationGroup animation];
        anis.animations = @[aniBounds,aniPosition,aniScale,aniAnchorPoint];
        anis.duration = DURATION_TIME;
        anis.removedOnCompletion = NO;
        anis.fillMode = kCAFillModeForwards;
        [label.layer addAnimation:anis forKey:nil];
    });
}

-(void)textBeginEditing
{
    [self addBeginAnimationWithLabel:self.text1 withIndex:0];
    [self addBeginAnimationWithLabel:self.text2 withIndex:1];
    [self addBeginAnimationWithLabel:self.text3 withIndex:2];
    [self addBeginAnimationWithLabel:self.text4 withIndex:3];
    [self addBeginAnimationWithLabel:self.text5 withIndex:4];
    [self addBeginAnimationWithLabel:self.text6 withIndex:5];
    [self addBeginAnimationWithLabel:self.text7 withIndex:6];
    [self addBeginAnimationWithLabel:self.text8 withIndex:7];
    [self addBeginAnimationWithLabel:self.text9 withIndex:8];
    [self addBeginAnimationWithLabel:self.text10 withIndex:9];
    
}

-(void)addEndAnimationWithLabel:(UILabel *)label withIndex:(CGFloat)index
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((DURATION_TIME * 0.5) * index * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        CGRect frame = label.frame;
        CABasicAnimation *aniBounds = [CABasicAnimation animationWithKeyPath:@"bounds"];
        aniBounds.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, CGRectGetWidth(frame), 0)];
        aniBounds.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        
        CABasicAnimation *aniAnchorPoint = [CABasicAnimation animationWithKeyPath:@"anchorPoint"];
        aniAnchorPoint.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 1)];
        aniAnchorPoint.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 1)];
        
        CABasicAnimation *aniPosition = [CABasicAnimation animationWithKeyPath:@"position"];
        aniPosition.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMinX(frame), label.frame.origin.y)];
        aniPosition.fromValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMinX(frame) - index * 4, label.frame.origin.y - 10)];
        
        CABasicAnimation *aniScale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        aniScale.fromValue = [NSNumber numberWithFloat:0.8];
        aniScale.toValue = [NSNumber numberWithFloat:1.0];
        
//        CABasicAnimation *aniOpacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
//        aniOpacity.toValue = [NSNumber numberWithFloat:0.0];
//        aniOpacity.fromValue = [NSNumber numberWithFloat:1.0];
        
        CAAnimationGroup *anis = [CAAnimationGroup animation];
        anis.animations = @[aniBounds,aniPosition,aniScale,aniAnchorPoint];
        anis.duration = 0.1;
        anis.removedOnCompletion = NO;
        anis.fillMode = kCAFillModeForwards;
        [label.layer addAnimation:anis forKey:nil];
    });
}

-(void)textEndEditing
{
    [self addEndAnimationWithLabel:self.text1 withIndex:0];
    [self addEndAnimationWithLabel:self.text2 withIndex:1];
    [self addEndAnimationWithLabel:self.text3 withIndex:2];
    [self addEndAnimationWithLabel:self.text4 withIndex:3];
    [self addEndAnimationWithLabel:self.text5 withIndex:4];
    [self addEndAnimationWithLabel:self.text6 withIndex:5];
    [self addEndAnimationWithLabel:self.text7 withIndex:6];
    [self addEndAnimationWithLabel:self.text8 withIndex:7];
    [self addEndAnimationWithLabel:self.text9 withIndex:8];
    [self addEndAnimationWithLabel:self.text10 withIndex:9];

}

@end
