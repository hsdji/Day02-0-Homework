//
//  ViewController.m
//  Day02-0-Homework
//
//  Created by tarena on 15/8/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "quxian.h"
@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *scview;
@end

@implementation ViewController

-(UIScrollView *)scview
{
    if (!_scview)
    {
        _scview  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame)-100, CGRectGetWidth(self.view.frame)*4, 100)];
    }
    return _scview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i =0; i<4; i++)
    {
        [self.scview addSubview:[self seupUIAtindex:i]];
    }
    [self.view addSubview:self.scview];
    self.scview.delegate = self;
    self.scview.userInteractionEnabled = YES;
    self.scview.backgroundColor = [UIColor grayColor];
    self.scview.contentSize = CGSizeMake(CGRectGetWidth(self.scview.frame)*4, 100);
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidZoom");
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.scview.contentOffset.x>self.scview.frame.size.width*3/4)
    {
        self.scview.decelerationRate = 0.1;
        [self.scview setContentOffset:CGPointMake(self.scview.frame.size.width*3/4,  0) animated:YES];
        
    }
    
}



-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    NSLog(@"%f",scale);
}

-(BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    return YES;
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint offsetofScrollView = _scview.contentOffset;
   // 这里换成你的计算，想让它停到哪就让它停到哪
    offsetofScrollView.x = ceil(offsetofScrollView.x/self.view.frame.size.width)*self.view.frame.size.width;
    [_scview setContentOffset:offsetofScrollView];
}


-(quxian *)seupUIAtindex:(NSInteger)index{
    quxian *v = [quxian new];
    v.backgroundColor = [UIColor orangeColor];
    v.frame = CGRectMake(index*CGRectGetWidth(self.view.frame), 0, self.view.frame.size.width, 100);
    return v;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
