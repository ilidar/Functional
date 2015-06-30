// 
// NSArray+Additions.m
// Functional
//
// Created by Denys Kotelovych on 6/26/15.
// Copyright (c) 2015 D. K. All rights reserved.
//

#import <Functional/Functional.h>

@implementation NSArray (Additions)

- (NSArray *)sort:(NSComparisonResult (^)(id, id))f {
  NSParameterAssert(f != nil);
  return [self sortedArrayUsingComparator:f];
}

- (NSArray *)unique {
  return [[NSSet setWithArray:self] allObjects];
}

- (NSArray *)merge:(NSArray *)array {
  return [[self arrayByAddingObjectsFromArray:array] unique];
}

- (NSDictionary *)splitBy:(id <NSCopying> (^)(id))f {
  NSMutableDictionary *result = [NSMutableDictionary new];
  for (id object in self) {
    id <NSCopying> key = f(object);
    NSMutableSet *mutableSet = result[key];
    if (!mutableSet) {
      mutableSet = [NSMutableSet new];
    }
    [mutableSet addObject:object];
    result[key] = mutableSet;
  }
  return result;
}

- (void)each:(void (^)(id))f {
  NSParameterAssert(f != nil);
  for (id object in self) {
    f(object);
  }
}

- (BOOL)any:(BOOL(^)(id))f {
  NSParameterAssert(f != nil);
  return [[self filter:f] count] > 0;
}

- (id)first:(BOOL(^)(id))f {
  NSParameterAssert(f != nil);
  return [[self filter:f] firstObject];
}

@end
