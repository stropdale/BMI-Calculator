//
//  ViewController.m
//  BMICalculator
//
//  Created by Richard Stockdale on 11/07/2017.
//  Copyright © 2017 Junction Seven. All rights reserved.
//

#import "ViewController.h"
#import "JSDBMI.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *heightField;
@property (weak, nonatomic) IBOutlet UITextField *weightField;

@property (strong, nonatomic) JSDBMI *bmiCalc;
@property (strong, nonatomic) NSNumberFormatter *numberFomatter;

@property (weak, nonatomic) IBOutlet UILabel *catagoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *bmiLabel;

@end

@implementation ViewController

- (IBAction)valueDidChange {
    [self updateBMILabel];
}

- (void) updateBMILabel {
    if (self.weightField.text.length && self.heightField.text.length) {
        
        NSNumber *w = [self.numberFomatter numberFromString:self.weightField.text];
        NSNumber *h = [self.numberFomatter numberFromString:self.heightField.text];
        
        if (!self.bmiCalc) {
            self.bmiCalc = [[JSDBMI alloc] initWithWeightinKG:w heightInCM:h];
        }
        else {
            self.bmiCalc.weightInKg = w;
            self.bmiCalc.heightInCm = h;
        }
        
        self.bmiLabel.text = [NSString stringWithFormat:@"%@", self.bmiCalc.bmiScore];
        self.catagoryLabel.text = self.bmiCalc.bmiCategoryString;
    }
    else {
        self.bmiLabel.text = @"BMI Calculator";
        self.catagoryLabel.text = @"";
    }
}

- (NSNumberFormatter *) numberFomatter {
    if (!_numberFomatter) {
        _numberFomatter = [[NSNumberFormatter alloc] init];
        _numberFomatter.numberStyle = NSNumberFormatterDecimalStyle;
    }
    
    return _numberFomatter;
}





- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self.heightField addTarget:self action:@selector(valueDidChange) forControlEvents:UIControlEventEditingChanged];
    [self.weightField addTarget:self action:@selector(valueDidChange) forControlEvents:UIControlEventEditingChanged];
}



@end
