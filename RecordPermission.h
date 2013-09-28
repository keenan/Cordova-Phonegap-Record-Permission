//
//  RecordPermission.h
//
//  Created by Keenan Wyrobek, September 2013.
//  MIT licensed
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <Cordova/CDV.h>

@interface RecordPermission : CDVPlugin{
    NSString* callbackId;
}

@property (nonatomic, retain) NSString* callbackId;

- (void)recordPermission:(NSArray*)arguments ;

@end
