# What is this? #


When developing normal webapps, the Webkit Inspector is an invaluable tool. Debugging iOS webapps can be a pain, though, since there's no way to access the Webkit Inspector within iOS. While Weinre (http://phonegap.github.com/weinre/) gives you a remote inspector, it's far less full-featured than the full Inspector. Another common solution is to just use desktop Safari to debug issues, but often problems arise that are specific to the iOS build of WebKit. 

Long story short, there isn't a good way to debug an iOS web app running in the actual iOS browser with a full-featured web inspector.

Mobile Safari Inspector changes that. It's a bare-bones iOS web browser that uses private iOS 5 SDK APIs to let you use the full Webkit Inspector from your desktop browser while using an actual iOS UIWebView from inside the iOS Simulator. 

# Set-Up #
1. Clone this repo
2. Open MobileSafariInspector.xcodeproj in XCode 4
3. Set the target to either the iPhone 5.0 Simulator or iPad 5.0 Simulator (it only works in the simulator, not an actual device)
4. Run the app
5. In your desktop browser of choice, go to http://localhost:9999
6. Debug away!


# Features #

* Mobile Safari Inspector's UI chrome takes up the same amount of space that Mobile Safari's UI does. This means that the size of the viewable browser area is the exact same as it would be in MobileSafari, no matter what device and orientation you're testing.
* **Hiding the address bar** is equivalent to having ```<meta name="apple-touch-fullscreen" content="yes" />``` set in your webapp.
* **Full Screen mode** hides all UI elements. This is equivalent to launching your web app from the home screen with ```<meta name="apple-mobile-web-app-capable" content="yes"/>``` and ```<meta name="apple-touch-fullscreen" content="yes" />``` set. 

# Known Issues #
* Currently, there's no way to exit from Full Screen mode without restarting the app.
* Can only be run in the simulator, not an actual device (this is a limitation of Apple's private APIs)