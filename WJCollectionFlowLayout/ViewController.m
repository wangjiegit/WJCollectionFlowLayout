//
//  ViewController.m
//  WJCollectionFlowLayout
//
//  Created by 王杰 on 16/5/20.
//  Copyright © 2016年 WJ. All rights reserved.
//

#import "ViewController.h"
#import "WJLineFlowLayout.h"
#import "WJTwoRowLayout.h"
#import "WJCollectionViewCell.h"
#import "WJCircleLayout.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//        WJLineFlowLayout *layout = [[WJLineFlowLayout alloc] init];
//        layout.itemSize = CGSizeMake(self.view.frame.size.width / 1.5, self.view.frame.size.height);
//        layout.minimumLineSpacing = 0;
//        layout.minimumInteritemSpacing = 0;
//        UICollectionView *contentView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
//        contentView.delegate = self;
//        contentView.dataSource = self;
//        [contentView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
//        [self.view addSubview:contentView];
    
//    WJTwoRowLayout *layout = [[WJTwoRowLayout alloc] init];
//    layout.minimumLineSpacing = 10;
//    layout.minimumInteritemSpacing = 10;
//    UICollectionView *contentView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
//    contentView.delegate = self;
//    contentView.dataSource = self;
//    [contentView registerClass:[WJCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([WJCollectionViewCell class])];
//    [self.view addSubview:contentView];
    
    WJCircleLayout *layout = [[WJCircleLayout alloc] init];
    UICollectionView *contentView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    contentView.delegate = self;
    contentView.dataSource = self;
    [contentView registerClass:[WJCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([WJCollectionViewCell class])];
    [self.view addSubview:contentView];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([WJCollectionViewCell class]) forIndexPath:indexPath];
    return cell;
}

@end
