## PhoneGap Cordova RecordPermission Plugin ##
 * by Keenan Wyrobek

## About this Plugin ##
In iOS7 the user will get a permission request the first time your app attempts to access the microphone.

This plugin lets you ask for permission and find out if permission is given at the time of your choosing.
 * In iOS < 7  every time this is called you will get a true response without a dialogue to the user.
 * In iOS >= 7 iOS will ask your user for permission to use the microphone once and only once (either when you first call this function OR when you first tried to record, which ever comes first). 
 * Subsequent calls to this function will return the permission as saved in iOS settings.

## Using the Plugin ##

The plugin creates a function window.recordPermission(params) method. It takes one object with the following two properties.
 * success: (required) This function will be called with one param - a boolean with the current microphone permission state.
 * error: (required) This function is called if there is an error. I don't know of any conditions that would call this. iOS < 7 should be handled gracefully

Example:

		recordPermission({
			success: function(answer){
				console.log('permission = '+answer);
			},
			error: function(error){
				console.log('error = '+JSON.stringify(error));
			}
		});


## Compatibility ##

 * This plug in has been tested with Cordova/PhoneGap 2.1.0 and should support 2.x project.
 * It has been tested on iOS 5.1, 6.0, 6.1 & 7.0

## Adding the Plugin to your project ##

1. Add the .h and .m files to your Plugins folder in your project.
2. Add the .js files to your "www" folder on disk, and add reference(s) to the .js files in your html file(s).
3. Go to Cordova.plist under Resources in Xcode - Under Plugins dictionary add RecordPermission:RecordPermission

The demo folder contains a www folder you can drop into a fresh Cordova project to test out this plugin. You will still need to manually complete step 1 & 3 above.

## LICENSE ##

The MIT License

Copyright (c) 2013 Keenan Wyrobek

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

