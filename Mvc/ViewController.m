//
//  ViewController.m
//  Mvc
//
//  Created by Admin on 28.12.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lable;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UISwitch *mySw;
@property (weak, nonatomic) IBOutlet UISlider *myS;
@property (weak, nonatomic) IBOutlet UISegmentedControl *myVC;
@property (weak, nonatomic) IBOutlet UITextField *myText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSData *color = [[NSUserDefaults standardUserDefaults]objectForKey:@"colorKey"];
    if (color )
        self.button.backgroundColor = [NSKeyedUnarchiver unarchiveObjectWithData:color];
    
    NSString *text = [[NSUserDefaults standardUserDefaults]objectForKey:@"txtKey"];
    if (text) {
        self.myText.text = text;
    }
    
    NSNumber *sc = [[NSUserDefaults standardUserDefaults]objectForKey:@"scKey"];
    if (sc) {
        self.myVC.selectedSegmentIndex = sc.integerValue;
    }
    
    NSNumber *sldr = [[NSUserDefaults standardUserDefaults]objectForKey:@"sldrKey"];
    if (sldr)
        self.myS.value = sldr.floatValue;
    
    NSNumber *swth = [[NSUserDefaults standardUserDefaults]objectForKey:@"swthKey"];
    if (swth) {
        [self.mySw setOn:swth.boolValue];
    }
}



- (UIColor *)randColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); // 0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}
- (IBAction)method1:(id)sender {
    NSString *text = self.myText.text;
    [[NSUserDefaults standardUserDefaults] setObject:text forKey:@"txtKey"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
- (IBAction)metSC:(id)sender {
    int sc = self.myVC.selectedSegmentIndex;
    [[NSUserDefaults standardUserDefaults] setObject:@(sc) forKey:@"scKey"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
- (IBAction)metSel:(id)sender {
    float sldr = self.myS.value;
    [[NSUserDefaults standardUserDefaults] setObject:@(sldr) forKey:@"sldrKey"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
- (IBAction)metSw:(id)sender {
    int swth = self.mySw.isOn;
    [[NSUserDefaults standardUserDefaults] setObject:@(swth) forKey:@"swthKey"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
- (IBAction)mButton:(id)sender {
    UIColor *change = [self randColor];
    self.button.backgroundColor = change;
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:change] forKey:@"colorKey"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}

@end
