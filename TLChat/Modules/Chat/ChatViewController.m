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
    UIBarButtonItem *one = [[UIBarButtonItem alloc] initWithTitle:@"发送图片" style:UIBarButtonItemStyleDone
                                                           target:self action:@selector(showImagePicker)];
    UIBarButtonItem *two = [[UIBarButtonItem alloc] initWithTitle:@"发送语音" style:UIBarButtonItemStyleDone
                                                           target:self  action:nil];
    [self setToolbarItems:[NSArray arrayWithObjects:one,two, nil]];
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

#pragma mark - imagaPicker
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    /*添加处理选中图像代码*/
    picker.delegate = self;
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];//把获取的图片设为当前程序的背景
    [picker.view removeFromSuperview];//
}

#pragma mark - View lifecycle
-(void)showImagePicker{
    UIApplication *myApp = [UIApplication sharedApplication];
    [myApp setStatusBarHidden:YES];//状态栏隐藏
    
    UIImagePickerController* picker = [[UIImagePickerController alloc]init];//创建
    picker.delegate = self;//设置委托
    //选取器自适应
    picker.view.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    picker.view.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    picker.view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    picker.view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    //图像来源
    picker.allowsEditing=YES;//允许编辑图片
    [self.view addSubview:picker.view];//添加到当前窗口
}

// TODO: add bottom toolbar to input text, record message and send image
//- (UIToolbar*)to
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end

