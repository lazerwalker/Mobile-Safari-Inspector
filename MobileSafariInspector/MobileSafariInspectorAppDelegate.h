//
//  MobileSafariInspectorAppDelegate.h
//  MobileSafariInspector
//
//  Created by Michael Walker on 12/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MobileSafariInspectorViewController;

@interface MobileSafariInspectorAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MobileSafariInspectorViewController *viewController;

@end
