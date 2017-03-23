//
//  YQPlayer.h
//  Recorder
//
//  Created by melody5417 on 23/03/2017.
//  Copyright © 2017 melody5417. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YQPlayer : NSObject

@property (nonatomic, assign, readonly, getter=isPlaying) BOOL playing;

- (instancetype)initWithURL:(NSURL *)url;

// control methods
- (void)play;
- (void)stop;
- (void)adjustRate:(float)rate;

// player speific methods
- (void)adjustPan:(float)pan forPlayerAtIndex:(NSUInteger)index;
- (void)adjustVolume:(float)volume forPlayerAtIndex:(NSUInteger)index;

@end
