//
//  ITStreamingViewController.m
//  InterviewTask
//
//  Created by AhmedElnaqah on 11/13/13.
//  Copyright (c) 2013 elnaqah. All rights reserved.
//

#import "ITStreamingViewController.h"
#import "ITAudioViewController.h"
#import "ITVideoViewController.h"
#import "ITVideolistViewController.h"

@interface ITStreamingViewController ()

@end

@implementation ITStreamingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)video:(id)sender {
    ITVideolistViewController * v=[[ITVideolistViewController alloc] init];
    [self.navigationController pushViewController:v animated:YES];
}
- (IBAction)audio:(id)sender {
    ITAudioViewController * a=[[ITAudioViewController alloc] init];
    [self.navigationController pushViewController:a animated:YES];
}

@end
