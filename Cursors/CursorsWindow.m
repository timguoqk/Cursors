//
//  CursorsWindow.m
//  Cursors
//
//  Created by Qikun Guo on 2/20/15.
//  Copyright (c) 2015 Tim Guo. All rights reserved.
//

#import "CursorsWindow.h"
#import "CursorsView.h"

@implementation CursorsWindow


/*
 In Interface Builder, the class for the window is set to this subclass. Overriding the initializer
 provides a mechanism for controlling how objects of this class are created.
 */
- (id)initWithContentRect:(NSRect)contentRect
                styleMask:(NSUInteger)aStyle
                  backing:(NSBackingStoreType)bufferingType
                    defer:(BOOL)flag {
    // Using NSBorderlessWindowMask results in a window without a title bar.
    if ([super initWithContentRect:[NSScreen mainScreen].frame styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer:NO]) {
        // Start with no transparency for all drawing into the window
        [self setAlphaValue:1.0];
        // Turn off opacity so that the parts of the window that are not drawn into are transparent.
        [self setOpaque:NO];
        [self setBackgroundColor:[NSColor clearColor]];
        [self setAcceptsMouseMovedEvents:YES];
        
        [self makeKeyAndOrderFront:nil];
        [self setLevel:NSStatusWindowLevel];
    }
    return self;
}

/*
 Custom windows that use the NSBorderlessWindowMask can't become key by default. Override this method
 so that controls in this window will be enabled.
 */
- (BOOL)canBecomeKeyWindow {
    return YES;
}

- (void)mouseMoved:(NSEvent *)theEvent {
    NSPoint currentLocation = theEvent.locationInWindow;
    CursorsView *cv = self.contentView;
    cv.cursor = currentLocation;
    [cv setNeedsDisplay:YES];
}


@end
