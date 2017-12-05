#import "TLFriendsViewController.h"
@interface TLFriendsViewController ()
@property (nonatomic, strong) UIImageView *scrollTopView;

@property (nonatomic, strong) UILabel *footerLabel;

@end

@implementation TLFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"通讯录"];
    
    [self p_initUI];
}
- (void)p_initUI
{
    [self.tableView setLayoutMargins:UIEdgeInsetsMake(0, 10, 0, 0)];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 10, 0, 0)];
    [self.tableView setSeparatorColor:[UIColor colorGrayLine]];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [self.tableView setSectionIndexColor:[UIColor colorBlackForNavBar]];
    [self.tableView setTableFooterView:self.footerLabel];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_add_friend"] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonDown:)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
}

@end
