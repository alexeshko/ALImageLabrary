//
//  ALMainView.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALView.h"

@interface ALMainView : ALView

@property (strong, nonatomic, readonly) UILabel *titleLabel;

@property (strong, nonatomic, readonly) UICollectionView *collectionView;

@property (strong, nonatomic, readonly) UIView *shadowView;

@property (strong, nonatomic, readonly) UIActivityIndicatorView *indicatorView;

@end
