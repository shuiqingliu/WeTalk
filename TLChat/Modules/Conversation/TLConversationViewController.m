
#import "TLConversationViewController.h"
#import "ChatViewController.h"
#import <AFNetworking.h>



@interface TLConversationViewController ()

@property (nonatomic, strong) UIImageView *scrollTopView;
@property (nonatomic,strong) NSMutableArray *cellData;


@end

@implementation TLConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Test"];
    
    
    [self p_initUI];        // 初始化界面UI
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStatusChange:) name:AFNetworkingReachabilityDidChangeNotification object:nil];
    //init cell date
    self.cellData  = [[NSMutableArray alloc] initWithObjects:@"李敏宝宝", @"凯神",@"总天大佬", nil];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
   
}


#pragma mark - Private Methods -
- (void)p_initUI
{
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
   // [self.tableView setTableHeaderView:self.searchController.searchBar];
    [self.tableView addSubview:self.scrollTopView];
    [self.scrollTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.tableView);
        make.bottom.mas_equalTo(self.tableView.mas_top).mas_offset(-35);
    }];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_add"] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonDown:)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
}


- (UIImageView *)scrollTopView
{
    if (_scrollTopView == nil) {
        _scrollTopView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"conv_wechat_icon"]];
    }
    return _scrollTopView;
}

//init UITableViewCell
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"总天大佬";
    //create reusable cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //if cell not exist then init cell with default style
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell.textLabel setText:[self.cellData objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.cellData count];
}

//handle cell select event
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //get chat username
    NSString *cellText = [[tableView cellForRowAtIndexPath:indexPath].textLabel text];
    //init chate viewcontroller
    ChatViewController *chatController = [[ChatViewController alloc] init];
    chatController.chatName = cellText;
    //hide bottom bar
    [self setHidesBottomBarWhenPushed:YES];
    //display chat view
    [self.navigationController pushViewController:chatController animated:YES];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:self.navigationItem.backBarButtonItem.style target:nil action:nil];
    
    [self setHidesBottomBarWhenPushed:NO];

//    chatController.modalPresentationStyle = UIModalPresentationOverFullScreen;
//    [self presentViewController:chatController animated:YES completion:nil];
    
}

@end
