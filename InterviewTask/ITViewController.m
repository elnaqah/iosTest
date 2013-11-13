//
//  ITViewController.m
//  InterviewTask
//
//  Created by AhmedElnaqah on 11/13/13.
//  Copyright (c) 2013 elnaqah. All rights reserved.
//

#import "ITViewController.h"
#import "MCProgressBarView.h"
#import "ITStreamingViewController.h"

@interface ITViewController ()
@property (strong) CADisplayLink * theTimer;
@property (strong) MCProgressBarView * progressBarView;

@end

@implementation ITViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self performSelector:@selector(removeLabel) withObject:nil afterDelay:3];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark remove label method
-(void) removeLabel
{
    [self.helloLabel removeFromSuperview];
    UIImage * backgroundImage = [[UIImage imageNamed:@"progress-bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
    UIImage * foregroundImage = [[UIImage imageNamed:@"progress-fg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
    
    CGSize winSize=[[UIScreen mainScreen] bounds].size;
    self.progressBarView = [[MCProgressBarView alloc] initWithFrame:CGRectMake(25, winSize.height/2, 270, 20)
                                                                    backgroundImage:backgroundImage
                                                                    foregroundImage:foregroundImage];
    self.progressBarView.progress=0;
    self.progressBarView.offsetForZero = 10.0;
    [self.view addSubview:self.progressBarView];
    
    
    self.theTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(loop)];
    self.theTimer.frameInterval = 10;
  [self.theTimer addToRunLoop: [NSRunLoop currentRunLoop] forMode: NSDefaultRunLoopMode];
    
}

-(void) loop
{
    self.progressBarView.progress+=0.1;
    NSLog(@"%f",self.progressBarView.progress);
    if (self.progressBarView.progress>1.0) {
        [self.theTimer invalidate];
        [self.progressBarView removeFromSuperview];
        
        ITStreamingViewController * stream=[[ITStreamingViewController alloc] init];
        [self.navigationController pushViewController:stream animated:YES];
    }
}
@end
