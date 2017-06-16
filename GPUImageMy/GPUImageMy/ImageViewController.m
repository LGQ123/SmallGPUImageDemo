//
//  ImageViewController.m
//  GPUImageMy
//
//  Created by ydz on 2017/6/5.
//  Copyright © 2017年 lgq. All rights reserved.
//

#import "ImageViewController.h"
#import <GPUImage.h>
@interface ImageViewController ()

@property (nonatomic, strong) UIImageView *myImageView;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _myImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zzz.jpg"]];
    _myImageView.frame = self.view.frame;
    _myImageView.userInteractionEnabled = YES;
    _myImageView.contentMode = UIViewContentModeScaleAspectFit;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [_myImageView addGestureRecognizer:tap];
    UILongPressGestureRecognizer *longTap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longTap:)];
    [_myImageView addGestureRecognizer:longTap];
    UIPinchGestureRecognizer *pinch =[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchAction:)];
    //添加到指定视图
    [_myImageView addGestureRecognizer:pinch];
    
    
    [self.view addSubview:_myImageView];
    
    
}



- (void)tap:(UITapGestureRecognizer *)tap {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)longTap:(UILongPressGestureRecognizer *)tap {
    UIImage * inputImage = [UIImage imageNamed:@"zzz.jpg"];
    //使用黑白素描滤镜
    GPUImageSketchFilter *disFilter = [[GPUImageSketchFilter alloc] init];
    //设置要渲染的区域
    [disFilter forceProcessingAtSize:inputImage.size];
    [disFilter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:inputImage];
    //添加上滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    UIImage *newImage = [disFilter imageFromCurrentFramebuffer];
    
    _myImageView.image = newImage;
    
}

#pragma 捏合手势
//添加捏合事件
-(void)pinchAction:(UIPinchGestureRecognizer *)pinch
{
    
    //通过 transform(改变) 进行视图的视图的捏合
    _myImageView.transform =CGAffineTransformScale(_myImageView.transform, pinch.scale, pinch.scale);
    //设置比例 为 1
    pinch.scale = 1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
