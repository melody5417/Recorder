//
//  YQPlayer.m
//  Recorder
//
//  Created by melody5417 on 23/03/2017.
//  Copyright © 2017 melody5417. All rights reserved.
//

#import "YQPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface YQPlayer ()
@property (nonatomic, strong) AVAudioPlayer *player;
@end

@implementation YQPlayer

#pragma mark - life cycle

- (instancetype)initWithURL:(NSURL *)url {
    if (self = [super init]) {
        NSError *error;
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        if (error) {
            NSLog(@"%s error:%@", __FUNCTION__, error.localizedDescription);
            return nil;
        }
        if (![self.player prepareToPlay]) {
            NSLog(@"%s prepare to play fail", __FUNCTION__);
            return nil;
        }
        self.player.numberOfLoops = -1;
        self.player.enableRate = YES;
    }
    return self;
}

- (void)dealloc {
    
}

#pragma mark - 

- (BOOL)isPlaying {
    return self.player.isPlaying;
}

#pragma mark - control methods

- (void)play {
    if (!self.isPlaying) {
        [self.player play];
    }
}

- (void)stop {
    if (self.isPlaying) {
        [self.player stop];
    }
}

- (void)adjustRate:(float)rate {
    [self.player setRate:rate];
}

// player speific methods
- (void)adjustPan:(float)pan forPlayerAtIndex:(NSUInteger)index {
    
}

- (void)adjustVolume:(float)volume forPlayerAtIndex:(NSUInteger)index {
    
}

@end
