//
//  MobileSafariInspectorViewController.m
//  MobileSafariInspector
//
//  Created by Michael Walker on 12/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MobileSafariInspectorViewController.h"

@implementation MobileSafariInspectorViewController

@synthesize webView, addressField, addressBar, titleBar, footerBar, back, forward, toggleAddress;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewWillDisappear:(BOOL)animated 
{
    if ([self.webView isLoading]) {
        [self.webView stopLoading];
    }
    
    self.webView.delegate = nil;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.webView = nil;
    self.addressField = nil;
    self.addressBar = nil;
    self.titleBar = nil;
    self.back = nil;
    self.forward = nil;
    self.toggleAddress = nil;
}

- (void)dealloc {
    [webView release];
    [addressField release];
    [addressBar release];
    [titleBar release];
    [back release];
    [forward release];
    [toggleAddress release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    int deviceHeight = CGRectGetHeight(self.view.bounds);
    int deviceWidth = CGRectGetWidth(self.view.bounds);
    
    int titleBarHeight = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? 34 : 16);
    [titleBar setFrame: CGRectMake(0, 0, deviceWidth, titleBarHeight)];
    [addressBar setFrame: CGRectMake(0, titleBarHeight, deviceWidth, 44)];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        int footerHeight = (UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? 44 : 32);        
        [footerBar setFrame: CGRectMake(0, deviceHeight - footerHeight, deviceWidth, footerHeight)]; 
    }
    
    [self resizeWebView];
 
}



#pragma mark - UIWebViewDelegate Methods
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    // starting the load, show the activity indicator in the status bar
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [titleBar setText: @"Loading..."];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [addressField setText: self.webView.request.URL.absoluteString];
    [titleBar setText: [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"]];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [back setEnabled: [self.webView canGoBack]];
    [forward setEnabled: [self.webView canGoForward]];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if([error code] == NSURLErrorCancelled) return; // Ignore this error
    
    // load error, hide the activity indicator in the status bar
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    // report the error inside the webview
    NSString* errorString = [NSString stringWithFormat:
                             @"<html><center>An error occurred:<br>%@</font></center></html>",
                             error.localizedDescription];
    [self.webView loadHTMLString:errorString baseURL:nil];
}

#pragma mark - UITextFieldDelegate Methods
- (bool)textFieldShouldReturn:(UITextField *)address 
{   
    if ([webView isLoading]) {
        [webView stopLoading];
    }
 
    NSURL *url = [NSURL URLWithString: addressField.text];
    if (![[url scheme] length])
    {
        url = [NSURL URLWithString:[@"http://" stringByAppendingString: addressField.text]];
    }
    
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    [addressField resignFirstResponder];
    return YES;
}

#pragma mark - Browser Functionality
- (IBAction) refresh
{
    [webView reload]; 
}

- (IBAction) goBack 
{
    [webView goBack];
    
}

- (IBAction) goForward
{
    [webView goForward];
    
}

- (IBAction) toggleAddressBar 
{
    bool isHidden = [addressBar isHidden];
    [addressBar setHidden: !isHidden];
    [titleBar setHidden: !isHidden];
        
    if (isHidden) {
        [toggleAddress setTitle: @"Hide Address Bar"];
    } else {
        [toggleAddress setTitle: @"Show Address Bar"];
    }

    [self resizeWebView];
}

- (IBAction) goFullScreen
{
    [addressBar setHidden: YES];
    [titleBar setHidden: YES];
    [footerBar setHidden: YES];
    
    [self resizeWebView];
}

- (void) resizeWebView
{
    int headerHeight    = CGRectGetHeight(addressBar.frame) + CGRectGetHeight(titleBar.frame),
        footerHeight    = CGRectGetHeight(footerBar.frame),
        deviceHeight    = CGRectGetHeight(self.view.bounds),
        deviceWidth     = CGRectGetWidth(self.view.bounds);
    
    int newHeight = deviceHeight,
        yOrigin = 0;
    
    if(![footerBar isHidden]) {
        newHeight -= footerHeight;
    }
    
    if(![addressBar isHidden]) {
        newHeight -= headerHeight;
        yOrigin = headerHeight;
    }
    
    [webView setFrame: CGRectMake(0,yOrigin,deviceWidth, newHeight)];
}


@end
