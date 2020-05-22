//
//  AppDelegate.h
//  YQDarkModeDemo
//
//  Created by vivian on 2020/5/22.
//  Copyright © 2020 vivian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;

- (void)saveContext;

@property (strong, nonatomic) UIWindow * window;

@end

