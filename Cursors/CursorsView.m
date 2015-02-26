//
//  CursorsView.m
//  Cursors
//
//  Created by Qikun Guo on 2/20/15.
//  Copyright (c) 2015 Tim Guo. All rights reserved.
//

#import "CursorsView.h"

@implementation CursorsView

- (void)drawRect:(NSRect)dirtyRect {
    
    NSImage *cursor = [NSImage imageNamed:@"mac-cursor"];
    //int cursorSize = [(NSNumber *)[[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.apple.universalaccess"][@"mouseDriverCursorSize"] intValue];
    int factor = 90;
    NSSize size;
    size.width = 1192/factor;
    size.height = 1788/factor;
    [cursor setSize:size];
    
    
    NSImageView *cursorView = [[NSImageView alloc] initWithFrame:dirtyRect];
    cursorView.image = cursor;
    [self addSubview:cursorView];
    [super drawRect:dirtyRect];
}

@end
