//
//  ViewController.m
//  IOSgit
//
//  Created by jack_tang on 16/11/15.
//  Copyright © 2016年 jack_tang. All rights reserved.
//

#import "ViewController.h"

#import "SoliteViewController.h"
#import "TopLineViewController.h"
#import "HotViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *conView;
@property (weak, nonatomic) IBOutlet UIView *contenView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAllVc];
    [self setupTitleButton];
 
}


- (IBAction)showView:(UIButton *)sender {
    [self.contenView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
   UIViewController *vc = self.childViewControllers[sender.tag];
    vc.view.backgroundColor = [sender backgroundColor];
    vc.view.frame = self.contenView.bounds;
    [self.contenView addSubview:vc.view];
}




-(void)setupTitleButton
{
    for(int i = 0; i<self.conView.subviews.count;i++){
        UIButton *buton = self.conView.subviews[i];
        UIViewController *vc = self.childViewControllers[i];
        [buton setTitle:vc.title forState:UIControlStateNormal];
    }
}

-(void)setUpAllVc
{
    SoliteViewController *sovc =  [[SoliteViewController alloc]init];
    sovc.title =@"社会";
    [self addChildViewController:sovc];

    TopLineViewController *topvc =  [[TopLineViewController alloc]init];
    topvc.title =@"头条";
    [self addChildViewController:topvc];
    
    HotViewController *hotvc =  [[HotViewController alloc]init];
    hotvc.title=@"热点";
    [self addChildViewController:hotvc];

}
@end
