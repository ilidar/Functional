//
//  NSArray+Functional.h
//  Functional
//
//  Created by Denys Kotelovych on 5/7/15.
//  Copyright (c) 2015 D. K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Functional)

- (id)reduce:(id(^)(id, id))f from:(id)from;
- (NSArray *)map:(id (^)(id))f;
- (NSArray *)filter:(BOOL (^)(id))f;
- (NSArray *)flatten;

@end
