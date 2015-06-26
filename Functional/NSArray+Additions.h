// 
// NSArray+Additions.h
// Functional
//
// Created by Denys Kotelovych on 6/26/15.
// Copyright (c) 2015 D. K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Additions)

- (NSArray *)sort:(NSComparisonResult (^)(id, id))f;
- (NSArray *)unique;
- (NSArray *)merge:(NSArray *)array;
- (NSDictionary *)splitBy:(id <NSCopying> (^)(id))f;
- (void)each:(void (^)(id))f;
- (BOOL)any:(BOOL(^)(id))f;
- (id)first:(BOOL(^)(id))f;

@end
