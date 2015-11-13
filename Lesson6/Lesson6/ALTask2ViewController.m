//
//  ALTask2ViewController.m
//  Lesson6
//
//  Created by Yuriy T on 13.11.15.
//  Copyright © 2015 Yuriy T. All rights reserved.
//

#import "ALTask2ViewController.h"

@interface ALTask2ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labeHeightConstraint;

@property (assign, nonatomic) float currentScreenHeight;

@end

@implementation ALTask2ViewController

#pragma mark - Action

- (IBAction)changeLabelHeight:(UISlider *)sender {
    self.labeHeightConstraint.constant = sender.value;
    
    NSLog(@"slider value is %f", sender.value);
    NSLog(@"constraint value is = %f", self.labeHeightConstraint.constant);
}

#pragma mark - Views

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.slider.minimumValue = 0;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateWith];
    self.slider.value = self.currentScreenHeight / 2.f;
    self.labeHeightConstraint.constant = self.slider.value;
}

-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self updateWith];
}

-(void) updateWith {
    self.currentScreenHeight = self.view.bounds.size.height;
    self.slider.maximumValue = self.currentScreenHeight;
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
