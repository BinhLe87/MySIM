//
//  AppDelegate.m
//  MyViettel
//
//  Created by Le Van Binh on 10/18/16.
//  Copyright © 2016 LBComp. All rights reserved.
//

#import "AppDelegate.h"
#import <MagicalRecord.h>
#import <FBMemoryProfiler/FBMemoryProfiler.h>
#import <GooglePlaces/GooglePlaces.h>

@import GoogleMaps;


@interface AppDelegate ()

@end

@implementation AppDelegate {
    
    FBMemoryProfiler *internalMemoryProfiler;
    int counter;
}

#pragma mark - Initializers
-(LBMyViettelDependencies *)myViettelDependencies {
    
    if (_myViettelDependencies) return _myViettelDependencies;
    
    _myViettelDependencies = [[LBMyViettelDependencies alloc] init];
    
    return _myViettelDependencies;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //TODO: enable FacebookMemory Profiler
    /*FBMemoryProfiler *memoryProfiler = [FBMemoryProfiler new];
    [memoryProfiler enable];
    
    // Store memory profiler somewhere to extend it's lifetime
    internalMemoryProfiler = memoryProfiler;*/
    
    //TODO: Config Core data
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"LBMyViettelDataModel"];
    
    //TODO: Google maps
    [GMSServices provideAPIKey:@"AIzaSyDqJ7_AmiYAulA62y9DhNhmvHZxZKWlQUg"];
    [GMSPlacesClient provideAPIKey:@"AIzaSyDqJ7_AmiYAulA62y9DhNhmvHZxZKWlQUg"];
    
    //TODO: Register Push notification
    if ([application respondsToSelector:@selector(isRegisteredForRemoteNotifications)])
    {
        // iOS 8 Notifications
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        
        [application registerForRemoteNotifications];
    }
    else
    {
        // iOS < 8 Notifications
        [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound)];
    }
    counter = 0;
    UIMutableUserNotificationAction *increaseAction= [[UIMutableUserNotificationAction alloc] init];
    increaseAction.identifier = @"INCREMENT_ACTION";
    increaseAction.title= @"Add + 1";
    increaseAction.activationMode = UIUserNotificationActivationModeBackground;
    increaseAction.authenticationRequired = true;
    increaseAction.destructive = false;
    
    UIMutableUserNotificationAction *decreaseAction= [[UIMutableUserNotificationAction alloc] init];
    decreaseAction.identifier = @"DECREMENT_ACTION";
    decreaseAction.title= @"Sub - 1";
    decreaseAction.activationMode = UIUserNotificationActivationModeBackground;
    decreaseAction.authenticationRequired = true;
    decreaseAction.destructive = false;
    
    UIMutableUserNotificationAction *resetAction= [[UIMutableUserNotificationAction alloc] init];
    resetAction.identifier = @"RESET_ACTION";
    resetAction.title= @"Reset";
    resetAction.activationMode = UIUserNotificationActivationModeForeground;
    resetAction.authenticationRequired = true;
    resetAction.destructive = true;
    
    // 2. Create the category ***********************************************
    
    // Category
    UIMutableUserNotificationCategory *counterCategory = [[UIMutableUserNotificationCategory alloc] init];
    counterCategory.identifier = @"COUNTER_CATEGORY";
    
    // A. Set actions for the default context
    [counterCategory setActions:@[increaseAction, decreaseAction, resetAction]
                     forContext: UIUserNotificationActionContextDefault];
    
    // B. Set actions for the minimal context
    [counterCategory setActions:@[increaseAction, decreaseAction]
                     forContext: UIUserNotificationActionContextMinimal];
    
    NSSet *categories = [NSSet setWithObjects:counterCategory, nil];
    // 3. Notification Registration *****************************************
    
    UIUserNotificationType notificationType = UIUserNotificationTypeAlert | UIUserNotificationTypeSound;
    UIUserNotificationSettings *notificationSettings = [UIUserNotificationSettings settingsForTypes:notificationType categories:categories];
    
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
    
    
    //TODO: show HomeViewController
    [self.myViettelDependencies.homeRouter showHomeViewController];
    
    return YES;
}






- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Push notification handlers
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    NSString *deviceTokenString = [deviceToken description];
    
    NSLog(@"device Token: %@", deviceTokenString);
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    NSLog(@"Failed to register remote notification: %@", [error localizedDescription]);
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    NSString *alertMessage = [userInfo objectForKey:@"message"];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = nil;
    localNotification.alertBody = alertMessage;
    localNotification.alertAction = [userInfo objectForKey:@"action"];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] +1;
    localNotification.category = @"COUNTER_CATEGORY";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler {
    
    
    // Handle notification action *****************************************
    if ([notification.category isEqualToString:@"COUNTER_CATEGORY"]) {
        
        if ([identifier isEqualToString:@"INCREMENT_ACTION"]) {
            
            counter++;
        } else if ([identifier isEqualToString:@"DECREMENT_ACTION"]) {
            
            counter--;
        } else if ([identifier isEqualToString:@"RESET_ACTION"]) {
            
            counter =0;
        }
    }
    
    NSLog(@"counter = %d", counter);
    
    if (completionHandler) {
        
        completionHandler();
    }
}

@end
