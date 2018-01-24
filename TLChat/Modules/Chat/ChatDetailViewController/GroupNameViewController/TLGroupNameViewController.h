//
//  TLGroupNameViewController.h
//  TLChat
//
//  Created by 张总天 on 14/01/2018.
//  Copyright © 2018 IOS Team. All rights reserved.
//

#import "TLViewController.h"

@interface TLGroupNameViewController : TLViewController
{
    //群组名称label
    UILabel *_GroupNameTitle;
    //新群组名称输入框
    UITextField *_tfnewGroupName;
    UIButton *_btnSetGroupName;
}
@end
