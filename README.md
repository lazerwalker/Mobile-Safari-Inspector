# Important Update #
***Apple has added full support for the Safari Web Inspector in iOS 6, including physical devices instead of just the Simulator. 
I'm leaving this repository up for posterity's sake, but you really should just use the official implementation.***

## What does Mobile Safari Inspector do? ##

Webkit Inspector is an invaluable tool to help debug Javascript, tweak CSS, and inspect the DOM when developing web apps. There's no way to access the Inspector within iOS, though, which can make debugging mobile web apps a frustrating experience. While it's possible to set up a remote inspector via Weinre (http://phonegap.github.com/weinre/), its functionality is limited. Another common solution is to use the desktop version of Safari to debug issues, but often problems arise that are specific to the iOS build of WebKit.

Long story short, there's no good way to debug an iOS web app running in the actual iOS browser with a full-featured web inspector.

Mobile Safari Inspector changes that. It's a bare-bones iOS web browser that uses private iOS 5 APIs to let you use the desktop Webkit Inspector to inspect a UIWebView running in the iOS Simulator.


## Setup ##
Since it uses private APIs, Mobile Safari Inspector can't be submitted to Apple for release on the App Store. Fortunately, it's easy to get up and running via XCode even if you're not a paid iOS Developer Program member.

1. Clone this repo
2. Open MobileSafariInspector.xcodeproj in XCode 4
3. Set the target to either the iPhone 5.0 Simulator or iPad 5.0 Simulator
4. Run the app and navigate to whatever page you want to inspect.
5. Point your favorite desktop WebKit browser to http://localhost:9999
6. Debug away!


## Features ##
* Mobile Safari Inspector's UI chrome takes up the same amount of space that the Mobile Safari UI does. This means that the size of the viewable browser area is the exact same as it would be in MobileSafari, no matter what device or orientation you're testing.
* **Hiding the address bar** is equivalent to having ```<meta name="apple-touch-fullscreen" content="yes" />``` set in your webapp.
* **Full Screen mode** hides all UI elements. This is equivalent to launching your web app from the home screen with ```<meta name="apple-mobile-web-app-capable" content="yes"/>``` and ```<meta name="apple-touch-fullscreen" content="yes" />``` set. 

# Known Issues #
* Currently, there's no way to exit from Full Screen mode without restarting the app.
* Can only be run in the simulator, not an actual device (this is a limitation of Apple's private APIs)