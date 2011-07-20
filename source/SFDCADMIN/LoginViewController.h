//
//  LoginViewController.h
//  SFDCADMIN
//
//  Created by Kyle Roche on 4/5/11.
//  Copyright 2011 Isidorey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKSforce.h"

@protocol LoginViewControllerDelegate;

@interface LoginViewController : UIViewController {
    UITextField *usernameTextField;
    UITextField *passwordTextField;
    id<LoginViewControllerDelegate> delegate;
}

@property (nonatomic, retain) IBOutlet UITextField *usernameTextField;
@property (nonatomic, retain) IBOutlet UITextField *passwordTextField;
@property (nonatomic, assign) id<LoginViewControllerDelegate> delegate;

- (IBAction)loginButtonClicked:(id)sender;

@end

@protocol LoginViewControllerDelegate

- (void)loginViewControllerDidFinish:(LoginViewController *)loginViewController;

@end
