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
    
    // clear
    NSMutableArray *subviews = [NSMutableArray arrayWithArray:self.subviews];
    for (NSView *subView in subviews)
        [subView removeFromSuperview];
    
    NSImage *cursorImage = [NSImage imageNamed:@"mac-cursor"];
    //int cursorSize = [(NSNumber *)[[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.apple.universalaccess"][@"mouseDriverCursorSize"] intValue];
    int factor = 90;
    NSSize size;
    size.width = 1192/factor;
    size.height = 1788/factor;
    [cursorImage setSize:size];
    
    // TODO: better startpoints
    for (int i = cursor.x; i < dirtyRect.size.width; i += size.width + 100) {
        for (int j = cursor.y; j < dirtyRect.size.height; j += size.height + 100) {
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
