//
//  LandingPageViewController.m
//  SFDCADMIN
//
//  Created by Kyle Roche on 4/5/11.
//  Copyright 2011 Isidorey. All rights reserved.
//

#import "LandingPageViewController.h"


@implementation LandingPageViewController
@synthesize userTable, userArray, selectedUser;

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
    [userTable release];
    userTable = nil;
    [selectedUser release];
    selectedUser = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)sfdcQueryResults:(ZKQueryResult *)result error:(NSError *)error context:(id)context {
    if (result && !error) {
        if ([context isEqualToString:@"getUsers"]) {
            self.userArray = [NSMutableArray arrayWithArray:[result records]];
            [self.userTable reloadData];
        } else {
            NSLog(@"Success call");
        }
    }
}

- (void)loginViewControllerDidFinish:(LoginViewController *)loginViewController {
    [self dismissModalViewControllerAnimated:YES];
    
    NSString *userQuery = @"SELECT id, name, username from user";
    [[ZKServerSwitchboard switchboard] query:userQuery target:self selector:@selector(sfdcQueryResults:error:context:) context:@"getUsers"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.userArray count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSLog(@"%@", [self.userArray objectAtIndex:indexPath.row]);
    cell.textLabel.text = [[self.userArray objectAtIndex:indexPath.row] fieldValue:@"Name"];
    cell.detailTextLabel.text = [[self.userArray objectAtIndex:indexPath.row] fieldValue:@"Username"];
    
    UIImage *image = [UIImage imageNamed:@"User.png"];
    cell.imageView.image = image;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedUser = [self.userArray objectAtIndex:indexPath.row];
    
    UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:[NSString stringWithFormat:@"Select action for this %@", [[self.userArray objectAtIndex:indexPath.row] fieldValue:@"Name"]] 
                                                        delegate:self 
                                               cancelButtonTitle:nil 
                                          destructiveButtonTitle:nil 
                                               otherButtonTitles:@"Reset Password", @"Cancel", nil];
    action.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    action.destructiveButtonIndex = 2;
    action.tag = 101;
    [action showInView:self.view];
    [action release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (actionSheet.tag == 101) { 
        [[ZKServerSwitchboard switchboard] resetPasswordForUserId:[self.selectedUser fieldValue:@"Id"] triggerUserEmail:YES target:self selector:@selector(sfdcQueryResults:error:context:) context:@"resetPassword"];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    LoginViewController *lvc = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
	lvc.delegate = self;
	[self presentModalViewController:lvc animated:NO];		

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
