//
//  NSArray+Functional.m
//  Functional
//
//  Created by Denys Kotelovych on 5/7/15.
//  Copyright (c) 2015 D. K. All rights reserved.
//

#import "NSArray+Functional.h"

@implementation NSArray (Functional)

- (id)reduce:(id(^)(id, id))f from:(id)from {
  NSParameterAssert(f != nil && from != nil);
  id result = from;
  for (id x in self) {
    result = f(result, x);
  }
  return result;
}

- (NSArray *)map:(id (^)(id))f {
  NSParameterAssert(f != nil);
  return [self
    reduce:^id(NSArray *xs, id x) {
      return [xs arrayByAddingObject:f(x)];
    }
    from:[NSArray new]];
}

- (NSArray *)filter:(BOOL (^)(id))f {
  NSParameterAssert(f != nil);
  return [self
    reduce:^id(NSArray *xs, id x) {
      return f(x) ? [xs arrayByAddingObject:x] : xs;
    }
    from:[NSArray new]];
}

- (NSArray *)flatten {
  return [self
    reduce:^id(NSArray *xss, NSArray *xs) {
      return [xss arrayByAddingObjectsFromArray:xs];
    }
    from:[NSArray new]];
}

@end
