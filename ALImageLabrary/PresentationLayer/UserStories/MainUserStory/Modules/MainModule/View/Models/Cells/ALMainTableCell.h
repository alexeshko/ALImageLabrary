//
//  ALMainTableCell.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ALMainTableItem.h"

@interface ALMainTableCell : UICollectionViewCell

- (void)configureWithItem:(ALMainTableItem *)item;

@end
