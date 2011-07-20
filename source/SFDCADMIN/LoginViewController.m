//
//  LoginViewController.m
//  SFDCADMIN
//
//  Created by Kyle Roche on 4/5/11.
//  Copyright 2011 Isidorey. All rights reserved.
//

#import "LoginViewController.h"


@implementation LoginViewController
@synthesize delegate, usernameTextField, passwordTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [usernameTextField release];
    usernameTextField = nil;
    [passwordTextField release];
    passwordTextField = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)loginResult:(ZKLoginResult *)result error:(NSError *)error {
	if (result && !error) {
		NSLog(@"LoginViewController: Login Result Success");
        [self.delegate loginViewControllerDidFinish:self];
	} else if (error) {
		NSLog(@"LoginViewController: Error on Login");
	}
}

- (void)loginButtonClicked:(id)sender {
	[ZKServerSwitchboard switchboard].logXMLInOut = YES;    
	[[ZKServerSwitchboard switchboard] loginWithUsername:usernameTextField.text password:passwordTextField.text target:self selector:@selector(loginResult:error:)];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
