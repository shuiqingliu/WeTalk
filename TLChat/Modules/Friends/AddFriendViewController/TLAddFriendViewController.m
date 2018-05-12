//
//  TLAddFriendViewController.m
//  TLChat
//
//  Created by libokun on 16/3/9.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLAddFriendViewController.h"

@implementation TLAddFriendViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:@"添加朋友"];
    
    //好友申请提示标签创建
    _addFriend = [[UILabel alloc] init];
    _addFriend.frame = CGRectMake(20, 60, 80, 40);
    _addFriend.font = [UIFont systemFontOfSize:15];
    _addFriend.text = @"员工工号：";
    _addFriend.textAlignment = NSTextAlignmentLeft;
    
    //好友申请输入框
    _tfAddFriend = [[UITextField alloc]init];
    _tfAddFriend.frame = CGRectMake(120, 60, 180, 40);
    _tfAddFriend.placeholder = @"请输入员工工号...";
    _tfAddFriend.borderStyle = UITextBorderStyleRoundedRect;
    _tfAddFriend.secureTextEntry = YES;
    
    //好友申请确认按钮
    _btAddFriend = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btAddFriend.frame = CGRectMake(20, 360, 335, 40);
    [_btAddFriend setTitle:@"确认添加" forState:UIControlStateNormal];
    [_btAddFriend setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btAddFriend setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btAddFriend setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    
    [_btAddFriend addTarget:self action:@selector(pressAddFriend) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_addFriend];
    [self.view addSubview:_tfAddFriend];
    [self.view addSubview:_btAddFriend];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) pressAddFriend {
    NSString *strAddFriendID = _tfAddFriend.text;
    //@-@ 添加好友
    //在此处添加发送好友申请的消息给服务器
    //得到返回结果后重新初始化通讯录界面
    //addFriend(int addFriend,userId,strAddFriendID)
    
}

//点击空白处回收键盘
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_tfAddFriend resignFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
@end
