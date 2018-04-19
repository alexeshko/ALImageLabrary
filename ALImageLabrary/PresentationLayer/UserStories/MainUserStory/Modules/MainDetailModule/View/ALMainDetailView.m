//
//  ALMainDetailView.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 19/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainDetailView.h"

#import "UIFont+ALFonts.h"

@interface ALMainDetailView () {
    UILabel *_authorStaticLabel;
    UILabel *_dateStaticLabel;
    UILabel *_viewsStaticLabel;
    UILabel *_coverIdStaticLabel;
    UILabel *_descriptionStaticLabel;
    UILabel *_commentsStaticLabel;
}

@end

@implementation ALMainDetailView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] init];
        self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
        self.imageView.layer.borderColor = [UIColor grayColor].CGColor;
        self.imageView.layer.borderWidth = 1.f;
        [self addSubview:self.imageView];
        
        // Author
        _authorLabel = [self createLabelAndSetDefaultProperties];
        
        _authorStaticLabel = [self createLabelAndSetDefaultProperties];
        _authorStaticLabel.text = ALLocalize(@"maindetail.author");
        
        // Date
        _dateLabel = [self createLabelAndSetDefaultProperties];
        
        _dateStaticLabel = [self createLabelAndSetDefaultProperties];
        _dateStaticLabel.text = ALLocalize(@"maindetail.date");
        
        // Views
        _viewsLabel = [self createLabelAndSetDefaultProperties];
        
        _viewsStaticLabel = [self createLabelAndSetDefaultProperties];
        _viewsStaticLabel.text = ALLocalize(@"maindetail.views");
        
        // CoverId
        _coverIdLabel = [self createLabelAndSetDefaultProperties];
        
        _coverIdStaticLabel = [self createLabelAndSetDefaultProperties];
        _coverIdStaticLabel.text = ALLocalize(@"maindetail.coverid");
        
        // Description
        _descriptionStaticLabel = [self createLabelAndSetDefaultProperties];
        _descriptionStaticLabel.textAlignment = NSTextAlignmentCenter;
        _descriptionStaticLabel.text = ALLocalize(@"maindetail.description");
        
        _descriptionLabel = [self createLabelAndSetDefaultProperties];
        _descriptionLabel.textAlignment = NSTextAlignmentCenter;
        _descriptionLabel.numberOfLines = 2;
        
        // Comments
        _commentsStaticLabel = [self createLabelAndSetDefaultProperties];
        _commentsStaticLabel.textAlignment = NSTextAlignmentCenter;
        _commentsStaticLabel.text = ALLocalize(@"maindetail.comments");
        
        _commentsView = [[UITableView alloc] init];
        self.commentsView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.commentsView];
        
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
    
    CGFloat mainMargin = 15.f;
    CGFloat otherMargin = 20.f;
    CGFloat labelWidth = 70.f;
    
    [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:mainMargin].active = YES;
    [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:mainMargin].active = YES;
    [self.imageView.widthAnchor constraintEqualToConstant:145.f].active = YES;
    [self.imageView.heightAnchor constraintEqualToConstant:145.f].active = YES;
    
    [_authorStaticLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:mainMargin].active = YES;
    [_authorStaticLabel.leadingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:mainMargin].active = YES;
    [_authorStaticLabel.widthAnchor constraintEqualToConstant:labelWidth].active = YES;
    
    [self.authorLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:mainMargin].active = YES;
    [self.authorLabel.leadingAnchor constraintEqualToAnchor:_authorStaticLabel.trailingAnchor constant:mainMargin].active = YES;
    [self.authorLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-mainMargin].active = YES;
    
    [_dateStaticLabel.topAnchor constraintEqualToAnchor:_authorStaticLabel.bottomAnchor constant:otherMargin].active = YES;
    [_dateStaticLabel.leadingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:mainMargin].active = YES;
    [_dateStaticLabel.widthAnchor constraintEqualToConstant:labelWidth].active = YES;
    
    [self.dateLabel.topAnchor constraintEqualToAnchor:self.authorLabel.bottomAnchor constant:otherMargin].active = YES;
    [self.dateLabel.leadingAnchor constraintEqualToAnchor:_dateStaticLabel.trailingAnchor constant:mainMargin].active = YES;
    [self.dateLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-mainMargin].active = YES;
    
    [_viewsStaticLabel.topAnchor constraintEqualToAnchor:_dateStaticLabel.bottomAnchor constant:otherMargin].active = YES;
    [_viewsStaticLabel.leadingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:mainMargin].active = YES;
    [_viewsStaticLabel.widthAnchor constraintEqualToConstant:labelWidth].active = YES;
    
    [self.viewsLabel.topAnchor constraintEqualToAnchor:self.dateLabel.bottomAnchor constant:otherMargin].active = YES;
    [self.viewsLabel.leadingAnchor constraintEqualToAnchor:_viewsStaticLabel.trailingAnchor constant:mainMargin].active = YES;
    [self.viewsLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-mainMargin].active = YES;
    
    [_coverIdStaticLabel.topAnchor constraintEqualToAnchor:_viewsStaticLabel.bottomAnchor constant:otherMargin].active = YES;
    [_coverIdStaticLabel.leadingAnchor constraintEqualToAnchor:self.imageView.trailingAnchor constant:mainMargin].active = YES;
    [_coverIdStaticLabel.widthAnchor constraintEqualToConstant:labelWidth].active = YES;
    
    [self.coverIdLabel.topAnchor constraintEqualToAnchor:self.viewsLabel.bottomAnchor constant:otherMargin].active = YES;
    [self.coverIdLabel.leadingAnchor constraintEqualToAnchor:_coverIdStaticLabel.trailingAnchor constant:mainMargin].active = YES;
    [self.coverIdLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-mainMargin].active = YES;
    
    [_descriptionStaticLabel.topAnchor constraintEqualToAnchor:self.imageView.bottomAnchor constant:mainMargin].active = YES;
    [_descriptionStaticLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:mainMargin].active = YES;
    [_descriptionStaticLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-mainMargin].active = YES;
    
    [self.descriptionLabel.topAnchor constraintEqualToAnchor:_descriptionStaticLabel.bottomAnchor constant:otherMargin].active = YES;
    [self.descriptionLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:mainMargin].active = YES;
    [self.descriptionLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-mainMargin].active = YES;
    
    [_commentsStaticLabel.topAnchor constraintEqualToAnchor:self.descriptionLabel.bottomAnchor constant:otherMargin].active = YES;
    [_commentsStaticLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:mainMargin].active = YES;
    [_commentsStaticLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-mainMargin].active = YES;
    
    [self.commentsView.topAnchor constraintEqualToAnchor:_commentsStaticLabel.bottomAnchor constant:mainMargin].active = YES;
    [self.commentsView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:mainMargin].active = YES;
    [self.commentsView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-mainMargin].active = YES;
    [self.commentsView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-mainMargin].active = YES;
    
    [_shadowView.topAnchor constraintEqualToAnchor:self.commentsView.topAnchor].active = YES;
    [_shadowView.leadingAnchor constraintEqualToAnchor:self.commentsView.leadingAnchor].active = YES;
    [_shadowView.trailingAnchor constraintEqualToAnchor:self.commentsView.trailingAnchor].active = YES;
    [_shadowView.bottomAnchor constraintEqualToAnchor:self.commentsView.bottomAnchor].active = YES;
    
    [_indicatorView.centerXAnchor constraintEqualToAnchor:_shadowView.centerXAnchor].active = YES;
    [_indicatorView.centerYAnchor constraintEqualToAnchor:_shadowView.centerYAnchor].active = YES;
}

#pragma mark - Private Methods

- (UILabel *)createLabelAndSetDefaultProperties {
    UILabel *label = [[UILabel alloc] init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.7f];
    label.font = [UIFont alHelveticaNeueRegularWithSize:15];
    [self addSubview:label];
    return label;
}

@end
