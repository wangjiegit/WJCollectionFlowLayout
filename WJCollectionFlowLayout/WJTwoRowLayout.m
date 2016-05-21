//
//  WJTwoRowLayout.m
//  WJCollectionFlowLayout
//
//  Created by 王杰 on 16/5/20.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "WJTwoRowLayout.h"

@interface WJTwoRowLayout ()

@property (nonatomic, copy) NSMutableArray *arrar;

@end

@implementation WJTwoRowLayout

- (void)prepareLayout {
    [super prepareLayout];
    [self.arrar removeAllObjects];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i++) {
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        CGFloat width = 0.5 * (self.collectionView.frame.size.width - self.sectionInsets.left - self.sectionInsets.right - self.minimumInteritemSpacing);
        
        if (i == 0) {
            attributes.frame = CGRectMake(self.sectionInsets.left, self.sectionInsets.top, width, width);
        } else if (i == 1) {
            attributes.frame = CGRectMake(self.collectionView.frame.size.width - self.sectionInsets.right - width, self.sectionInsets.top, width, (width - self.minimumLineSpacing) * 0.5);
        } else if (i == 2) {
            attributes.frame = CGRectMake(self.collectionView.frame.size.width - self.sectionInsets.right - width, self.sectionInsets.top + (width + self.minimumLineSpacing) * 0.5, width, (width - self.minimumLineSpacing) * 0.5);
        } else if (i == 3) {
            attributes.frame = CGRectMake(self.sectionInsets.left, self.sectionInsets.top + width + self.minimumLineSpacing, width, (width - self.minimumLineSpacing) * 0.5);
        } else if (i == 4) {
            attributes.frame = CGRectMake(self.sectionInsets.left, self.sectionInsets.top + width + self.minimumLineSpacing * 2 + (width - self.minimumLineSpacing) * 0.5, width, (width - self.minimumLineSpacing) * 0.5);
        } else if (i == 5) {
            attributes.frame = CGRectMake(self.collectionView.frame.size.width - self.sectionInsets.right - width, self.sectionInsets.top + width + self.minimumLineSpacing, width, width);
        } else {
            UICollectionViewLayoutAttributes *temp = self.arrar[i - 6];
            CGRect rect = temp.frame;
            rect.origin.y += 2 * width + 2 * self.minimumLineSpacing;
            attributes.frame = rect;
        }
        [self.arrar addObject:attributes];
    }
}

- (CGSize)collectionViewContentSize
{
    CGFloat rowH = (self.collectionView.frame.size.width - self.minimumInteritemSpacing) * 0.5 + self.minimumLineSpacing;
    int count = (int)[self.collectionView numberOfItemsInSection:0];
    int rows = count / 3;
    int leave = count % 3;
    if (leave > 0) {
        rows += 1;
    }
    
    return CGSizeMake(self.collectionView.frame.size.width, rows * rowH - self.minimumLineSpacing);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *arr = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes *att in self.arrar) {
        if (CGRectIntersectsRect(att.frame, rect)) {
            [arr addObject:att];
        }
    }
    return arr;
}

- (NSMutableArray *)arrar {
    if (!_arrar) {
        _arrar = [NSMutableArray array];
    }
    return _arrar;
}

@end
