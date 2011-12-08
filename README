# What is this? #

When developing normal webapps, the Webkit Inspector is an invaluable tool. Debugging iOS webapps can be a pain, though, since there's no way to access the Webkit Inspector within iOS. While Weinre[http://phonegap.github.com/weinre/] works wonderfully, it is still far less full-featured than the full Inspector. Another common solution is to just use desktop Safari to debug issues, but often issues arise that are specific to the iOS build of WebKit. Long story short, there isn't a good way to debug an iOS web app running in the actual iOS browser with a fully-featured web inspector.

Mobile Safari Inspector changes that. It's a bare-bones iOS web browser that uses private iOS 5 SDK APIs to let you use the full Webkit Inspector from your desktop browser while using an actual iOS UIWebView from inside the iOS Simulator.

Although the UI chrome is different than Mobile Safari, the size of the toolbars match that of Mobile Safari, so the visible web browser area is exactly the same for all orientations and devices.

# Set-Up #
1. Clone this repo
2. Open up the XCode project file in XCode 4
3. Set the target to either the iPhone 5.0 Simulator or iPad 5.0 Simulator (it only works in the simulator, not an actual device)
4. Run the app
5. In your desktop browser of choice, go to http://localhost:9999
6. Debug away!


# Options #

* *Hiding the address bar* is the equivalent of having the ```<meta name="apple-touch-fullscreen" content="yes" />``` tag present in your HTML.
* *Full Screen mode* hides all UI elements. This is the equivalent of launching your web app from the home screen with ```<meta name="apple-mobile-web-app-capable" content="yes"/>``` and ```<meta name="apple-touch-fullscreen" content="yes" />``` tags presents. Currently, there's no way to exit full screen mode without restarting the app.