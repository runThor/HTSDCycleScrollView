//
//  ViewController.m
//  HTSDCycleScrollViewDemo
//
//  Created by iOS_zzy on 2018/3/27.
//  Copyright © 2018年 runThor. All rights reserved.
//

#import "ViewController.h"
#import "SDCycleScrollView.h"

@interface ViewController () <SDCycleScrollViewDelegate>

@property (strong, nonatomic) SDCycleScrollView *adCycleScrollView;
@property (strong, nonatomic) SDCycleScrollView *noticeCycleScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 轮播图
    SDCycleScrollView *adCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 100, Screen_Width, 200) delegate:self placeholderImage:[UIImage new]];
    adCycleScrollView.zoomType = YES;  // 是否使用缩放效果
    adCycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    adCycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    adCycleScrollView.currentPageDotColor = [UIColor whiteColor];
    adCycleScrollView.pageDotColor = [UIColor colorWithWhite:1 alpha:0.5];
    adCycleScrollView.pageControlDotSize = CGSizeMake(20, 6);  // pageControl小点的大小
//    adCycleScrollView.imageURLStringsGroup = @[];  // 网络图片
    adCycleScrollView.localizationImageNamesGroup = @[@"img1", @"img2", @"img3", @"img4"];  // 本地图片
    [self.view addSubview:adCycleScrollView];
    self.adCycleScrollView = adCycleScrollView;
    
    // 轮播公告
    SDCycleScrollView *noticeView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 350, Screen_Width, 30) delegate:self placeholderImage:nil];
    noticeView.backgroundColor = [UIColor lightGrayColor];
    noticeView.onlyDisplayText = YES;
    noticeView.titlesGroup = @[@"公告1", @"公告2", @"公告3"];
    noticeView.scrollDirection = UICollectionViewScrollDirectionVertical;
    [self.view addSubview:noticeView];
    self.noticeCycleScrollView = noticeView;
}

#pragma mark - SDCycleScrollViewDelegate

// 点击轮播内容
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    if (cycleScrollView == self.adCycleScrollView) {
        [cycleScrollView adjustWhenControllerViewWillAppera];
        NSLog(@"点击轮播图");
    } else {
        NSLog(@"点击轮播公告");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
