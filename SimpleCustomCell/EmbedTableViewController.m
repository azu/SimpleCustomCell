#import "EmbedTableViewController.h"
#import "EmbedActionCell.h"
#import "SmartTableViewController.h"
#import "AppDelegate.h"

#define kEMCellIdentifier @"EmbedActionCell"

@interface EmbedTableViewController ()

@end

@implementation EmbedTableViewController {
@private
    NSArray *dataSource_;
}

@synthesize dataSource = dataSource_;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (!self){
        return nil;
    }

    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // DataSource init

    // iOS5からは最初に一度だけnibファイルを登録すればいい
    [self.tableView registerNib:[UINib nibWithNibName:@"EmbedActionCell" bundle:nil]
        forCellReuseIdentifier:kEMCellIdentifier];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    // Update Navigation
    [self updateNavigationItemAnimated:animated];

    // deselect cell
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];

    //  update visible cells
    [self updateVisibleCells];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}


//--------------------------------------------------------------//
#pragma mark -- ViewOutlets Update --
//--------------------------------------------------------------//

- (void)updateNavigationItemAnimated:(BOOL)animated {
}
#pragma mark - Cell Operation
- (void)updateVisibleCells {
    // セルの表示更新
    for (UITableViewCell *cell in [self.tableView visibleCells]){
        [self updateCell:cell atIndexPath:[self.tableView indexPathForCell:cell]];
    }
}

- (void)updateCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSUInteger section = (NSUInteger) [indexPath section];
    NSUInteger row = (NSUInteger) [indexPath row];
    // Update Cells
    EmbedActionCell *customCell = (EmbedActionCell *) cell;
    customCell.countLabel.text = [NSString stringWithFormat:@"%d-%d", section, row];

}
//--------------------------------------------------------------//
#pragma mark -- UITableViewDataSource --
//--------------------------------------------------------------//
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView
             numberOfRowsInSection:(NSInteger)section {
    return 10;

}

- (UITableViewCell *)tableView:(UITableView *)tableView
                     cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 指定したcellIdentifierで登録してあるxibが使われる
    NSString *cellIdentifier = kEMCellIdentifier;
    EmbedActionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell){
        cell = [[EmbedActionCell alloc]
                                       initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    // Configure the cell...
    cell.indexPath = indexPath;// indexPathを受け取る
    cell.accessoryType = UITableViewCellAccessoryNone;
    [self updateCell:cell atIndexPath:indexPath];

    return cell;
}


//--------------------------------------------------------------//
#pragma mark -- UITableViewDelegate --
//--------------------------------------------------------------//

- (void)tableView:(UITableView *)tableView
        didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [UIView animateWithDuration:1.0 animations:^{
        AppDelegate *appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
        appDelegate.window.rootViewController = [[SmartTableViewController alloc] init];
    }];
    // ハイライトを外す
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
