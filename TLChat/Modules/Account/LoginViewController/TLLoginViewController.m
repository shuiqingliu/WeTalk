
#import "TLLoginViewController.h"
#import "TLRootProxy.h"
#import "TLLaunchManager.h"
#import "TLUserHelper.h"
#import "TLUser.h"

#define     HEIGHT_ITEM     45.0f
#define     EDGE_LINE       20.0f
#define     WIDTH_TITLE     90.0f
#define     EDGE_DETAIL     15.0f

@interface TLLoginViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIButton *cancelButton;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *originTitleLabel;
@property (nonatomic, strong) UILabel *originLabel;

@property (nonatomic, strong) UILabel *districtNumberLabel;
@property (nonatomic, strong) UITextField *phoneNumberTextField;

@property (nonatomic, strong) UILabel *passwordTitleLabel;
@property (nonatomic, strong) UITextField *passwordTextField;

@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *forgetButton;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation TLLoginViewController

- (void)loadView {
    [super loadView];
    self.statusBarStyle = UIStatusBarStyleDefault;
    
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.cancelButton];
    [self.scrollView addSubview:self.titleLabel];
    [self.scrollView addSubview:self.originTitleLabel];
    [self.scrollView addSubview:self.originLabel];
    [self.scrollView addSubview:self.districtNumberLabel];
    [self.scrollView addSubview:self.phoneNumberTextField];
    [self.scrollView addSubview:self.passwordTitleLabel];
    [self.scrollView addSubview:self.passwordTextField];
    [self.scrollView addSubview:self.loginButton];
    [self.scrollView addSubview:self.forgetButton];
    [self p_addMasonry];
  
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapView)];
    [self.scrollView addGestureRecognizer:tapGR];
    
    [self.scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT + BORDER_WIDTH_1PX)];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [TLUIUtility hiddenLoading];
    [self.phoneNumberTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

#pragma mark - # Event Response
- (void)cancelButtonClicked:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didTapView
{
    [TLUIUtility hiddenLoading];
    [self.phoneNumberTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (void)loginButtonClicked
{
    NSString *phoneNumber = self.phoneNumberTextField.text;
    NSString *password = self.passwordTextField.text;
    //验证手机号
    if (phoneNumber.length != 11 && ![phoneNumber hasPrefix:@"1"] && phoneNumber.length != 0) {
        [TLUIUtility showErrorHint:@"请输入正确的账号密码"];
        return;
    }
    if (phoneNumber.length == 0 || password.length== 0) {
        [TLUIUtility showErrorHint:@"您输入的账号密码不能为空"];
        return;
    }
    
    if ([phoneNumber  isEqual: @"110"] && [password  isEqual: @"root"]) {
        TLUserHelper *userHelper = [TLUserHelper sharedHelper];
        TLUser *user = [[TLUser alloc] init];
        user.userID = @"1001";
        //user.avatarURL = @"http://p1.qq181.com/cms/120506/2012050623111097826.jpg";
        user.avatarURL = @"http://a.hiphotos.baidu.com/zhidao/wh%3D600%2C800/sign=9766f7d6cf3d70cf4cafa20bc8ecfd38/00e93901213fb80e93b4c43830d12f2eb83894fc.jpg";
        user.nikeName = @"ABC";
        user.username = @"zhang-zt";
        user.detailInfo.qqNumber = @"1234567890";
        user.detailInfo.email = @"zhangzt@bupt.edu.cn";
        user.detailInfo.location = @"北京 海淀";
        user.detailInfo.sex = @"男";
        user.detailInfo.motto = @"Hello world!";
        user.detailInfo.momentsWallURL = @"http://img06.tooopen.com/images/20160913/tooopen_sy_178786212749.jpg";
        [userHelper setUser:user];
        UIWindow *window = self.view.window;
        [[TLLaunchManager sharedInstance] launchInWindow:window];
    }
    if ([phoneNumber  isEqual: @"120"] && [password  isEqual: @"root"]) {
        TLUserHelper *userHelper = [TLUserHelper sharedHelper];
        TLUser *user = [[TLUser alloc] init];
        user.userID = @"1002";
        user.avatarURL = @"http://p1.qq181.com/cms/120506/2012050623111097826.jpg";
        user.nikeName = @"ABC";
        user.username = @"zhang-zt";
        user.detailInfo.qqNumber = @"1234567890";
        user.detailInfo.email = @"zhangzt@bupt.edu.cn";
        user.detailInfo.location = @"北京 海淀";
        user.detailInfo.sex = @"男";
        user.detailInfo.motto = @"Hello world!";
        user.detailInfo.momentsWallURL = @"http://img06.tooopen.com/images/20160913/tooopen_sy_178786212749.jpg";
        [userHelper setUser:user];
        UIWindow *window = self.view.window;
        [[TLLaunchManager sharedInstance] launchInWindow:window];
    }   
    //[TLUIUtility showLoading:nil];
    //TLRootProxy *proxy = [[TLRootProxy alloc] init];
    //TLWeakSelf(self);
    //[proxy userLoginWithPhoneNumber:phoneNumber password:password success:^(id datas) {
      //  [TLUIUtility hiddenLoading];
//        if (weakself.loginSuccess) {
//            weakself.loginSuccess();
//        }
//    } failure:^(NSString *errMsg) {
//        [TLUIUtility showErrorHint:errMsg];
//    }];
}
-(void)forgetButtonClicked
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"忘记密码" message:@"请及时联系管理员" delegate:nil cancelButtonTitle:@"返回"otherButtonTitles:nil,nil];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
}

#pragma mark - # Private Methods
- (void)p_addMasonry
{
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(STATUSBAR_HEIGHT);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(NAVBAR_HEIGHT);
    }];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NAVBAR_HEIGHT + STATUSBAR_HEIGHT + 20);
        make.centerX.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(self.scrollView);
    }];
    
    UIView *(^crateLine)() = ^UIView *() {
        UIView *view = [[UIView alloc] init];
        [view setBackgroundColor:[UIColor colorGrayLine]];
        return view;
    };
    
    [self.originTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(EDGE_LINE);
        make.height.mas_equalTo(HEIGHT_ITEM);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_equalTo(55);
        make.width.mas_equalTo(WIDTH_TITLE);
    }];
    [self.originLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.originTitleLabel.mas_right).mas_offset(EDGE_DETAIL);
        make.centerY.mas_equalTo(self.originTitleLabel);
        make.height.mas_equalTo(HEIGHT_ITEM);
        make.right.mas_equalTo(self.view).mas_offset(-EDGE_LINE);
    }];
    UIView *line1 = crateLine();
    [self.scrollView addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.originTitleLabel.mas_bottom);
        make.left.mas_equalTo(EDGE_LINE);
        make.width.mas_equalTo(self.scrollView).mas_offset(-EDGE_LINE * 2);
        make.height.mas_equalTo(BORDER_WIDTH_1PX);
    }];
    
    [self.districtNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line1.mas_bottom);
        make.left.mas_equalTo(line1);
        make.height.mas_equalTo(HEIGHT_ITEM);
        make.width.mas_equalTo(WIDTH_TITLE);
    }];
    
    UIView *line1_1 = crateLine();
    [self.scrollView addSubview:line1_1];
    [line1_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.height.mas_equalTo(self.districtNumberLabel);
        make.left.mas_equalTo(self.districtNumberLabel.mas_right);
        make.width.mas_equalTo(BORDER_WIDTH_1PX);
    }];
    
    [self.phoneNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.originLabel);
        make.centerY.mas_equalTo(self.districtNumberLabel);
        make.height.mas_equalTo(HEIGHT_ITEM);
        make.right.mas_equalTo(self.view).mas_offset(-EDGE_LINE);
    }];
    
    UIView *line2 = crateLine();
    [self.scrollView addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.districtNumberLabel.mas_bottom);
        make.left.mas_equalTo(EDGE_LINE);
        make.width.mas_equalTo(self.scrollView).mas_offset(-EDGE_LINE * 2);
        make.height.mas_equalTo(BORDER_WIDTH_1PX);
    }];
    
    [self.passwordTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(line2);
        make.top.mas_equalTo(line2.mas_bottom);
        make.height.mas_equalTo(HEIGHT_ITEM);
        make.width.mas_equalTo(self.districtNumberLabel);
    }];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.originLabel);
        make.centerY.mas_equalTo(self.passwordTitleLabel);
        make.height.mas_equalTo(HEIGHT_ITEM);
        make.right.mas_equalTo(self.view).mas_offset(-EDGE_LINE);
    }];
    
    UIView *line3 = crateLine();
    [self.scrollView addSubview:line3];
    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTitleLabel.mas_bottom);
        make.left.mas_equalTo(EDGE_LINE);
        make.width.mas_equalTo(self.scrollView).mas_offset(-EDGE_LINE * 2);
        make.height.mas_equalTo(BORDER_WIDTH_1PX);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(line3);
        make.height.mas_equalTo(HEIGHT_ITEM);
        make.top.mas_equalTo(line3.mas_bottom).mas_offset(HEIGHT_ITEM);
    }];
 
    
    UIView *line5 = crateLine();
    [self.scrollView addSubview:line5];
    [line5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTitleLabel.mas_bottom);
        make.left.mas_equalTo(EDGE_LINE);
        make.width.mas_equalTo(self.scrollView).mas_offset(-EDGE_LINE * 2);
        make.height.mas_equalTo(BORDER_WIDTH_1PX);
    }];
    
    [self.forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(line5);
        make.height.mas_equalTo(HEIGHT_ITEM);
        make.top.mas_equalTo(line5.mas_bottom).mas_offset(HEIGHT_ITEM * 8);
    }];
   
}


#pragma mark - # Getter
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
}

- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc] init];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor colorGreenDefault] forState:UIControlStateNormal];
        [_cancelButton.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
        [_cancelButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont systemFontOfSize:40.0]];
        [_titleLabel setText:@"WeTalk"];
        [_titleLabel setTextColor:[UIColor colorWithRed:35.0/255 green:106.0/255 blue:245.0/255 alpha:1.0]];
        [_titleLabel setFont:[UIFont fontWithName:@"Courier-Bold" size:40]];
    }
    return _titleLabel;
}

- (UILabel *)originTitleLabel
{
    if (!_originTitleLabel) {
        _originTitleLabel = [[UILabel alloc] init];
        [_originTitleLabel setFont:[UIFont systemFontOfSize:17.0f]];
        [_originTitleLabel setText:@""];
    }
    return _originTitleLabel;
}
- (UILabel *)originLabel
{
    if (!_originLabel) {
        _originLabel = [[UILabel alloc] init];
        [_originLabel setFont:[UIFont systemFontOfSize:17.0f]];
        [_originLabel setText:@""];
    }
    return _originLabel;
}

- (UILabel *)districtNumberLabel
{
    if (!_districtNumberLabel) {
        _districtNumberLabel = [[UILabel alloc] init];
        [_districtNumberLabel setText:@"账号"];
        [_districtNumberLabel setTextColor:[UIColor colorWithRed:35.0/255 green:106.0/255 blue:245.0/255 alpha:1.0]];
    }
    return _districtNumberLabel;
}
- (UITextField *)phoneNumberTextField
{
    if (!_phoneNumberTextField) {
        _phoneNumberTextField = [[UITextField alloc] init];
        [_phoneNumberTextField setPlaceholder:@"请输入账号"];
        [_phoneNumberTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [_phoneNumberTextField setKeyboardType:UIKeyboardTypePhonePad];
    }
    return _phoneNumberTextField;
}

- (UILabel *)passwordTitleLabel
{
    if (!_passwordTitleLabel) {
        _passwordTitleLabel = [[UILabel alloc] init];
        [_passwordTitleLabel setText:@"密码"];
          [_passwordTitleLabel setTextColor:[UIColor colorWithRed:35.0/255 green:106.0/255 blue:245.0/255 alpha:1.0]];
    }
    return _passwordTitleLabel;
}
- (UITextField *)passwordTextField
{
    if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc] init];
        [_passwordTextField setPlaceholder:@"请输入密码"];
        [_passwordTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [_passwordTextField setSecureTextEntry:YES];
    }
    return _passwordTextField;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        UIButton *button = [[UIButton alloc] init];
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:4.0f];
        [button.layer setBorderWidth:BORDER_WIDTH_1PX];
        [button.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
        [button setBackgroundColor:[UIColor colorWithRed:35.0/255 green:106.0/255 blue:245.0/255 alpha:1.0]];
        [button setTitle:@"登录" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        _loginButton = button;
    }
    return _loginButton;
}

- (UIButton *)forgetButton
{
    if (!_forgetButton) {
        UIButton *button = [[UIButton alloc] init];
        [button.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [button setTitle:@"忘记密码" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(forgetButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        _forgetButton = button;
    }
    return _forgetButton;
}

@end
