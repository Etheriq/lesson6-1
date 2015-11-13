//
//  ALTask1ViewController.m
//  Lesson6
//
//  Created by Yuriy T on 12.11.15.
//  Copyright © 2015 Yuriy T. All rights reserved.
//

#import "ALTask1ViewController.h"

@interface ALTask1ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightLabelConstraint;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (assign, nonatomic) float currentScreenWidth;

@end

@implementation ALTask1ViewController

#pragma mark - Actions

- (IBAction)rightConstraintSlider:(UISlider *)sender {
    
    [UIView animateWithDuration:2.3f animations:^{
        self.rightLabelConstraint.constant = sender.value;
    }];
    
    NSLog(@"slider value is %f", sender.value);
    NSLog(@"constraint value is = %f", self.rightLabelConstraint.constant);
}

#pragma mark - Views

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.slider.minimumValue = 1;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateWith];
    self.slider.value = self.currentScreenWidth / 2.f;
    self.rightLabelConstraint.constant = self.slider.value;
}

-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self updateWith];
}

-(void) updateWith {
    self.currentScreenWidth = self.view.bounds.size.width;
    self.slider.maximumValue = self.currentScreenWidth;
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
