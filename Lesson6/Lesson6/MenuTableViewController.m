//
//  MenuTableViewController.m
//  Lesson6
//
//  Created by Yuriy T on 12.11.15.
//  Copyright © 2015 Yuriy T. All rights reserved.
//

#import "MenuTableViewController.h"
#import "GameViewController.h"
#import "ALTask1ViewController.h"

@interface MenuTableViewController ()

@end

@implementation MenuTableViewController {

    NSArray *menu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    menu = [NSArray arrayWithObjects:@"Game", @"AL task 1", @"AL task 2", @"AL task 3", @"AL task 4", nil];
    menu = @[@"Game", @"AL task 1", @"AL task 2", @"AL task 3", @"AL task 4"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [menu count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"menuCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"menuCell"];
    }
    
    cell.textLabel.text = [menu objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"cell_img"];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *menuTitle = menu[indexPath.row];
    
    if ([menuTitle isEqualToString:@"Game"]) {
        [self performSegueWithIdentifier:@"game" sender:nil];
    } else if ([menuTitle isEqualToString:@"AL task 1"]) {
        [self performSegueWithIdentifier:@"task1" sender:nil];
    } else if ([menuTitle isEqualToString:@"AL task 2"]) {
        [self performSegueWithIdentifier:@"task2" sender:nil];
    }
    
    NSLog(@"%@", menuTitle);
        
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}
*/

@end
