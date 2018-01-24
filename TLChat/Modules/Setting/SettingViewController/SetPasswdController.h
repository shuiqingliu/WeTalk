//
//  SetPasswdController.h
//  TLChat
//
//  Created by 张总天 on 24/12/2017.
//  Copyright © 2017 李伯坤. All rights reserved.
//

#import "TLSettingViewController.h"

@interface SetPasswdController : TLSettingViewController
{
    //原密码提示label
    UILabel *_prePassword;
    //新密码提示label
    UILabel *_newPassword;
    //新密码确认提示label
    UILabel *_newPassword2;
    //原密码输入框
    UITextField *_tfPrePassword;
    //新密码输入框
    UITextField *_tfnewPassword;
    //新密码确认输入框
    UITextField *_tfnewPassword2;
    
    //确认修改密码按钮
    UIButton *_btSetPasswd;
    
}
@end
