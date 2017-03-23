//
//  YQRecorder.h
//  Recorder
//
//  Created by yiqiwang(王一棋) on 2017/3/22.
//  Copyright © 2017年 melody5417. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^recordStopCompletionBlock) (BOOL, NSURL *);

@interface YQRecorder : NSObject

// control methods
- (BOOL)startRecord;
- (void)pause;
- (void)stopWithCompletionBlock:(recordStopCompletionBlock)block;


@end
