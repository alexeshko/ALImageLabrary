//
//  ALLoginView.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 05/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALLoginView.h"

#import "UIColor+ALColors.h"
#import "UIFont+ALFonts.h"

@interface ALLoginView () {
    UILabel *_welcomeLabel;
}

@end

@implementation ALLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _welcomeLabel = [[UILabel alloc] init];
        _welcomeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _welcomeLabel.textColor = [UIColor alMainColorElement];
        _welcomeLabel.font = [UIFont alHelveticaNeueLightWithSize:18];
        _welcomeLabel.textAlignment = NSTextAlignmentCenter;
        _welcomeLabel.text = ALLocalize(@"login.welcome");
        [self addSubview:_welcomeLabel];
        
        _joinButton = [[UIButton alloc] init];
        self.joinButton.translatesAutoresizingMaskIntoConstraints = NO;
        self.joinButton.backgroundColor = [UIColor alMainColorElement];
        [self.joinButton setTitle:ALLocalize(@"login.join") forState:UIControlStateNormal];
        self.joinButton.layer.cornerRadius = 4.f;
        [self addSubview:self.joinButton];
        
        _ipLabel = [[UILabel alloc] init];
        self.ipLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.ipLabel.numberOfLines = 2;
        self.ipLabel.textColor = [UIColor alMainColorElement];
        self.ipLabel.font = [UIFont alHelveticaNeueThinWithSize:14];
        self.ipLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.ipLabel];

        [self makeConstraints];
    }
    
    return self;
}

- (void)makeConstraints {
    [super makeConstraints];
    
    [_welcomeLabel.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [_welcomeLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [_welcomeLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    
    [self.joinButton.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:30.f].active = YES;
    [self.joinButton.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-30.f].active = YES;
    [self.joinButton.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
    [self.joinButton.heightAnchor constraintEqualToConstant:35.f].active = YES;
    
    [self.ipLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-50.f].active = YES;
    [self.ipLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [self.ipLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
}

@end
