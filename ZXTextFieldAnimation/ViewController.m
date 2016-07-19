//
//  ViewController.m
//  ZXTextFieldAnimation
//
//  Created by zhangxin on 16/7/19.
//  Copyright © 2016年 zhangxin. All rights reserved.
//

#import "ViewController.h"
#import "ZXTextField.h"

@interface ViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) ZXTextField *accountModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    CGRect accountF = CGRectMake(30, 100, 300, 40);
    ZXTextField *accountModel = [[ZXTextField alloc]initWithFrame:accountF withIcon:@"dl_user" withPlaceholderText:@"请输入用户名"];
    accountModel.inputText.autocapitalizationType = UITextAutocapitalizationTypeNone;
    accountModel.inputText.autocorrectionType = UITextAutocorrectionTypeNo;
    accountModel.inputText.keyboardType = UIKeyboardTypeASCIICapable;
    accountModel.frame = accountF;
    accountModel.inputText.delegate = self;
    [self.view addSubview:accountModel];
    self.accountModel = accountModel;
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tapGr.cancelsTouchesInView = NO;
    
    [self.view addGestureRecognizer:tapGr];
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.text.length <= 0) {
        [self.accountModel textBeginEditing];
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.text.length <= 0) {
        [self.accountModel textEndEditing];
    }
}

-(void)viewTapped:(UITapGestureRecognizer*)tapGr
{
    [self.accountModel.inputText resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
