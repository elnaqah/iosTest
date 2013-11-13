//
//  ITVideoViewController.m
//  InterviewTask
//
//  Created by AhmedElnaqah on 11/13/13.
//  Copyright (c) 2013 elnaqah. All rights reserved.
//

#import "ITVideoViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "ITListItem.h"
@interface ITVideoViewController ()
@property (strong, nonatomic) MPMoviePlayerController *streamPlayer;
@property (strong) ITListItem * item;
@end

@implementation ITVideoViewController


- (id)initWithItem:(ITListItem * ) aitem
{
    self = [super init];
    if (self) {
        self.item=aitem;
    }
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

@synthesize streamPlayer = _streamPlayer;


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    dispatch_async(BgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL:self.item.url];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });

    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.streamPlayer stop];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark data handling
-(void) mainThreadWithURL:(NSURL *) url
{
    NSURL *streamURL = url;
    
    _streamPlayer = [[MPMoviePlayerController alloc] initWithContentURL:streamURL];
    
    [self.streamPlayer.view setFrame: self.view.bounds ];
    self.streamPlayer.view.autoresizingMask=( UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth);
    
    self.streamPlayer.controlStyle = MPMovieControlStyleEmbedded;
    
    [self.view addSubview: self.streamPlayer.view];
    
    [self.streamPlayer play];
}
- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    NSURL * video_url=[NSURL URLWithString:[json objectForKey:@"url"]];
    [self performSelectorOnMainThread:@selector(mainThreadWithURL:) withObject:video_url waitUntilDone:YES];
    
}

@end
