//
//  NSArray+Functional.m
//  Functional
//
//  Created by Denys Kotelovych on 5/7/15.
//  Copyright (c) 2015 D. K. All rights reserved.
//

#import "NSArray+Functional.h"

@implementation NSArray (Functional)

- (NSArray *)map:(id (^)(id))block {
  NSParameterAssert(block != nil);
  NSMutableArray *result = [NSMutableArray new];
  for (id object in self) {
    [result addObject:block(object) ?: [NSNull null]];
  }
  return result;
}

- (NSArray *)filter:(BOOL (^)(id))block {
  NSParameterAssert(block != nil);
  NSMutableArray *result = [NSMutableArray new];
  for (id object in self) {
    if (block(object)) {
      [result addObject:object];
    }
  }
  return result;
}

- (NSArray *)sort:(NSComparisonResult (^)(id, id))block {
  NSParameterAssert(block != nil);
  return [self sortedArrayUsingComparator:block];
}

- (NSArray *)unique {
  return [[NSSet setWithArray:self] allObjects];
}

- (NSArray *)flatten {
  NSMutableArray *result = [NSMutableArray new];
  [self each:^(NSArray *array) {
    [result addObjectsFromArray:array];
  }];
  return result;
}

- (NSDictionary *)splitBy:(id <NSCopying> (^)(id))block {
  NSMutableDictionary *result = [NSMutableDictionary new];
  for (id object in self) {
    id <NSCopying> key = block(object);
    NSMutableSet *mutableSet = result[key];
    if (!mutableSet) {
      mutableSet = [NSMutableSet new];
    }
    [mutableSet addObject:object];
    result[key] = mutableSet;
  }
  return result;
}

- (void)each:(void (^)(id))block {
  NSParameterAssert(block != nil);
  for (id object in self) {
    block(object);
  }
}

- (BOOL)any:(BOOL(^)(id))block {
  NSParameterAssert(block != nil);
  for (id object in self) {
    if (block(object)) {
      return YES;
    }
  }
  return NO;
}

@end
