@interface EmbedTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {

}

@property(nonatomic, retain) NSArray *dataSource;
@end
