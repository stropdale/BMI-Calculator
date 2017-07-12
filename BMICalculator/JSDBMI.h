//
//  JSDBMI.h
//  BMICalculator
//
//  Created by Richard Stockdale on 11/07/2017.
//  Copyright © 2017 Junction Seven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSDBMI : NSObject

typedef NS_ENUM(NSInteger, BMICategory) {
    SevereThin,
    ModerateThinness,
    MildThinness,
    Normal,
    Overweight,
    ObeseClassI,
    ObeseClassII,
    ObeseClassIII
};

//====================================================
// GETTER SETTERS
//====================================================

@property (nonatomic, strong) NSNumber *weightInKg;
@property (nonatomic, strong) NSNumber *heightInCm;

//====================================================
// CALCULATED VALUES
//====================================================

@property (nonatomic, readonly) NSNumber *bmiScore;
@property (nonatomic, readonly) BMICategory bmiCategory;
@property (nonatomic, readonly) NSString *bmiCategoryString;

//====================================================
// INIT METHODS
//====================================================

/**
 Convenience init

 @param weight Weight in KG
 @param height Height in CM
 @return Instance of the object
 */
- (instancetype)initWithWeightinKG: (NSNumber *) weight heightInCM: (NSNumber *) height;

@end
