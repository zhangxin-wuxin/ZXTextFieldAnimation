//
//  ZXTextField.h
//  sport
//
//  Created by zhangxin on 16/3/21.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXTextField : UIView

@property (nonatomic,strong) UITextField *inputText;

//@property (nonatomic,weak) UILabel *placeholderText;

-(instancetype)initWithFrame:(CGRect)frame withIcon:(NSString *)iconName withPlaceholderText:(NSString *)placeText;

//+(UIView *)initWithIcon:(NSString *)iconName andPlaceholderText:(NSString *)text;

-(void)textBeginEditing;

-(void)textEndEditing;

@end
