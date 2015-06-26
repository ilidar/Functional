//
//  NSArray+FunctionalSpec.m
//  Functional
//
//  Created by Denys Kotelovych on 6/26/15.
//  Copyright 2015 D. K. All rights reserved.
//

#import <Kiwi/Kiwi.h>

#import "NSArray+Functional.h"

SPEC_BEGIN(NSArray_FunctionalSpec)
  describe(@"NSArray+Functional", ^{
    context(@"Everything", ^{
      __block NSArray *numbers = nil;

      beforeEach(^{
        NSMutableArray *all = [NSMutableArray new];
        for (int i = 0; i < 100; ++i) {
          [all addObject:@(i)];
        }
        numbers = [all copy];
      });

      it(@"should filter odd", ^{
        NSArray *filtered = [numbers
          filter:^BOOL(NSNumber *x) {
            return [x integerValue] % 2 == 0;
          }];
        for (NSNumber *number in filtered) {
          [[theValue(number.integerValue % 2) should] equal:theValue(0)];
        }
      });

      it(@"should be doubled", ^{
        NSArray *doubled = [numbers
          map:^id(NSNumber *number) {
            return @(2 * number.integerValue);
          }];
        [[theValue(doubled.count) should] equal:theValue(numbers.count)];
        for (int i = 0; i < doubled.count; ++i) {
          [[doubled[i] should] equal:theValue(2 * [numbers[i] integerValue])];
        }
      });
    });
  });
SPEC_END
