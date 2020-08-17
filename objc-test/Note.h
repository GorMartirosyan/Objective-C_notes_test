//
//  Note.h
//  objc-test
//
//  Created by Gor on 6/7/20.
//  Copyright © 2020 user1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject <NSSecureCoding>

- (instancetype)initWithTitle:(NSString *)title andSubTitle:(NSString *)subTitle;

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *subTitle;
@property (class, readonly) BOOL supportsSecureCoding;
@end
