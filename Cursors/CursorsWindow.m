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
//    NSRect screenVisibleFrame = [[NSScreen mainScreen] visibleFrame];
//    NSRect windowFrame = self.frame;
//    NSPoint newOrigin = windowFrame.origin;
//    
//    // Get the mouse location in window coordinates.
//    NSPoint currentLocation = theEvent.locationInWindow;
//    // Update the origin with the difference between the new mouse location and the old mouse location.
//    newOrigin.x += (currentLocation.x - prevLoc.x);
//    newOrigin.y += (currentLocation.y - prevLoc.y);
//    
//    // Don't let window get dragged up under the menu bar
//    if ((newOrigin.y + windowFrame.size.height) > (screenVisibleFrame.origin.y + screenVisibleFrame.size.height)) {
//        newOrigin.y = screenVisibleFrame.origin.y + (screenVisibleFrame.size.height - windowFrame.size.height);
//    }
//    
//    // Move the window to the new location
//    [self setFrameOrigin:newOrigin];
    
}
///*
// Start tracking a potential drag operation here when the user first clicks the mouse, to establish
// the initial location.
// */
//- (void)mouseDown:(NSEvent *)theEvent {
//    
//    // Get the mouse location in window coordinates.
//    self.initialLocation = [theEvent locationInWindow];
//}
//
///*
// Once the user starts dragging the mouse, move the window with it. The window has no title bar for
// the user to drag (so we have to implement dragging ourselves)
// */
//- (void)mouseDragged:(NSEvent *)theEvent {
//    
//    NSRect screenVisibleFrame = [[NSScreen mainScreen] visibleFrame];
//    NSRect windowFrame = [self frame];
//    NSPoint newOrigin = windowFrame.origin;
//    
//    // Get the mouse location in window coordinates.
//    NSPoint currentLocation = [theEvent locationInWindow];
//    // Update the origin with the difference between the new mouse location and the old mouse location.
//    newOrigin.x += (currentLocation.x - initialLocation.x);
//    newOrigin.y += (currentLocation.y - initialLocation.y);
//    
//    // Don't let window get dragged up under the menu bar
//    if ((newOrigin.y + windowFrame.size.height) > (screenVisibleFrame.origin.y + screenVisibleFrame.size.height)) {
//        newOrigin.y = screenVisibleFrame.origin.y + (screenVisibleFrame.size.height - windowFrame.size.height);
//    }
//    
//    // Move the window to the new location
//    [self setFrameOrigin:newOrigin];
//}


@end
