//
//  ALMainDetailTableCell.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 19.04.18.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainDetailTableCell.h"

#import "ALMainDetailTableItem.h"

#import "UIFont+ALFonts.h"

@interface ALMainDetailTableCell () {
    UILabel *_author;
    UILabel *_comment;
    UILabel *_points;
}

@end

@implementation ALMainDetailTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _author = [[UILabel alloc] init];
        _author.translatesAutoresizingMaskIntoConstraints = NO;
        _author.font = [UIFont alHelveticaNeueLightWithSize:13];
        _author.textAlignment = NSTextAlignmentLeft;
        _author.textColor = [UIColor grayColor];
        [self.contentView addSubview:_author];
        
        _comment = [[UILabel alloc] init];
        _comment.translatesAutoresizingMaskIntoConstraints = NO;
        _comment.font = [UIFont alHelveticaNeueLightWithSize:14];
        _comment.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_comment];
        
        _points = [[UILabel alloc] init];
        _points.translatesAutoresizingMaskIntoConstraints = NO;
        _points.font = [UIFont alHelveticaNeueLightWithSize:13];
        _points.textAlignment = NSTextAlignmentRight;
        _points.textColor = [UIColor grayColor];
        [self.contentView addSubview:_points];
        
        [self makeConstraints];
    }
    return self;
}

- (void)configureWithItem:(ALMainDetailTableItem *)item {
    _author.text = item.author;
    _comment.text = item.comment;
    _points.text = [NSString stringWithFormat:@"%ld %@", (long)item.points, ALLocalize(@"maindetail.points")];
}

#pragma mark - Private methods

- (void)makeConstraints {
    CGFloat mainMargin = 5.f;
    
    [_author.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [_author.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:mainMargin].active = YES;
    [_author.trailingAnchor constraintEqualToAnchor:_points.leadingAnchor constant:mainMargin].active = YES;
    
    [_comment.topAnchor constraintEqualToAnchor:_author.bottomAnchor constant:mainMargin].active = YES;
    [_comment.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:mainMargin].active = YES;
    [_comment.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-mainMargin].active = YES;
    
    [_points.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [_points.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-mainMargin].active = YES;
    [_points.widthAnchor constraintEqualToConstant:70.f].active = YES;
}

@end
