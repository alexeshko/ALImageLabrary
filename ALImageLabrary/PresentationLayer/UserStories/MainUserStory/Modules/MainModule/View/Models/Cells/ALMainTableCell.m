//
//  ALMainTableCell.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainTableCell.h"

#import "ALMainTableItemImage.h"

#import "UIFont+ALFonts.h"

@interface ALMainTableCell () {
    UIImageView *_imageView;
    UILabel *_author;
    UIView *_shadowView;
    UIActivityIndicatorView *_indicatorView;
}

@end

@implementation ALMainTableCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] init];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_imageView];
        
        _author = [[UILabel alloc] init];
        _author.translatesAutoresizingMaskIntoConstraints = NO;
        _author.font = [UIFont alHelveticaNeueLightWithSize:13];
        _author.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];
        _author.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_author];
        
        _shadowView = [[UIView alloc] init];
        _shadowView.translatesAutoresizingMaskIntoConstraints = NO;
        _shadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3f];
        [self.contentView addSubview:_shadowView];
        
        _indicatorView = [[UIActivityIndicatorView alloc] init];
        _indicatorView.translatesAutoresizingMaskIntoConstraints = NO;
        [_shadowView addSubview:_indicatorView];
        
        [self makeConstraints];
    }
    return self;
}

- (void)configureWithItem:(ALMainTableItem *)item {
    if (item.images.count) {
        ALMainTableItemImage *imageItem = [item.images firstObject];
        
        if (!_indicatorView.isAnimating) {
            _imageView.alpha = 0.f;
            _author.alpha = 0.f;
            _shadowView.hidden = NO;
            [_indicatorView startAnimating];
        }
        
        if (imageItem.itemImage) {
            _author.text = item.itemAuthor;
            _imageView.image = [item.images firstObject].itemImage;
            
            _shadowView.hidden = YES;
            [_indicatorView stopAnimating];
            
            [UIView animateWithDuration:0.7 animations:^{
                _imageView.alpha = 1.f;
                _author.alpha = 1.f;
            }];
        }
    }
}

#pragma mark - Private methods

- (void)makeConstraints {
    [_imageView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [_imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
    [_imageView.widthAnchor constraintEqualToConstant:75.f].active = YES;
    [_imageView.heightAnchor constraintEqualToConstant:75.f].active = YES;
    
    [_author.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10.f].active = YES;
    [_author.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10.f].active = YES;
    [_author.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    [_author.heightAnchor constraintEqualToConstant:15.f].active = YES;
    
    [_shadowView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [_shadowView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [_shadowView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    [_shadowView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    
    [_indicatorView.centerXAnchor constraintEqualToAnchor:_shadowView.centerXAnchor].active = YES;
    [_indicatorView.centerYAnchor constraintEqualToAnchor:_shadowView.centerYAnchor].active = YES;
}

@end
