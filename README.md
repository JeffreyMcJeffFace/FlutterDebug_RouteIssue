# deeplink_demo

This repo demonstrates unexpected behavior when using a deeplink to launch an app and there is a query parameter in link with a URL format.

https://github.com/flutter/flutter/issues/93295

In this example, this is the deeplink being used:
demoapp://dl.demo.app/passwordless?token=abc123&targetRoute=demoapp%3A%2F%2Fdl.demo.app%2Fpasswordless&shortCode=F8ZCGU&userId=12345679

To trigger this deeplink use the following ADB command (note the extra slashes in URL to call properly with ADB):

`adb shell am start -a android.intent.action.VIEW -d "demoapp://dl.demo.app/passwordless?token=abc123\&targetRoute=demoapp%3A%2F%2Fdl.demo.app%2Fpasswordless\&shortCode=F8ZCGU\&userId=12345679"`

## App is Already Running when Link Is Activated

Everything works as expected. You will arrive on a target page showing the query parameter values

## App is NOT Running when Link Is Activated

Multiple routes are called in rapid success.

In this example, You will land on the successful route parsing page, but if you click the back arrow you can see that there were THREE routes that were navigated to before the final route. 

If you omit the targetRoute parameter, the behavior is same as if app is running. To see, launch app with this command:

`adb shell am start -a android.intent.action.VIEW -d "demoapp://dl.demo.app/passwordless?token=abc123\&shortCode=F8ZCGU\&userId=12345679"`
