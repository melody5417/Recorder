//
//  YQWindowController.m
//  Recorder
//
//  Created by yiqiwang(王一棋) on 2017/3/22.
//  Copyright © 2017年 melody5417. All rights reserved.
//

#import "YQWindowController.h"
#import "YQRecorder.h"
#import "YQPlayer.h"

@interface YQWindowController ()
@property (nonatomic, strong) YQRecorder *recorder;
@property (nonatomic, strong) YQPlayer *player;
@property (nonatomic, strong) NSURL *fileURL;
@end

@implementation YQWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)startAction:(id)sender {
    NSLog(@"%s", __FUNCTION__);
    self.recorder = [[YQRecorder alloc] init];
    [self.recorder startRecord];
}

- (IBAction)stopAction:(id)sender {
    NSLog(@"%s", __FUNCTION__);
    void(^stopBlock)(BOOL, NSURL *) = ^(BOOL success, NSURL *fileURL) {
        if (success) {
            self.fileURL = fileURL;
        }
    };
    [self.recorder stopWithCompletionBlock:stopBlock];
}

- (IBAction)playAction:(id)sender {
    NSLog(@"%s", __FUNCTION__);
    if (self.fileURL
        && [[NSFileManager defaultManager] fileExistsAtPath:self.fileURL.absoluteString]) {
        
        self.player = [[YQPlayer alloc] initWithURL:self.fileURL];
        [self.player play];
    }
}


@end
