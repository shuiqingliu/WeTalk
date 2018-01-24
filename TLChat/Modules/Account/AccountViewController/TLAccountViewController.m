//
//  TLAccountViewController.m
//  TLChat
//
//  Created by iOS Team on 2017/1/6.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLAccountViewController.h"
#import "TLLoginViewController.h"
#import "TLRegisterViewController.h"
#import "TLUserHelper.h"

#define     HEIGHT_BUTTON       50
#define     EDGE_BUTTON         35

typedef NS_ENUM(NSInteger, TLAccountButtonType) {
    TLAccountButtonTypeRegister,
    TLAccountButtonTypeLogin,
    TLAccountButtonTypeTest,
};

@interface TLAccountViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation TLAccountViewController

- (void)loadView {
    [super loadView];
    
    CGSize viewSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    NSString *viewOrientation = @"Portrait";    //横屏请设置成 @"Landscape"
    NSArray *launchImages = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    NSString *launchImageName = nil;
    for (NSDictionary *dict in launchImages){
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
            launchImageName = dict[@"UILaunchImageName"];
        }
    }
    [self.imageView setImage:[UIImage imageNamed:launchImageName]];
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
   
    UIButton *(^createButton)(NSString *title, UIColor *bgColor, NSInteger tag) = ^UIButton *(NSString *title, UIColor *bgColor, NSInteger tag) {
        UIButton *button = [[UIButton alloc] init];
        [button setTag:tag];
        [button setTitle:title forState:UIControlStateNormal];
        [button setBackgroundColor:bgColor];
        [button.titleLabel setFont:[UIFont systemFontOfSize:19]];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:5.0f];
        return button;
    };
    
    // 登录按钮
    UIButton *loginButton = createButton(@"登 录", [UIColor colorGreenDefault], TLAccountButtonTypeLogin);
    [self.view addSubview:loginButton];
    [loginButton setBackgroundColor:[UIColor blueColor] forState:UIControlStateNormal];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(EDGE_BUTTON);
        make.right.mas_equalTo(-EDGE_BUTTON);
        make.height.mas_equalTo(HEIGHT_BUTTON);
        make.bottom.mas_equalTo(-EDGE_BUTTON * 2);
        //make.width.mas_equalTo((SCREEN_WIDTH - EDGE_BUTTON * 3));
        //make.size.and.bottom.mas_equalTo(registerButton);
    }];
    
    
    // 测试按钮
    UIButton *testButton = createButton(@"使用测试账号登录", [UIColor clearColor], TLAccountButtonTypeTest);
    [testButton.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
    [self.view addSubview:testButton];
    [testButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-5);
        make.left.mas_equalTo(EDGE_BUTTON);
        make.right.mas_equalTo(-EDGE_BUTTON);
        make.height.mas_equalTo(HEIGHT_BUTTON);
    }];
}


#pragma mark - # Event Response
- (void)buttonClicked:(UIButton *)sender
{
    if (sender.tag == TLAccountButtonTypeLogin) {
        TLLoginViewController *loginVC = [[TLLoginViewController alloc] init];
        TLWeakSelf(self);
        TLWeakSelf(loginVC);
        [loginVC setLoginSuccess:^{
            [weakloginVC dismissViewControllerAnimated:NO completion:nil];
            if (weakself.loginSuccess) {
                weakself.loginSuccess();
            }
        }];
        [self presentViewController:loginVC animated:YES completion:nil];
    }
    else if (sender.tag == TLAccountButtonTypeTest) {
        [[TLUserHelper sharedHelper] loginTestAccount];
        if (self.loginSuccess) {
            self.loginSuccess();
        }
    }
}


#pragma mark - # Getter
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}



@end
