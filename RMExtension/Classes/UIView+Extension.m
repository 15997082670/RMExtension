//
//  UIView+Extension.m
//  RMExtension
//
//  Created by 张斌斌 on 2020/12/29.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
- (void)setWidth:(CGFloat)width{
    CGRect temp = self.frame;
    self.frame = CGRectMake(temp.origin.x, temp.origin.y, width, temp.size.height);
}

- (CGFloat)width{
    return self.frame.size.width;
}


- (void)setHeight:(CGFloat)height{
    CGRect temp = self.frame;
    self.frame = CGRectMake(temp.origin.x, temp.origin.y, temp.size.width, height);
}

- (CGFloat)height{
    return self.frame.size.height;
}
@end
