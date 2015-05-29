//
//  NSArray+Functional.h
//  Functional
//
//  Created by Denys Kotelovych on 5/7/15.
//  Copyright (c) 2015 D. K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Functional)

- (NSArray *)map:(id (^)(id))block;
- (NSArray *)filter:(BOOL (^)(id))block;
- (NSArray *)sort:(NSComparisonResult (^)(id, id))block;
- (NSArray *)unique;
- (NSArray *)flatten;
- (NSArray *)merge:(NSArray *)array;
- (NSDictionary *)splitBy:(id <NSCopying> (^)(id))block;
- (void)each:(void (^)(id))block;
- (BOOL)any:(BOOL(^)(id))block;

@end
