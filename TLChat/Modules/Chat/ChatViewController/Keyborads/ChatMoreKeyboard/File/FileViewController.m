//
//  ChatViewController.m
//  TLChat
//
//  Created by qingliu on 12/5/17.
//  Copyright © 2017 李伯坤. All rights reserved.
//

#import "FileViewController.h"

@interface FileViewController ()

@property (nonatomic,strong) UIImageView *chatScrollImageView;
@property (nonatomic,strong) UITextField *inputTextField;
@property (nonatomic,strong) UIButton *voiceRecordBtn;
@property (nonatomic,strong) NSString *fileName;

@end

@implementation FileViewController
@synthesize tableview;
@synthesize array;
@synthesize arrayImage;
@synthesize fileTitle;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initChatUI];
    NSMutableArray *arrayValue = [[NSMutableArray alloc]init];
    NSMutableArray *arrayImageValue = [[NSMutableArray alloc]init];
    for (int i = 1; i<= 3; i++)
    {
        NSString *value = [NSString stringWithFormat:@"%d",i];
        NSString *imageName = [NSString stringWithFormat:@"image%@.png",value];
        UIImage *image = [UIImage imageNamed:imageName];
        [arrayImageValue addObject:image];
    }
    
    NSString *word = @"本草纲目.doc";
    [arrayValue addObject:word];
    NSString *ppt = @"软件工程.ppt";
    [arrayValue addObject:ppt];
    NSString *pdf = @"JAVA编程思想.pdf";
    [arrayValue addObject:pdf];
    array = arrayValue;
    arrayImage = arrayImageValue;



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
    self.navigationController.toolbarHidden = YES;
    [self.tableView addSubview:self.chatScrollImageView];
    [self.chatScrollImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.tableView);
        make.bottom.mas_equalTo(self.tableView.mas_top).mas_offset(-35);
    }];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(fileSend)];
   [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
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
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

/* 这个函数是显示tableview的章节数*/
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}
/* 这个函数是指定显示多少cells*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];//这个是指定加载数据的多少即显示多少个cell，如过这个地方弄错了会崩溃的哟
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //定义个静态字符串为了防止与其他类的tableivew重复
    static NSString *CellIdentifier =@"Cell";
    //定义cell的复用性当处理大量数据时减少内存开销
    UITableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell ==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (indexPath.section == 0)
    {
        cell.imageView.image = [arrayImage objectAtIndex:indexPath.row];
    }
    cell.backgroundColor = [UIColor grayColor];
    UIView *backView = [[UIView alloc]init];
    [cell setBackgroundView:backView];
    cell.backgroundColor = [UIColor clearColor];
    
    cell.detailTextLabel.text = [array objectAtIndex:indexPath.row];
    
    cell.textLabel.text  =  [array objectAtIndex:indexPath.row];
    
    //    UIImageView *cellimageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nav_on.png"]];
    //    cell.selectedBackgroundView = cellimageView;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.fileName = cell.textLabel.text;
    NSLog(@"%@",self.fileName);
}

- (void)fileSend{
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
       [self.delegate sendFile:self.fileName];
        [self setHidesBottomBarWhenPushed:YES];
    }];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [CATransaction commit];
}


@end

