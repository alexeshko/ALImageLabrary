//
//  ALMainTableCell.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainTableCell.h"

#import "ALMainTableItemImage.h"

@interface ALMainTableCell () {
    UIImageView *_imageView;
    UILabel *_author;
}

@end

@implementation ALMainTableCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width / 2 - 37.5, 0.f, 75.f, 75.f)];
        _imageView.tintColor = [UIColor colorWithRed:153.f/255.f green:212.f/255.f blue:255.f/255.f alpha:1];
        
        _author = [[UILabel alloc] initWithFrame:CGRectMake(5.f, self.frame.size.height - 18.f, self.bounds.size.width - 10.f, 15.f)];
        _author.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14.f];
        _author.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:_imageView];
        [self.contentView addSubview:_author];
        
        [self makeConstraints];
    }
    return self;
}

- (void)configureWithItem:(ALMainTableItem *)item {
    if (item.images.count) {
        ALMainTableItemImage *itemImage = [item.images firstObject];
        
        NSString *path = [itemImage.itemPath stringByDeletingPathExtension];
        NSString *extension = [itemImage.itemPath pathExtension];
        
        NSString *stringURL = [NSString stringWithFormat:@"%@b.%@", path, extension];
        
        dispatch_queue_t callerQueue = dispatch_get_main_queue();
        dispatch_queue_t downloadQueue = dispatch_queue_create("com.imglib.myimagequeue", NULL);
        dispatch_async(downloadQueue, ^{
            NSData * imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:stringURL]];
            dispatch_async(callerQueue, ^{
                _imageView.image = [UIImage imageWithData:imageData];
            });
        });
    }
    _author.text = item.itemAuthor;
}

#pragma mark - Private methods

- (void)makeConstraints {
    [self.widthAnchor constraintEqualToConstant:50.f].active = YES;
    [self.heightAnchor constraintEqualToConstant:50.f].active = YES;
}

@end
