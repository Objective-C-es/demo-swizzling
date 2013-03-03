//
//  RAMAppDelegate.h
//  DemoSwizzling
//
//  Created by Rafael Aguilar Martín on 03/03/13.
//  Copyright (c) 2013 Rafael Aguilar Martín. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RAMViewController;

@interface RAMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) RAMViewController *viewController;

@end
