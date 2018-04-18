//
//  ALMainView.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainView.h"

@interface ALMainView () {
    UICollectionViewFlowLayout *_flowLayout;
}

@end

@implementation ALMainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [_flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_flowLayout];
        self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        self.collectionView.showsVerticalScrollIndicator   = NO;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.collectionView];

        [self makeConstraints];
    }
    
    return self;
}

- (void)makeConstraints {
    [super makeConstraints];
    
    [self.collectionView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.collectionView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [self.collectionView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    [self.collectionView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
}

@end
