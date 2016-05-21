//
//  WJCollectionViewCell.m
//  WJCollectionFlowLayout
//
//  Created by 王杰 on 16/5/21.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "WJCollectionViewCell.h"

@implementation WJCollectionViewCell
{
    UIImageView *imgView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor yellowColor];
        
        imgView = [[UIImageView alloc] init];
        imgView.clipsToBounds = YES;
        imgView.image = [UIImage imageNamed:@"1.jpg"];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:imgView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    imgView.frame = self.bounds;
}

@end
