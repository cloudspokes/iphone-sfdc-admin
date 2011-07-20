//
//  LandingPageViewController.h
//  SFDCADMIN
//
//  Created by Kyle Roche on 4/5/11.
//  Copyright 2011 Isidorey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKSforce.h"
#import "LoginViewController.h"

@interface LandingPageViewController : UIViewController <LoginViewControllerDelegate, UIActionSheetDelegate>{
    UITableView *userTable;
    NSMutableArray *userArray;
    ZKSObject *selectedUser;
}

@property (nonatomic, retain) IBOutlet UITableView *userTable;
@property (nonatomic, retain) NSMutableArray *userArray;
@property (nonatomic, retain) ZKSObject *selectedUser;

@end
