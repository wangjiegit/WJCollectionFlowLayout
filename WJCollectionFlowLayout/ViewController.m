//
//  ViewController.m
//  WJCollectionFlowLayout
//
//  Created by 王杰 on 16/5/20.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "ViewController.h"
#import "WJLineFlowLayout.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WJLineFlowLayout *layout = [[WJLineFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(self.view.frame.size.width / 1.5, self.view.frame.size.height);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    UICollectionView *contentView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    contentView.delegate = self;
    contentView.dataSource = self;
    [contentView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    [self.view addSubview:contentView];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    UIImageView *imgView = [cell.contentView viewWithTag:11];
    if (!imgView) {
        imgView = [[UIImageView alloc] init];
        imgView.clipsToBounds = YES;
        imgView.image = [UIImage imageNamed:@"1.jpg"];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.frame = cell.contentView.bounds;
        imgView.tag = 11;
        [cell.contentView addSubview:imgView];
    }
    return cell;
}

@end
