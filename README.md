# HTSDCycleScrollView
一款基于SDScrollView的轮播图控件，对源码进行了修改，可切换为滚动时图片带有缩放效果的模式，可改变PageControl小圆点的样式。

更新：修改了卡片拖动的判断偏移量，更易拖动切换卡片。
## Show
### 普通模式：
![normal](https://github.com/runThor/HTSDCycleScrollView/raw/master/Other/normal.png)
### 缩放模式：
![zoom](https://github.com/runThor/HTSDCycleScrollView/raw/master/Other/zoom.png)
## Usage
```Objective-C
// 基本使用方式与SDScrollView一致，新增zoomType属性，用于切换普通模式与缩放模式
// ViewController.m

#import "SDCycleScrollView.h"

- (void)viewDidLoad {
    [super viewDidLoad];

    // 轮播图
    SDCycleScrollView *adCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 100, Screen_Width, 200) delegate:self placeholderImage:[UIImage new]];
    adCycleScrollView.zoomType = YES;  // 是否使用缩放效果，YES为缩放模式，NO为普通模式
    adCycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    adCycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    adCycleScrollView.currentPageDotColor = [UIColor whiteColor];
    adCycleScrollView.pageDotColor = [UIColor colorWithWhite:1 alpha:0.5];
    adCycleScrollView.pageControlDotSize = CGSizeMake(20, 6);  // pageControl小圆点的大小
    //    adCycleScrollView.imageURLStringsGroup = @[];  // 网络图片
    adCycleScrollView.localizationImageNamesGroup = @[@"img1", @"img2", @"img3", @"img4"];  // 本地图片
    [self.view addSubview:adCycleScrollView];

    // 轮播公告
    SDCycleScrollView *noticeView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 350, Screen_Width, 30) delegate:self placeholderImage:nil];
    noticeView.backgroundColor = [UIColor lightGrayColor];
    noticeView.onlyDisplayText = YES;
    noticeView.titlesGroup = @[@"公告1", @"公告2", @"公告3"];
    noticeView.scrollDirection = UICollectionViewScrollDirectionVertical;
    [self.view addSubview:noticeView];
}

```
