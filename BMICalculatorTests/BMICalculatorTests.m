//
//  BMICalculatorTests.m
//  BMICalculatorTests
//
//  Created by Richard Stockdale on 11/07/2017.
//  Copyright © 2017 Junction Seven. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JSDBMI.h"

@interface BMICalculatorTests : XCTestCase

@property (nonatomic, strong) JSDBMI *bmiCalc;
@property (nonatomic, strong) NSNumberFormatter *nf;

@end

@implementation BMICalculatorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.bmiCalc = [[JSDBMI alloc] init];
    self.nf = [[NSNumberFormatter alloc] init];
    [self.nf setMaximumFractionDigits:1];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testWeight1 {
    self.bmiCalc.weightInKg = @(30);
    self.bmiCalc.heightInCm = @(150);
    
    NSString *catagoryString = self.bmiCalc.bmiCategoryString;
    NSString *bmi1DP = [self.nf stringFromNumber:self.bmiCalc.bmiScore];
    
    NSAssert([bmi1DP isEqualToString: @"13.3"], @"Score Incorrect");
    NSAssert([catagoryString isEqualToString:@"Severe Thinness"], @"Catagory Incorrect");
}

- (void)testWeight2 {
    self.bmiCalc.weightInKg = @(100);
    self.bmiCalc.heightInCm = @(180);
    
    NSString *catagoryString = self.bmiCalc.bmiCategoryString;
    NSString *bmi1DP = [self.nf stringFromNumber:self.bmiCalc.bmiScore];
    
    NSAssert([bmi1DP isEqualToString: @"30.9"], @"Score Incorrect");
    NSAssert([catagoryString isEqualToString:@"Obese Class I"], @"Catagory Incorrect");
}

@end
