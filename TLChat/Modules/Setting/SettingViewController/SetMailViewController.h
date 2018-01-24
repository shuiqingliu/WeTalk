//
//  SetMailViewController.h
//  TLChat
//
//  Created by 张总天 on 13/01/2018.
//  Copyright © 2018 IOS Team. All rights reserved.
//

#import "TLSettingViewController.h"

@interface SetMailViewController : TLSettingViewController
{
    //原邮箱提示label
    UILabel *_preMail;
    //新邮箱提示label
    UILabel *_newMail;
    //新邮箱确认提示label
    UILabel *_newMail2;
    //原邮箱输入框
    UITextField *_tfPreMail;
    //新邮箱输入框
    UITextField *_tfnewMail;
    //新邮箱确认输入框
    UITextField *_tfnewMail2;
    
    //确认修改邮箱按钮
    UIButton *_btSetMail;
    
}
@end
