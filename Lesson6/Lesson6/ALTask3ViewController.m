//
//  ALTask3ViewController.m
//  Lesson6
//
//  Created by Yuriy T on 13.11.15.
//  Copyright © 2015 Yuriy T. All rights reserved.
//

#import "ALTask3ViewController.h"

@interface ALTask3ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerViewWidthConstraint;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (assign, nonatomic) float currentWidth;

@end

@implementation ALTask3ViewController

# pragma mark - Actions

- (IBAction)changeCentralViewWidth:(UISlider *)sender {
    self.centerViewWidthConstraint.constant = sender.value;
}

# pragma mark - Views

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.slider.minimumValue = 20;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateWith];
    self.slider.value = self.currentWidth / 2.f;
    self.centerViewWidthConstraint.constant = self.slider.value;
}

-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self updateWith];
}

-(void) updateWith {
    self.currentWidth = self.view.bounds.size.width;
    self.slider.maximumValue = self.currentWidth - 200;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
