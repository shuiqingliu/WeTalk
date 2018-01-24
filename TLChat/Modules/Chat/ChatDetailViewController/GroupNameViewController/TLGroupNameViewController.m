//
//  TLGroupNameViewController.m
//  TLChat
//
//  Created by 张总天 on 14/01/2018.
//  Copyright © 2018 IOS Team. All rights reserved.
//

#import "TLGroupNameViewController.h"
#import "TLChatDetailHelper.h"

@interface TLGroupNameViewController ()

@end

@implementation TLGroupNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"修改群名称"];
    //[self.navigationItem ]
    
//    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonDown:)];
//    [self.navigationItem setRightBarButtonItem:rightBarButton];
    
    //群聊名称label创建
    _GroupNameTitle = [[UILabel alloc] init];
    _GroupNameTitle.frame = CGRectMake(20, 60, 80, 40);
    _GroupNameTitle.font = [UIFont systemFontOfSize:15];
    _GroupNameTitle.text = @"群聊名称";
    _GroupNameTitle.textColor = [UIColor grayColor];
    _GroupNameTitle.textAlignment = NSTextAlignmentLeft;
    
    //群聊名称输入框
    _tfnewGroupName = [[UITextField alloc] init];
    _tfnewGroupName.frame = CGRectMake(20, 100, 335, 40);
    _tfnewGroupName.placeholder = @"请输入新群名称...";
    _tfnewGroupName.borderStyle = UITextBorderStyleRoundedRect;
    
    //修改群聊名称按钮
    _btnSetGroupName = [[UIButton alloc] init];
    _btnSetGroupName.frame = CGRectMake(20, 140, 335, 40);
    [_btnSetGroupName setTitle:@"确认修改" forState:UIControlStateNormal];
    [_btnSetGroupName setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btnSetGroupName setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btnSetGroupName setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    
    [_btnSetGroupName addTarget:self action:@selector(pressSetGroupName) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:_GroupNameTitle];
    [self.view addSubview:_tfnewGroupName];
    [self.view addSubview:_btnSetGroupName];
    
}

//- (void)rightBarButtonDown {
//    NSString *newTextGroupName = _tfnewGroupName.text;
//    return newTextGroupName;
//    NSLog(@"修改到本地json");
//}

- (void)pressSetGroupName
{
    NSString *strTextNewGroupName = _tfnewGroupName.text;
    
    UIAlertView *alView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"群名称修改成功" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
    [alView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
