//
//  Note.m
//  objc-test
//
//  Created by Artur Hakobyan on 6/7/20.
//  Copyright © 2020 Artur Hakobyan. All rights reserved.
//

#import "Note.h"

@interface Note ()

@property (nonatomic, readwrite) NSString *title;
@property (nonatomic, readwrite) NSString *subTitle;

@end

@implementation Note

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (instancetype)initWithTitle:(NSString *)title andSubTitle:(NSString *)subTitle {
    self = [super init];
    if (self) {
        self.title = title;
        self.subTitle = subTitle;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.title = [coder decodeObjectForKey:@"title"];
        self.subTitle = [coder decodeObjectForKey:@"subTitle"];;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.subTitle forKey:@"subTitle"];
}
@end
