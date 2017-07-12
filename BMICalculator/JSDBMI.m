//
//  JSDBMI.m
//  BMICalculator
//
//  Created by Richard Stockdale on 11/07/2017.
//  Copyright © 2017 Junction Seven. All rights reserved.
//

#import "JSDBMI.h"

@interface JSDBMI ()

@property (nonatomic, strong) NSNumber *bmiScore;
@property (nonatomic) BMICategory bmiCategory;

@end

@implementation JSDBMI

- (BMICategory) bmiCategory {
    /*
     Severe Thinness	< 16
     Moderate Thinness	16 - 17
     Mild Thinness	17 - 18.5
     Normal	18.5 - 25
     Overweight	25 - 30
     Obese Class I	30 - 35
     Obese Class II	35 - 40
     Obese Class III	> 40
     */
    double bmi = self.bmiScore.doubleValue;
    if (bmi < 16) {
        return SevereThin;
    }
    else if ([self bmiIsInRange:16.0 and:17.0]) {
        return ModerateThinness;
    }
    else if ([self bmiIsInRange:17.0 and:18.5]) {
        return MildThinness;
    }
    else if ([self bmiIsInRange:18.5 and:25]) {
        return Normal;
    }
    else if ([self bmiIsInRange:25.0 and:30.0]) {
        return Overweight;
    }
    else if ([self bmiIsInRange:30.0 and:35.0]) {
        return ObeseClassI;
    }
    else if ([self bmiIsInRange:35.0 and:40.0]) {
        return ObeseClassII;
    }
    
    return ObeseClassIII;
    
}

- (BOOL) bmiIsInRange: (double) start and: (double) end {
    if (self.bmiScore.doubleValue >= start && self.bmiScore.doubleValue <= end) {
        return YES;
    }
    
    return NO;
}

- (NSNumber *) bmiScore {
    /*
     To work out your BMI:
     divide your weight in kilograms (kg) by your height in metres (m)
     then divide the answer by your height again to get your BMI
     For example:
     if you weigh 70kg and you're 1.75m tall, divide 70 by 1.75 – the answer is 40
     then divide 40 by 1.75 – the answer is 22.9
     your BMI is 22.9kg/m2
     */
    
    if (!self.weightInKg || !self.heightInCm) {
        return nil;
    }
    
    double heightInMetres = self.heightInCm.doubleValue / 100.0;
    
    double bmi = (self.weightInKg.doubleValue / heightInMetres) / heightInMetres;
    return @(bmi);
}

- (NSString *) bmiCategoryString {
    if (self.bmiCategory == SevereThin) {
        return @"Severe Thinness";
    }
    else if (self.bmiCategory == ModerateThinness) {
        return @"Moderate Thinness";
    }
    else if (self.bmiCategory == MildThinness) {
        return @"Mild Thinness";
    }
    else if (self.bmiCategory == Normal) {
        return @"Normal";
    }
    else if (self.bmiCategory == Overweight) {
        return @"Overweight";
    }
    else if (self.bmiCategory == ObeseClassI) {
        return @"Obese Class I";
    }
    else if (self.bmiCategory == ObeseClassII) {
        return @"Obese Class II";
    }
    
    return @"Obese Class III";
}

- (instancetype)initWithWeightinKG: (NSNumber *) weight heightInCM: (NSNumber *) height {
    self = [super init];
    if (self) {
        _weightInKg = weight;
        _heightInCm = height;
    }
    return self;
}


@end
