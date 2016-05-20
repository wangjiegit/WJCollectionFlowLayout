//
//  WJLineFlowLayout.m
//  WJCollectionFlowLayout
//
//  Created by 王杰 on 16/5/20.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "WJLineFlowLayout.h"

@implementation WJLineFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGFloat inset = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *array = [[NSArray alloc] initWithArray:[super layoutAttributesForElementsInRect:rect] copyItems:YES];//深层拷贝 不然有警告
    //屏幕x轴中心点在collectionView内容上的位置
    CGFloat centerX = self.collectionView.frame.size.width * 0.5 + self.collectionView.contentOffset.x;
    //两个item的center.x的距离
    CGFloat centerXDistance = self.itemSize.width + self.sectionInset.left;
    for (UICollectionViewLayoutAttributes *item in array) {
        //计算每个item距离centerX的距离,如果超过一个item.size.width + self.sectionInset.left,取item.size.width + self.sectionInset.left;
        CGFloat distance = MIN(ABS(item.center.x - centerX), centerXDistance);
        //缩放范围［0.5 － 1］;
        CGFloat scale = 1 - distance / centerXDistance / 2.0;
        item.transform = CGAffineTransformMakeScale(scale, scale);
    }
    return array;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    //proposedContentOffset 属性：collectionView滚动后停止的位置
    //velocity 熟悉：collectionView滚动时起时速度
    CGRect rect = CGRectMake(proposedContentOffset.x, proposedContentOffset.y, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    //屏幕x轴中心点在collectionView内容上的位置
    CGFloat centerX = self.collectionView.frame.size.width * 0.5 + proposedContentOffset.x;
    CGFloat minDistance = CGFLOAT_MAX;
    for (UICollectionViewLayoutAttributes *item in array) {
        if (ABS(minDistance) > ABS(item.center.x - centerX)) minDistance = item.center.x - centerX;
    }
    proposedContentOffset.x += minDistance;
    return proposedContentOffset;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
