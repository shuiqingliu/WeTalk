//
//  SetMailViewController.m
//  TLChat
//
//  Created by 张总天 on 13/01/2018.
//  Copyright © 2018 IOS Team. All rights reserved.
//

#import "SetMailViewController.h"

@interface SetMailViewController ()

@end

@implementation SetMailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"更改邮箱"];

    
    //原邮箱提示标签创建
    _preMail = [[UILabel alloc] init];
    _preMail.frame = CGRectMake(20, 60, 80, 40);
    _preMail.font = [UIFont systemFontOfSize:15];
    _preMail.text = @"原邮箱：";
    _preMail.textAlignment = NSTextAlignmentLeft;
    
    //新邮箱提示标签创建
    _newMail = [[UILabel alloc] init];
    _newMail.frame = CGRectMake(20, 140, 80, 40);
    _newMail.font = [UIFont systemFontOfSize:15];
    _newMail.text = @"新邮箱: ";
    _newMail.textAlignment = NSTextAlignmentLeft;
    
    //新邮箱确认标签创建
    _newMail2 = [[UILabel alloc] init];
    _newMail2.frame = CGRectMake(20, 220, 80, 40);
    _newMail2.text = @"邮箱确认:";
    _newMail2.font = [UIFont systemFontOfSize:15];
    _newMail2.textAlignment = NSTextAlignmentLeft;
    
    //原邮箱输入框
    _tfPreMail = [[UITextField alloc]init];
    _tfPreMail.frame = CGRectMake(120, 60, 180, 40);
    _tfPreMail.placeholder = @"请输入原邮箱...";
    _tfPreMail.borderStyle = UITextBorderStyleRoundedRect;
    _tfPreMail.secureTextEntry = YES;
    
    //新邮箱输入框
    _tfnewMail = [[UITextField alloc]init];
    _tfnewMail.frame = CGRectMake(120, 140, 180, 40);
    _tfnewMail.placeholder = @"请输入新邮箱...";
    _tfnewMail.borderStyle = UITextBorderStyleRoundedRect;
    _tfnewMail.secureTextEntry = YES;
    
    //新邮箱确认输入框
    _tfnewMail2 = [[UITextField alloc] init];
    _tfnewMail2.frame = CGRectMake(120, 220, 180, 40);
    _tfnewMail2.placeholder = @"请确认新邮箱...";
    _tfnewMail2.borderStyle = UITextBorderStyleRoundedRect;
    _tfnewMail2.secureTextEntry = YES;
    
    //确认修改按钮
    _btSetMail = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btSetMail.frame = CGRectMake(20, 360, 335, 40);
    [_btSetMail setTitle:@"确认修改" forState:UIControlStateNormal];
    [_btSetMail setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btSetMail setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btSetMail setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    
    [_btSetMail addTarget:self action:@selector(pressSetMail) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:_preMail];
    [self.view addSubview:_newMail];
    [self.view addSubview:_newMail2];
    [self.view addSubview:_tfPreMail];
    [self.view addSubview:_tfnewMail];
    [self.view addSubview:_tfnewMail2];
    [self.view addSubview:_btSetMail];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) pressSetMail
{
    NSString *strPreMail = @"someone@bupt.edu.cn";
    
    NSString *strTextPreMail = _tfPreMail.text;
    NSString *strTextNewMail = _tfnewMail.text;
    NSString *strTextNewMail2 = _tfnewMail2.text;
    
    if (![strTextPreMail isEqualToString:strPreMail]) {
        NSLog(@"原邮箱不符！");
        UIAlertView *alView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"原邮箱不符，修改邮箱失败！" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
        [alView show];
    }
    else if (strTextNewMail.length >= 21 || strTextNewMail2.length >= 21)
    {
        NSLog(@"新邮箱格式不符！");
        UIAlertView *alview = [[UIAlertView alloc] initWithTitle:@"提示" message:@"新密码长度过长（最多20位），修改失败！" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
        [alview show];
    }
    else if (![strTextNewMail isEqualToString:strTextNewMail2])
    {
        NSLog(@"两次输入新邮箱不一致！");
        UIAlertView *alView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"新邮箱确认不一致, 修改失败!" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
        [alView show];
    }
    else
    {
        NSLog(@"邮箱修改成功！");
        UIAlertView *alView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"验证成功，邮箱修改成功！" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil];
        [alView show];
        //@-@ 更改邮箱
        //点击确认按钮后，向服务器发送邮箱修改消息(setMail,uid,newMail)
        //服务器确认修改成功后刷新在个人信息界面
    }
    
    
}

//点击空白处回收键盘
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_tfPreMail resignFirstResponder];
    [_tfnewMail resignFirstResponder];
    [_tfnewMail2 resignFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}





@end
