//
//  ALMainView.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainView.h"

#import "UIColor+ALColors.h"
#import "UIFont+ALFonts.h"

@interface ALMainView () {
    UICollectionViewFlowLayout *_flowLayout;
}

@end

@implementation ALMainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont alHelveticaNeueRegularWithSize:17];
        self.titleLabel.textColor = [UIColor alMainColorElement];
        
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [_flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_flowLayout];
        self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        self.collectionView.showsVerticalScrollIndicator   = NO;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.collectionView];
        
        _shadowView = [[UIView alloc] init];
        self.shadowView.translatesAutoresizingMaskIntoConstraints = NO;
        self.shadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3f];
        _shadowView.hidden = YES;
        [self addSubview:self.shadowView];
        
        _indicatorView = [[UIActivityIndicatorView alloc] init];
        self.indicatorView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.shadowView addSubview:self.indicatorView];

        [self makeConstraints];
    }
    
    return self;
}

- (void)makeConstraints {
    [super makeConstraints];
    
    [self.collectionView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.collectionView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:5.f].active = YES;
    [self.collectionView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-5.f].active = YES;
    [self.collectionView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-5.f].active = YES;
    
    [_shadowView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [_shadowView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [_shadowView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    [_shadowView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    
    [_indicatorView.centerXAnchor constraintEqualToAnchor:_shadowView.centerXAnchor].active = YES;
    [_indicatorView.centerYAnchor constraintEqualToAnchor:_shadowView.centerYAnchor].active = YES;
}

@end
