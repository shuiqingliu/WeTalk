//
//  ChatViewController.m
//  TLChat
//
//  Created by qingliu on 12/5/17.
//  Copyright © 2017 李伯坤. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@property (nonatomic,strong) UIImageView *chatScrollImageView;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initChatUI];


    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.toolbarHidden = YES;
    [super viewWillDisappear:animated];
}
//
//- （void)barbutton

#pragma mark - private method

- (void)initChatUI{
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tabBarItem setTitle:self.chatName];
    [self.navigationItem setTitle:self.chatName];
    self.navigationController.toolbarHidden = NO;
    [self.tableView addSubview:self.chatScrollImageView];
    [self.chatScrollImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.tableView);
        make.bottom.mas_equalTo(self.tableView.mas_top).mas_offset(-35);
    }];
    
//    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_add"] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonDown:)];
//    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
}

//UIImageView setter method
- (UIImageView*)chatScrollImageView{
    if(_chatScrollImageView == nil){
        _chatScrollImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"conv_wechat_icon"]];
    }
    return _chatScrollImageView;
}


// TODO: add bottom toolbar to input text, record message and send image
//- (UIToolbar*)to

@end

