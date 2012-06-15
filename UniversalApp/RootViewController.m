//
//  RootViewController.m
//  UniversalApp
//
//  Created by Marian Paul on 03/04/12.
//  Copyright (c) 2012 iPuP SARL. All rights reserved.
//

#import "RootViewController.h"
#import "DetailViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Ratatouille";
    
    _recipeArray = [[NSMutableArray alloc] init];
    [_recipeArray addObject:@"Tomate"];
    [_recipeArray addObject:@"Courgette"];
    [_recipeArray addObject:@"Aubergine"];
    [_recipeArray addObject:@"Poivron"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        return interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
    else
        return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _recipeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [_recipeArray objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController = nil;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        detailViewController = (DetailViewController*)self.splitViewController.delegate;
    }
    else
    {
        detailViewController = [[DetailViewController alloc] init];
        [self.navigationController pushViewController:detailViewController animated:YES];
    }
    
    detailViewController.detailLabel.text = [_recipeArray objectAtIndex:indexPath.row];
    [detailViewController.detailLabel sizeToFit];
}

@end
