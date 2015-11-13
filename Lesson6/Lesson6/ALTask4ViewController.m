//
//  ALTask4ViewController.m
//  Lesson6
//
//  Created by Yuriy T on 14.11.15.
//  Copyright © 2015 Yuriy T. All rights reserved.
//

#import "ALTask4ViewController.h"

@interface ALTask4ViewController ()

    @property (weak, nonatomic) IBOutlet UIView *containerView;
    @property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;
    @property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
    @property (weak, nonatomic) IBOutlet UISlider *heightSlider;
    @property (weak, nonatomic) IBOutlet UISlider *widthSlider;

    @property (assign, nonatomic) float currentWidth;
    @property (assign, nonatomic) float currentHeight;

@end

#pragma mark - Actions

@implementation ALTask4ViewController
- (IBAction)changeHeight:(UISlider *)sender {
    self.heightConstraint.constant = sender.value;
}
- (IBAction)changeWidth:(UISlider *)sender {
    self.widthConstraint.constant = sender.value;
}

#pragma mark - Views

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.containerView.layer.borderColor = [UIColor colorWithRed:.8f green:.8f blue:.8f alpha:.8f].CGColor;
    self.containerView.layer.borderWidth = 1.f;
    
    self.heightSlider.minimumValue = 1.f;
    self.widthSlider.minimumValue = 1.f;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self updateWithAndHeight];
    
    self.widthSlider.value = self.currentWidth / 2.f;
    self.widthConstraint.constant = self.widthSlider.value;
    
    self.heightSlider.value = self.currentHeight / 2.f;
    self.heightConstraint.constant = self.heightSlider.value;
}

-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self updateWithAndHeight];
}

-(void) updateWithAndHeight {
    self.currentHeight = self.view.bounds.size.height;
    self.heightSlider.maximumValue = self.currentHeight;
    
    self.currentWidth = self.view.bounds.size.width;
    self.widthSlider.maximumValue = self.currentWidth;
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
