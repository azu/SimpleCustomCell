@interface SmartTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {

}

@property(nonatomic, retain) NSArray *dataSource;
@end
