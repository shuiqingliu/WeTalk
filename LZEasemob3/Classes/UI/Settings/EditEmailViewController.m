/************************************************************
 *  * Hyphenate CONFIDENTIAL
 * __________________
 * Copyright (C) 2016 Hyphenate Inc. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of Hyphenate Inc.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Hyphenate Inc.
 */

#import "EditEmailViewController.h"
#import "UserProfileManager.h"
#define kTextFieldWidth 290.0
#define kTextFieldHeight 40.0
#define kButtonHeight 40.0

@interface EditEmailViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) UITextField *EmailTextField;

@property (strong, nonatomic) UIButton *saveButton;

@property (strong, nonatomic) UILabel *tipLabel;

@end

@implementation EditEmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"setting.editEmail", @"Edit Email");
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self setupTextField];
    [self setupButton];
    [self setupLabel];
    
    [self setupForDismissKeyboard];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupTextField
{
    _EmailTextField = [[UITextField alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.bounds)-kTextFieldWidth)/2, 20.0, kTextFieldWidth, kTextFieldHeight)];
    
    _EmailTextField.layer.cornerRadius = 5.0;
    _EmailTextField.placeholder = NSLocalizedString(@"setting.inputNewEmail", @"Please input new email");
    _EmailTextField.font = [UIFont systemFontOfSize:15];
    _EmailTextField.backgroundColor = [UIColor whiteColor];
    _EmailTextField.returnKeyType = UIReturnKeyNext;
    _EmailTextField.delegate = self;
    _EmailTextField.enablesReturnKeyAutomatically = YES;
    _EmailTextField.layer.borderWidth = 0.5;
    _EmailTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [_EmailTextField addTarget:self action:@selector(emailFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:_EmailTextField];
}

- (void) emailFieldDidChange:(id) sender {
    UITextField *_field = (UITextField *)sender;
    if (_field.text.length >0) {
        _tipLabel.textColor = [UIColor redColor];
    } else {
        _tipLabel.textColor = [UIColor lightGrayColor];
    }
}

- (void)setupButton
{
    _saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _saveButton.frame = CGRectMake((CGRectGetWidth(self.view.bounds)-kTextFieldWidth)/2, CGRectGetMaxY(_EmailTextField.frame) + 10.0, kTextFieldWidth, kButtonHeight);
    [_saveButton setBackgroundColor:RGBACOLOR(0x00, 0xac, 0xff, 1)];
    [_saveButton setTitle:NSLocalizedString(@"setting.saveEmail", @"Save Email") forState:UIControlStateNormal];
    [_saveButton addTarget:self action:@selector(doSave:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_saveButton];
}

- (void)setupLabel
{
    _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.bounds)-kTextFieldWidth)/2, CGRectGetMaxY(_saveButton.frame) + 10.0, kTextFieldWidth, 60)];
    _tipLabel.textAlignment = NSTextAlignmentLeft;
    _tipLabel.font = [UIFont systemFontOfSize:14];
    //    _tipLabel.text = NSLocalizedString(@"setting.edittips", @"After setting this nickname, chat with the iOS client demo project, iOS will display this nickname is not a EaseMob ID, if the other party to use the Android client this setting is not effective");
    //    _tipLabel.text=@"在聊天时显示的名字";
    _tipLabel.text = @"";
    CGFloat height = 0;
    NSDictionary *attributes = @{NSFontAttributeName :[UIFont systemFontOfSize:14.0f]};
    CGRect rect;
    if ([NSString instancesRespondToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        rect = [_tipLabel.text boundingRectWithSize:CGSizeMake(kTextFieldWidth, MAXFLOAT)
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:attributes
                                            context:nil];
    } else {
        rect.size = [_tipLabel.text sizeWithFont:_tipLabel.font
                               constrainedToSize:CGSizeMake(kTextFieldWidth, MAXFLOAT)
                                   lineBreakMode:NSLineBreakByCharWrapping];
    }
    
    height = rect.size.height;
    CGRect frame = _tipLabel.frame;
    frame.size.height = height;
    _tipLabel.frame = frame;
    _tipLabel.numberOfLines = height/14;
    _tipLabel.textColor = [UIColor lightGrayColor];
    [self.view addSubview:_tipLabel];
}

- (void)doSave:(id)sender
{
    //    if(_PhoneTextField.text.length > 0)
    //    {
    //        //设置推送设置
    //        [[EMClient sharedClient] setApnsNickname:_PhoneTextField.text];
    //#pragma mark - 注释掉了
    //        //        [[UserProfileManager sharedInstance] updateUserProfileInBackground:@{kPARSE_HXUSER_NICKNAME:_nickTextField.text} completion:^(BOOL success, NSError *error){}];
    //
    //        [self.navigationController popViewControllerAnimated:YES];
    //    } else {
    //        [EMAlertView showAlertWithTitle:NSLocalizedString(@"prompt", @"Prompt")
    //                                message:NSLocalizedString(@"setting.phonenotempty", @"New phone cannot be empty")
    //                        completionBlock:nil
    //                      cancelButtonTitle:NSLocalizedString(@"ok", @"OK")
    //                      otherButtonTitles:nil];
    //    }
    
    //zzt 增加电话号码的判定逻辑
    //=0：不能为空
    //>11:号码太长
    //其他：更改成功
    if (_EmailTextField.text.length == 0) {
        [EMAlertView showAlertWithTitle:NSLocalizedString(@"prompt", @"Prompt")
                                message:NSLocalizedString(@"setting.emailnotempty", @"New email cannot be empty")
                        completionBlock:nil
                      cancelButtonTitle:NSLocalizedString(@"ok", @"OK")
                      otherButtonTitles:nil];
    }
    else if (_EmailTextField.text.length > 11) {
        [EMAlertView showAlertWithTitle:NSLocalizedString(@"prompt", @"Prompt")
                                message:NSLocalizedString(@"setting.emailtoolong", @"New email is too long")
                        completionBlock:nil
                      cancelButtonTitle:NSLocalizedString(@"ok", @"OK")
                      otherButtonTitles:nil];
    }
    else {
        //设置推送设置
        [[EMClient sharedClient] setApnsNickname:_EmailTextField.text];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
