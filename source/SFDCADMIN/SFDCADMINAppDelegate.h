//
//  SFDCADMINAppDelegate.h
//  SFDCADMIN
//
//  Created by Kyle Roche on 4/5/11.
//  Copyright 2011 Isidorey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFDCADMINAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
