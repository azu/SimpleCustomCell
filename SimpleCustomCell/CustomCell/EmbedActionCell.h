//
//  Created by azu on 12/10/16.
//


#import <Foundation/Foundation.h>


@interface EmbedActionCell : UITableViewCell {
}

@property(weak, nonatomic) IBOutlet UILabel *countLabel;
@property(weak, nonatomic) IBOutlet UIButton *button;
@property(nonatomic, strong) NSIndexPath *indexPath;


@end