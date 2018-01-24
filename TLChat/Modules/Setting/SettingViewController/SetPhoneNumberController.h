//
//  SetPhoneNumberController.h
//  TLChat
//
//  Created by 张总天 on 14/01/2018.
//  Copyright © 2018 IOS Team. All rights reserved.
//

#import "TLSettingViewController.h"

@interface SetPhoneNumberController : TLSettingViewController
{
    //原号码提示label
    UILabel *_prePhoneNumber;
    //新号码提示label
    UILabel *_newPhoneNumber;
    //新号码确认提示label
    UILabel *_newPhoneNumber2;
    //原号码输入框
    UITextField *_tfPrePhoneNumber;
    //新号码输入框
    UITextField *_tfnewPhoneNumber;
    //新号码确认输入框
    UITextField *_tfnewPhoneNumber2;
    
    //确认修改号码按钮
    UIButton *_btSetPhoneNumber;
    
}
@end
