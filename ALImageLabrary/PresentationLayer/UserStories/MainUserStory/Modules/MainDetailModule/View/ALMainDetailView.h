//
//  ALMainDetailView.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 19/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALView.h"

@interface ALMainDetailView : ALView

@property (strong, nonatomic, readonly) UIImageView *imageView;

@property (strong, nonatomic, readonly) UILabel *authorLabel;
@property (strong, nonatomic, readonly) UILabel *dateLabel;
@property (strong, nonatomic, readonly) UILabel *viewsLabel;
@property (strong, nonatomic, readonly) UILabel *coverIdLabel;
@property (strong, nonatomic, readonly) UILabel *descriptionLabel;

@property (strong, nonatomic, readonly) UITableView *commentsView;

@property (strong, nonatomic, readonly) UIView *shadowView;

@property (strong, nonatomic, readonly) UIActivityIndicatorView *indicatorView;

@end
