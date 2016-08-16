# ZXTextFieldAnimation
占位文字动画
实现了占位文字,一个一个推上去的动画!
# 效果图
<img src="https://github.com/zhangxin-wuxin/ZXTextFieldAnimation/blob/master/111.gif" width="320"><br/>

# 使用方法
```
// 创建方法
-(instancetype)initWithFrame:(CGRect)frame withIcon:(NSString *)iconName withPlaceholderText:(NSString *)placeText;
// 动画执行,上移
-(void)textBeginEditing;
// 动画执行,下移
-(void)textEndEditing;

```
<li>initWithFrame: 可自己指定TextField的大小
<li>withIcon:可以指定TextField前面的图标,如果没有,可以传nil
<li>withPlaceholderText:参数占位文字内容;

#### 创建
```
    ZXTextField *TextFieldModel = [[ZXTextField alloc]initWithFrame:frame withIcon:@"iconStr" withPlaceholderText:@"占位文字"];
    accountModel.inputText.delegate = self;
    [self.view addSubview:TextFieldModel];
    self.TextFieldModel = TextFieldModel;
```
#### 代理方法
```
// textField开始编辑时,(如果text为空)占位文字上移
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.text.length <= 0) {
        [self.TextFieldModel textBeginEditing];
    }
}
// textField结束编辑时,(如果text为空)占位文字下移
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.text.length <= 0) {
        [self.TextFieldModel textEndEditing];
    }
}
```
有问题欢迎随时联系我! zhangxin_hsh@163.com
