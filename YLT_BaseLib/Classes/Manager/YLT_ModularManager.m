//
//  YLT_ModularManager.m
//  Pods
//
//  Created by YLT_Alex on 2017/11/23.
//

#import "YLT_ModularManager.h"

NS_ASSUME_NONNULL_BEGIN
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"

@interface YLT_ModularManager() {
}
/**
 模块列表
 */
@property (nonatomic, strong) NSMutableArray *modularList;

@end

@implementation YLT_ModularManager

YLT_ShareInstance(YLT_ModularManager);

- (void)YLT_init {
    self.modularList = [[NSMutableArray alloc] init];
}
/**
 模块初始化

 @param plistPath 路径
 */
+ (void)modularWithPlistPath:(NSString *)plistPath {
    [[NSArray arrayWithContentsOfFile:plistPath] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [[YLT_ModularManager shareInstance].modularList addObject:[[NSClassFromString(obj) alloc] init]];
    }];
}



- (void)applicationDidFinishLaunching:(UIApplication *)application {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(applicationDidFinishLaunching:)]) {
            [((YLT_BaseModular *) cls) applicationDidFinishLaunching:application];
        }
    }
}
#if UIKIT_STRING_ENUMS
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions  {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:willFinishLaunchingWithOptions:)]) {
            [((YLT_BaseModular *) cls) application:application willFinishLaunchingWithOptions:launchOptions];
        }
    }
    return YES;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:didFinishLaunchingWithOptions:)]) {
            [((YLT_BaseModular *) cls) application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }
    return YES;
}
#else
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions  {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:willFinishLaunchingWithOptions:)]) {
            [((YLT_BaseModular *) cls) application:application willFinishLaunchingWithOptions:launchOptions];
        }
    }
    return YES;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:didFinishLaunchingWithOptions:)]) {
            [((YLT_BaseModular *) cls) application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }
    return YES;
}
#endif

- (void)applicationDidBecomeActive:(UIApplication *)application {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(applicationDidBecomeActive:)]) {
            [((YLT_BaseModular *) cls) applicationDidBecomeActive:application];
        }
    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(applicationWillResignActive:)]) {
            [((YLT_BaseModular *) cls) applicationWillResignActive:application];
        }
    }
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:handleOpenURL:)]) {
            [((YLT_BaseModular *) cls) application:application handleOpenURL:url];
        }
    }
    return YES;
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:openURL:sourceApplication:annotation:)]) {
            [((YLT_BaseModular *) cls) application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
        }
    }
    return YES;
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options  {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:openURL:options:)]) {
            [((YLT_BaseModular *) cls) application:application openURL:url options:options];
        }
    }
    return YES;
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(applicationDidReceiveMemoryWarning:)]) {
            [((YLT_BaseModular *) cls) applicationDidReceiveMemoryWarning:application];
        }
    }
}
- (void)applicationWillTerminate:(UIApplication *)application {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(applicationWillTerminate:)]) {
            [((YLT_BaseModular *) cls) applicationWillTerminate:application];
        }
    }
}
- (void)applicationSignificantTimeChange:(UIApplication *)application {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(applicationSignificantTimeChange:)]) {
            [((YLT_BaseModular *) cls) applicationSignificantTimeChange:application];
        }
    }
}

- (void)application:(UIApplication *)application willChangeStatusBarOrientation:(UIInterfaceOrientation)newStatusBarOrientation duration:(NSTimeInterval)duration {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:willChangeStatusBarOrientation:duration:)]) {
            [((YLT_BaseModular *) cls) application:application willChangeStatusBarOrientation:newStatusBarOrientation duration:duration];
        }
    }
}
- (void)application:(UIApplication *)application didChangeStatusBarOrientation:(UIInterfaceOrientation)oldStatusBarOrientation {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:didChangeStatusBarOrientation:)]) {
            [((YLT_BaseModular *) cls) application:application didChangeStatusBarOrientation:oldStatusBarOrientation];
        }
    }
}

- (void)application:(UIApplication *)application willChangeStatusBarFrame:(CGRect)newStatusBarFrame {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:willChangeStatusBarFrame:)]) {
            [((YLT_BaseModular *) cls) application:application willChangeStatusBarFrame:newStatusBarFrame];
        }
    }
}
- (void)application:(UIApplication *)application didChangeStatusBarFrame:(CGRect)oldStatusBarFrame {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:didChangeStatusBarFrame:)]) {
            [((YLT_BaseModular *) cls) application:application didChangeStatusBarFrame:oldStatusBarFrame];
        }
    }
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:didRegisterUserNotificationSettings:)]) {
            [((YLT_BaseModular *) cls) application:application didRegisterUserNotificationSettings:notificationSettings];
        }
    }
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:didRegisterForRemoteNotificationsWithDeviceToken:)]) {
            [((YLT_BaseModular *) cls) application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
        }
    }
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:didFailToRegisterForRemoteNotificationsWithError:)]) {
            [((YLT_BaseModular *) cls) application:application didFailToRegisterForRemoteNotificationsWithError:error];
        }
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:didReceiveRemoteNotification:)]) {
            [((YLT_BaseModular *) cls) application:application didReceiveRemoteNotification:userInfo];
        }
    }
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:didReceiveLocalNotification:)]) {
            [((YLT_BaseModular *) cls) application:application didReceiveLocalNotification:notification];
        }
    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:handleActionWithIdentifier:forLocalNotification:completionHandler:)]) {
            [((YLT_BaseModular *) cls) application:application handleActionWithIdentifier:identifier forLocalNotification:notification completionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:handleActionWithIdentifier:forRemoteNotification:withResponseInfo:completionHandler:)]) {
            [((YLT_BaseModular *) cls) application:application handleActionWithIdentifier:identifier forRemoteNotification:userInfo withResponseInfo:responseInfo completionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:handleActionWithIdentifier:forRemoteNotification:completionHandler:)]) {
            [((YLT_BaseModular *) cls) application:application handleActionWithIdentifier:identifier forRemoteNotification:userInfo completionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:handleActionWithIdentifier:forLocalNotification:withResponseInfo:completionHandler:)]) {
            [((YLT_BaseModular *) cls) application:application handleActionWithIdentifier:identifier forLocalNotification:notification withResponseInfo:responseInfo completionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler  {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:didReceiveRemoteNotification:fetchCompletionHandler:)]) {
            [((YLT_BaseModular *) cls) application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:performFetchWithCompletionHandler:)]) {
            [((YLT_BaseModular *) cls) application:application performFetchWithCompletionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:performActionForShortcutItem:completionHandler:)]) {
            [((YLT_BaseModular *) cls) application:application performActionForShortcutItem:shortcutItem completionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)(void))completionHandler  {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:handleEventsForBackgroundURLSession:completionHandler:)]) {
            [((YLT_BaseModular *) cls) application:application handleEventsForBackgroundURLSession:identifier completionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(nullable NSDictionary *)userInfo reply:(void(^)(NSDictionary * __nullable replyInfo))reply {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:handleWatchKitExtensionRequest:reply:)]) {
            [((YLT_BaseModular *) cls) application:application handleWatchKitExtensionRequest:userInfo reply:reply];
        }
    }
}

- (void)applicationShouldRequestHealthAuthorization:(UIApplication *)application  {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(applicationShouldRequestHealthAuthorization:)]) {
            [((YLT_BaseModular *) cls) applicationShouldRequestHealthAuthorization:application];
        }
    }
}

- (void)application:(UIApplication *)application handleIntent:(INIntent *)intent completionHandler:(void(^)(INIntentResponse *intentResponse))completionHandler {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:handleIntent:completionHandler:)]) {
            [((YLT_BaseModular *) cls) application:application handleIntent:intent completionHandler:completionHandler];
        }
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(applicationDidEnterBackground:)]) {
            [((YLT_BaseModular *) cls) applicationDidEnterBackground:application];
        }
    }
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(applicationWillEnterForeground:)]) {
            [((YLT_BaseModular *) cls) applicationWillEnterForeground:application];
        }
    }
}

- (void)applicationProtectedDataWillBecomeUnavailable:(UIApplication *)application {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(applicationProtectedDataWillBecomeUnavailable:)]) {
            [((YLT_BaseModular *) cls) applicationProtectedDataWillBecomeUnavailable:application];
        }
    }
}
- (void)applicationProtectedDataDidBecomeAvailable:(UIApplication *)application {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(applicationProtectedDataDidBecomeAvailable:)]) {
            [((YLT_BaseModular *) cls) applicationProtectedDataDidBecomeAvailable:application];
        }
    }
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(nullable UIWindow *)window {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:supportedInterfaceOrientationsForWindow:)]) {
            [((YLT_BaseModular *) cls) application:application supportedInterfaceOrientationsForWindow:window];
        }
    }
    return UIInterfaceOrientationMaskAll;
}
- (BOOL)application:(UIApplication *)application shouldAllowExtensionPointIdentifier:(UIApplicationExtensionPointIdentifier)extensionPointIdentifier  {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:shouldAllowExtensionPointIdentifier:)]) {
            [((YLT_BaseModular *) cls) application:application shouldAllowExtensionPointIdentifier:extensionPointIdentifier];
        }
    }
    return YES;
}

#pragma mark -- State Restoration protocol adopted by UIApplication delegate --

- (nullable UIViewController *) application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder  {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:viewControllerWithRestorationIdentifierPath:coder:)]) {
            [((YLT_BaseModular *) cls) application:application viewControllerWithRestorationIdentifierPath:identifierComponents coder:coder];
        }
    }
    return self.YLT_CurrentVC;
}
- (BOOL) application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder  {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:shouldSaveApplicationState:)]) {
            [((YLT_BaseModular *) cls) application:application shouldSaveApplicationState:coder];
        }
    }
    return YES;
}
- (BOOL) application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder  {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:shouldRestoreApplicationState:)]) {
            [((YLT_BaseModular *) cls) application:application shouldRestoreApplicationState:coder];
        }
    }
    return YES;
}
- (void) application:(UIApplication *)application willEncodeRestorableStateWithCoder:(NSCoder *)coder  {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:willEncodeRestorableStateWithCoder:)]) {
            [((YLT_BaseModular *) cls) application:application willEncodeRestorableStateWithCoder:coder];
        }
    }
}
- (void) application:(UIApplication *)application didDecodeRestorableStateWithCoder:(NSCoder *)coder  {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:didDecodeRestorableStateWithCoder:)]) {
            [((YLT_BaseModular *) cls) application:application didDecodeRestorableStateWithCoder:coder];
        }
    }
}

#pragma mark -- User Activity Continuation protocol adopted by UIApplication delegate --

- (BOOL)application:(UIApplication *)application willContinueUserActivityWithType:(NSString *)userActivityType  {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:willContinueUserActivityWithType:)]) {
            [((YLT_BaseModular *) cls) application:application willContinueUserActivityWithType:userActivityType];
        }
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray * __nullable restorableObjects))restorationHandler  {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:continueUserActivity:restorationHandler:)]) {
            [((YLT_BaseModular *) cls) application:application continueUserActivity:userActivity restorationHandler:restorationHandler];
        }
    }
    return YES;
}

- (void)application:(UIApplication *)application didFailToContinueUserActivityWithType:(NSString *)userActivityType error:(NSError *)error  {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:didFailToContinueUserActivityWithType:error:)]) {
            [((YLT_BaseModular *) cls) application:application didFailToContinueUserActivityWithType:userActivityType error:error];
        }
    }
}

- (void)application:(UIApplication *)application didUpdateUserActivity:(NSUserActivity *)userActivity  {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:didUpdateUserActivity:)]) {
            [((YLT_BaseModular *) cls) application:application didUpdateUserActivity:userActivity];
        }
    }
}

#pragma mark -- CloudKit Sharing Invitation Handling --

- (void) application:(UIApplication *)application userDidAcceptCloudKitShareWithMetadata:(CKShareMetadata *)cloudKitShareMetadata  {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(application:userDidAcceptCloudKitShareWithMetadata:)]) {
            [((YLT_BaseModular *) cls) application:application userDidAcceptCloudKitShareWithMetadata:cloudKitShareMetadata];
        }
    }
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(userNotificationCenter:willPresentNotification:withCompletionHandler:)]) {
            [((YLT_BaseModular *) cls) userNotificationCenter:center willPresentNotification:notification withCompletionHandler:completionHandler];
        }
    }
}
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler {
    for (YLT_BaseModular *cls in self.modularList) {
        if ([cls respondsToSelector:@selector(userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:)]) {
            [((YLT_BaseModular *) cls) userNotificationCenter:center didReceiveNotificationResponse:response withCompletionHandler:completionHandler];
        }
    }
}

@end
#pragma clang diagnostic pop
NS_ASSUME_NONNULL_END
