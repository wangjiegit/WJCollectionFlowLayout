//
//  WJCircleLayout.m
//  WJCollectionFlowLayout
//
//  Created by 王杰 on 16/5/21.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "WJCircleLayout.h"

@interface WJCircleLayout ()

@property (nonatomic, copy) NSMutableArray *array;

@end

@implementation WJCircleLayout

- (void)prepareLayout {
    [super prepareLayout];
    [self.array removeAllObjects];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i++) {
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        CGFloat radius = 70;
        // 圆心的位置
        CGFloat oX = self.collectionView.frame.size.width * 0.5;
        CGFloat oY = self.collectionView.frame.size.height * 0.5;
        attributes.size = CGSizeMake(50, 50);
        if (count == 1) {
            attributes.center = CGPointMake(oX, oY);
        } else {
            CGFloat angle = (2 * M_PI / count) * i;
            CGFloat centerX = oX + radius * sin(angle);
            CGFloat centerY = oY + radius * cos(angle);
            attributes.center = CGPointMake(centerX, centerY);
        }
        [self.array addObject:attributes];
    }
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.array;
}

- (NSMutableArray *)array {
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}

@end
