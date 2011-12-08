//
//  MobileSafariInspectorViewController.h
//  MobileSafariInspector
//
//  Created by Michael Walker on 12/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MobileSafariInspectorViewController : UIViewController <UIWebViewDelegate> {
    IBOutlet UIWebView *webView;
    IBOutlet UIToolbar *addressBar;
    IBOutlet UIToolbar *footerBar;
    IBOutlet UITextField *addressField;
    IBOutlet UILabel *titleBar;
    IBOutlet UIBarButtonItem *back;
    IBOutlet UIBarButtonItem *forward;
    IBOutlet UIBarButtonItem *toggleAddress;
}

- (IBAction) goBack;
- (IBAction) goForward;
- (IBAction) refresh;
- (IBAction) toggleAddressBar;
- (IBAction) goFullScreen;
- (void) resizeWebView;

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UIToolbar *addressBar;
@property (nonatomic, retain) IBOutlet UIToolbar *footerBar;
@property (nonatomic, retain) IBOutlet UITextField *addressField;
@property (nonatomic, retain) IBOutlet UILabel *titleBar;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *back;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *forward;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *toggleAddress;
@end
