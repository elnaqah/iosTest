//
//  ITAudioViewController.m
//  InterviewTask
//
//  Created by AhmedElnaqah on 11/13/13.
//  Copyright (c) 2013 elnaqah. All rights reserved.
//

#import "ITAudioViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface ITAudioViewController ()
//@property (strong) AVAudioPlayer *audioPlayer;
@end

@implementation ITAudioViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIWebView * webView=[[UIWebView alloc] initWithFrame:self.view.bounds];
    
    NSString *myHTML = @"<audio controls><source src='http://radio.alafasy.tv:9614' type='audio/mpeg'></audio>";
    [webView loadHTMLString:myHTML baseURL:nil];
    webView.autoresizingMask=(UIViewAutoresizingFlexibleWidth| UIViewAutoresizingFlexibleHeight);
    [self.view addSubview:webView];
    
/*    MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:@"http://radio.alafasy.tv:9614"]];
    player.movieSourceType = MPMovieSourceTypeStreaming;
    player.view.hidden = YES;
    [self.view addSubview:player.view];
    [player play];*/
//    AudioPlayer* audioPlayer = [[AudioPlayer alloc] init];
//    audioPlayer.delegate = self;
//    
//    [audioPlayer setDataSource:[audioPlayer dataSourceFromURL: [NSURL URLWithString:@"http://radio.alafasy.tv:9614"]] withQueueItemId:@"item1"];
    
//    NSString* resourcePath = @"http://radio.alafasy.tv:9614"; //your url
//    NSData *_objectData = [NSData dataWithContentsOfURL:[NSURL URLWithString:resourcePath]];
//    NSError *error;
//    
//    self.audioPlayer = [[AVAudioPlayer alloc] initWithData:_objectData error:&error];
//    self.audioPlayer.numberOfLoops = 0;
//    self.audioPlayer.volume = 1.0f;
//    [self.audioPlayer prepareToPlay];
//    
//    if (self.audioPlayer == nil)
//        NSLog(@"%@", [error description]);
//    else
//        [self.audioPlayer play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




////////
//-(void) audioPlayer:(AudioPlayer*)audioPlayer stateChanged:(AudioPlayerState)state{
//    
//}
//-(void) audioPlayer:(AudioPlayer*)audioPlayer didEncounterError:(AudioPlayerErrorCode)errorCode{
//    NSLog(@"error");
//}
//-(void) audioPlayer:(AudioPlayer*)audioPlayer didStartPlayingQueueItemId:(NSObject*)queueItemId{
//    NSLog(@"playing");
//}
//-(void) audioPlayer:(AudioPlayer*)audioPlayer didFinishBufferingSourceWithQueueItemId:(NSObject*)queueItemId{
//    
//}
//-(void) audioPlayer:(AudioPlayer*)audioPlayer didFinishPlayingQueueItemId:(NSObject*)queueItemId withReason:(AudioPlayerStopReason)stopReason andProgress:(double)progress andDuration:(double)duration{
//    
//}

@end
