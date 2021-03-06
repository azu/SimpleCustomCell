//
//  Created by azu on 12/10/16.
//


#import "EmbedActionCell.h"


@implementation EmbedActionCell {
    NSIndexPath *_indexPath;
}

@synthesize indexPath = _indexPath;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self){
        return nil;
    }

    return self;
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
    [self.button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pressButton:(id)pressButton {
    NSString *messageString = [NSString  stringWithFormat:@"Button at section %d row %d was tapped.", self.indexPath.section, self.indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc]
                                       initWithTitle:@"Button tapped!" message:messageString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

// オブジェクトの配置等はここで操作する
- (void)layoutSubviews {
    [super layoutSubviews];
}

@end