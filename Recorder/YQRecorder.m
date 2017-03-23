//
//  YQRecorder.m
//  Recorder
//
//  Created by yiqiwang(王一棋) on 2017/3/22.
//  Copyright © 2017年 melody5417. All rights reserved.
//

#import "YQRecorder.h"
#import <AVFoundation/AVFoundation.h>

@interface YQRecorder ()<AVAudioRecorderDelegate>
@property (nonatomic, strong) AVAudioRecorder *audioRecorder;
@property (nonatomic, copy) recordStopCompletionBlock stopBlock;
@property (nonatomic, strong) NSURL *fileURL;
@end

@implementation YQRecorder

- (instancetype)init {
    if (self = [super init]) {
        // 配置Recorder
        NSDictionary *recordSetting = @{AVFormatIDKey : @(kAudioFormatAppleIMA4),
                                        AVSampleRateKey : @44100.0f,
                                        AVNumberOfChannelsKey : @1,
                                        AVEncoderBitDepthHintKey : @16,
                                        AVEncoderAudioQualityKey : @(AVAudioQualityMedium)};
        
        // 录音文件保存地址的URL
        NSString *tempPath = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES).firstObject;//NSTemporaryDirectory();
        self.fileURL = [NSURL URLWithString:[tempPath stringByAppendingPathComponent:@"record.caf"]];
        
        // 初始化
        NSError *error = nil;
        self.audioRecorder = [[AVAudioRecorder alloc] initWithURL:self.fileURL
                                                         settings:recordSetting
                                                            error:&error];
        
        if (error != nil) {
            NSLog(@"Init audioRecorder error: %@",error.localizedDescription);
            return nil;
        }
        
        if (![self.audioRecorder prepareToRecord]) {
            NSLog(@"prepare to record fail");
            return nil;
        }
        
        [self.audioRecorder setDelegate:self];
    }
    return self;
}

- (void)dealloc {
    [self.audioRecorder stop];
    self.stopBlock = nil;
}

#pragma mark - control methods

- (BOOL)startRecord {
    return [self.audioRecorder record];
}

- (void)pause {
    [self.audioRecorder pause];
}

- (void)stopWithCompletionBlock:(recordStopCompletionBlock)block {
    self.stopBlock = block;
    [self.audioRecorder stop];
}

#pragma mark - AVAudioRecorderDelegate

- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag {
    if (self.stopBlock) {
        self.stopBlock(flag, self.fileURL);
    }
}

- (void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError * __nullable)error {
    if (self.stopBlock) {
        self.stopBlock(NO, nil);
    }
}

@end
