//
//  SetPhoneNumberController.m
//  TLChat
//
//  Created by 张总天 on 14/01/2018.
//  Copyright © 2018 IOS Team. All rights reserved.
//

#import "SetPhoneNumberController.h"

@interface SetPhoneNumberController ()

@end

@implementation SetPhoneNumberController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"更改电话"];
    //原电话提示标签创建
    _prePhoneNumber = [[UILabel alloc] init];
    _prePhoneNumber.frame = CGRectMake(20, 60, 80, 40);
    _prePhoneNumber.font = [UIFont systemFontOfSize:15];
    _prePhoneNumber.text = @"原电话：";
    _prePhoneNumber.textAlignment = NSTextAlignmentLeft;
    
    //新电话提示标签创建
    _newPhoneNumber = [[UILabel alloc] init];
    _newPhoneNumber.frame = CGRectMake(20, 140, 80, 40);
    _newPhoneNumber.font = [UIFont systemFontOfSize:15];
    _newPhoneNumber.text = @"新电话: ";
    _newPhoneNumber.textAlignment = NSTextAlignmentLeft;
    
    //新电话确认标签创建
    _newPhoneNumber2 = [[UILabel alloc] init];
    _newPhoneNumber2.frame = CGRectMake(20, 220, 80, 40);
    _newPhoneNumber2.text = @"电话确认:";
    _newPhoneNumber2.font = [UIFont systemFontOfSize:15];
    _newPhoneNumber2.textAlignment = NSTextAlignmentLeft;
    
    //原电话输入框
    _tfPrePhoneNumber = [[UITextField alloc]init];
    _tfPrePhoneNumber.frame = CGRectMake(120, 60, 180, 40);
    _tfPrePhoneNumber.placeholder = @"请输入原电话...";
    _tfPrePhoneNumber.borderStyle = UITextBorderStyleRoundedRect;
    _tfPrePhoneNumber.secureTextEntry = YES;
    
    //新电话输入框
    _tfnewPhoneNumber = [[UITextField alloc]init];
    _tfnewPhoneNumber.frame = CGRectMake(120, 140, 180, 40);
    _tfnewPhoneNumber.placeholder = @"请输入新电话...";
    _tfnewPhoneNumber.borderStyle = UITextBorderStyleRoundedRect;
    _tfnewPhoneNumber.secureTextEntry = YES;
    
    //新电话确认输入框
    _tfnewPhoneNumber2 = [[UITextField alloc] init];
    _tfnewPhoneNumber2.frame = CGRectMake(120, 220, 180, 40);
    _tfnewPhoneNumber2.placeholder = @"请确认新电话...";
    _tfnewPhoneNumber2.borderStyle = UITextBorderStyleRoundedRect;
    _tfnewPhoneNumber2.secureTextEntry = YES;
    
    //确认修改按钮
    _btSetPhoneNumber = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btSetPhoneNumber.frame = CGRectMake(20, 360, 335, 40);
    [_btSetPhoneNumber setTitle:@"确认修改" forState:UIControlStateNormal];
    [_btSetPhoneNumber setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btSetPhoneNumber setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btSetPhoneNumber setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    
    [_btSetPhoneNumber addTarget:self action:@selector(pressSetMail) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:_prePhoneNumber];
    [self.view addSubview:_newPhoneNumber];
    [self.view addSubview:_newPhoneNumber2];
    [self.view addSubview:_tfPrePhoneNumber];
    [self.view addSubview:_tfnewPhoneNumber];
    [self.view addSubview:_tfnewPhoneNumber2];
    [self.view addSubview:_btSetPhoneNumber];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) pressSetMail
{
    NSString *strPrePhone = @"12345";
    
    NSString *strTextPrePhone = _tfPrePhoneNumber.text;
    NSString *strTextNewPhone = _tfnewPhoneNumber.text;
    NSString *strTextNewPhone2 = _tfnewPhoneNumber2.text;
    
    if (![strTextPrePhone isEqualToString:strPrePhone]) {
        NSLog(@"原电话不符！");
        UIAlertView *alView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"原电话不符，修改电话失败！" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
        [alView show];
    }
    else if (strTextNewPhone.length >= 21 || strTextNewPhone2.length >= 21)
    {
        NSLog(@"新电话格式不符！");
        UIAlertView *alview = [[UIAlertView alloc] initWithTitle:@"提示" message:@"新电话长度过长（最多20位），修改失败！" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
        [alview show];
    }
    else if (![strTextNewPhone isEqualToString:strTextNewPhone2])
    {
        NSLog(@"两次输入新号码不一致！");
        UIAlertView *alView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"新电话确认不一致, 修改失败!" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
        [alView show];
    }
    else
    {
        //将修改后的电话写入json文件
        NSLog(@"好吗修改成功！");
        UIAlertView *alView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"验证成功，号码修改成功！" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil];
        [alView show];
    }
    
    
}

//点击空白处回收键盘
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_tfPrePhoneNumber resignFirstResponder];
    [_tfnewPhoneNumber resignFirstResponder];
    [_tfnewPhoneNumber2 resignFirstResponder];
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
