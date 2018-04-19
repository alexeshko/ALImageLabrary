//
//  ALMainDetailTableCell.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 19.04.18.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALMainDetailTableItem;

@interface ALMainDetailTableCell : UITableViewCell

- (void)configureWithItem:(ALMainDetailTableItem *)item;

@end
