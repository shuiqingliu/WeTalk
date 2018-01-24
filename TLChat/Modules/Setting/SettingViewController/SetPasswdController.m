//
//  SetPasswdController.m
//  TLChat
//
//  Created by 张总天 on 24/12/2017.
//  Copyright © 2017 IOS Team. All rights reserved.
//

#import "SetPasswdController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface SetPasswdController ()

@end

@implementation SetPasswdController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"更改密码"];
    //原密码提示标签创建
    _prePassword = [[UILabel alloc] init];
    _prePassword.frame = CGRectMake(20, 60, 80, 40);
    _prePassword.font = [UIFont systemFontOfSize:15];
    _prePassword.text = @"原密码:";
    _prePassword.textAlignment = NSTextAlignmentLeft;
    
    //新密码提示标签创建
    _newPassword = [[UILabel alloc] init];
    _newPassword.frame = CGRectMake(20, 140, 80, 40);
    _newPassword.text = @"新密码:";
    _newPassword.font = [UIFont systemFontOfSize:15];
    _newPassword.textAlignment = NSTextAlignmentLeft;
    
    //新密码确认标签创建
    _newPassword2 = [[UILabel alloc] init];
    _newPassword2.frame = CGRectMake(20, 220, 80, 40);
    _newPassword2.text = @"密码确认:";
    _newPassword2.font = [UIFont systemFontOfSize:15];
    _newPassword2.textAlignment = NSTextAlignmentLeft;
    
    //原密码输入框
    _tfPrePassword = [[UITextField alloc]init];
    _tfPrePassword.frame = CGRectMake(120, 60, 180, 40);
    _tfPrePassword.placeholder = @"请输入原密码...";
    _tfPrePassword.borderStyle = UITextBorderStyleRoundedRect;
    _tfPrePassword.secureTextEntry = YES;
    
    //新密码输入框
    _tfnewPassword = [[UITextField alloc]init];
    _tfnewPassword.frame = CGRectMake(120, 140, 180, 40);
    _tfnewPassword.placeholder = @"请输入新密码...";
    _tfnewPassword.borderStyle = UITextBorderStyleRoundedRect;
    _tfnewPassword.secureTextEntry = YES;
    
    //新密码确认输入框
    _tfnewPassword2 = [[UITextField alloc] init];
    _tfnewPassword2.frame = CGRectMake(120, 220, 180, 40);
    _tfnewPassword2.placeholder = @"请确认新密码...";
    _tfnewPassword2.borderStyle = UITextBorderStyleRoundedRect;
    _tfnewPassword2.secureTextEntry = YES;
    
    //确认修改按钮
    _btSetPasswd = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btSetPasswd.frame = CGRectMake(20, 360, 335, 40);
    [_btSetPasswd setTitle:@"确认修改" forState:UIControlStateNormal];
    [_btSetPasswd setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btSetPasswd setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_btSetPasswd setBackgroundColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    
    [_btSetPasswd addTarget:self action:@selector(pressSetPasswd) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:_prePassword];
    [self.view addSubview:_newPassword];
    [self.view addSubview:_newPassword2];
    [self.view addSubview:_tfPrePassword];
    [self.view addSubview:_tfnewPassword];
    [self.view addSubview:_tfnewPassword2];
    [self.view addSubview:_btSetPasswd];
    
}

- (void) pressSetPasswd
{
    NSString *strPrePasswd = @"123456";
    
    NSString *strTextPrePwd = _tfPrePassword.text;
    NSString *strTextNewPwd = _tfnewPassword.text;
    NSString *strTextNewPwd2 = _tfnewPassword2.text;
    
    if (![strTextPrePwd isEqualToString:strPrePasswd])
    {
        NSLog(@"原密码错误!");
        UIAlertView *alView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"原密码错误，修改密码失败！" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
        [alView show];
        
    }
    else if (strTextNewPwd.length > 8 || strTextNewPwd2.length > 8)
    {
        NSLog(@"新密码长度不符！");
        UIAlertView *alView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"新密码长度过长（最多8位），修改失败" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
        [alView show];
    }
    else if (![strTextNewPwd  isEqualToString:strTextNewPwd2])
               {
                   NSLog(@"两次输入新密码不一致！");
                   UIAlertView *alView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"新密码确认不一致, 修改失败!" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
                   [alView show];
               }
    else
    {
        NSLog(@"密码修改成功！");
         UIAlertView *alView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"验证成功，密码修改成功！" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil];
        [alView show];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//点击空白处回收键盘
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_tfPrePassword resignFirstResponder];
    [_tfnewPassword resignFirstResponder];
    [_tfnewPassword2 resignFirstResponder];
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

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
