//
//  CursorsView.m
//  Cursors
//
//  Created by Qikun Guo on 2/20/15.
//  Copyright (c) 2015 Tim Guo. All rights reserved.
//

#import "CursorsView.h"

@implementation CursorsView

@synthesize cursor;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [NSCursor hide];
    
    // clear
    [self setSubviews:@[]];
    
    NSImage *cursorImage = [NSImage imageNamed:@"mac-cursor"];
    NSSize size = NSMakeSize(13.24, 19.87);  // 90 times smaller
    [cursorImage setSize:size];
    
    for (int i = (int)(cursor.x) % (int)(size.width + 150); i < dirtyRect.size.width; i += size.width + 150) {
        for (int j = (int)(cursor.y) % (int)(size.height + 150); j < dirtyRect.size.height; j += size.height + 150) {
            NSRect rect;
            rect.size = size;
            rect.origin = CGPointMake(i, j);
            NSImageView *cursorView = [[NSImageView alloc] initWithFrame:rect];
            cursorView.image = cursorImage;
            [self addSubview:cursorView];
        }
    }
}

@end
