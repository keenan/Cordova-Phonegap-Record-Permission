//
//  RecordPermission.m
//
//  Created by Keenan Wyrobek, September 2013.
//  MIT licensed
//

#import "RecordPermission.h"

@implementation RecordPermission

@synthesize callbackId;

- (void)recordPermission:(CDVInvokedUrlCommand*)command
{
    self.callbackId = command.callbackId;
    
    // First check to see if we are in ios 7.
    NSArray *vComp = [[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."];

    if ([[vComp objectAtIndex:0] intValue] < 7) {
        // before iOS when this permission was not required
        [self performSelectorOnMainThread:@selector(doSuccessCallback:) withObject:@"True" waitUntilDone:NO];
    } else {
        
        // run this in a try just in case
        @try {
            [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
                // cast this to a string bc I don't know if you can or how to pass a boolean back to javascript.
                //      This is converted back to a javascript boolean in RecordPermission.h.js file
                NSString * grantedString = (granted) ? @"True" : @"False";
                
                // talking back to javascript must be done in main thread.
                [self performSelectorOnMainThread:@selector(doSuccessCallback:) withObject:grantedString waitUntilDone:NO];
            }];
            
        } @catch (id exception) {
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION messageAsString:[exception reason]];
            NSString* javaScript = [pluginResult toErrorCallbackString:command.callbackId];
            [self writeJavascript:javaScript];
        }
    }
}

-(void) doSuccessCallback:(NSString*)granted {
    NSLog(@"doing success callback");
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:granted];
    NSString* javaScript = [pluginResult toSuccessCallbackString:self.callbackId];
    [self writeJavascript:javaScript];
}

@end
