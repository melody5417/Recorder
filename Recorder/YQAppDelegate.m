//
//  YQAppDelegate.m
//  Recorder
//
//  Created by yiqiwang(王一棋) on 2017/3/22.
//  Copyright © 2017年 melody5417. All rights reserved.
//

#import "YQAppDelegate.h"
#import "YQWindowController.h"

@interface YQAppDelegate ()
@property (nonatomic, strong) YQWindowController *windowController;

@end

@implementation YQAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.windowController = [[YQWindowController alloc] initWithWindowNibName:@"YQWindowController"];
    [self.windowController showWindow:nil];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
