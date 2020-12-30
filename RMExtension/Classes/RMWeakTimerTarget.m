//
//  RMWeakTimerTarget.m
//  RMExtension
//
//  Created by 张斌斌 on 2020/12/30.
//

#import "RMWeakTimerTarget.h"

@implementation RMWeakTimerTarget

+ (NSTimer*)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                    target:(id)aTarget
                                  selector:(SEL)aSelector
                                  userInfo:(id)userInfo
                                   repeats:(BOOL)yesOrNo{
    RMWeakTimerTarget *timerTarget = [[RMWeakTimerTarget alloc]init];
    timerTarget.target = aTarget;
    timerTarget.selector = aSelector;
    timerTarget.timer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                         target:timerTarget
                                                       selector:@selector(fire:)
                                                       userInfo:userInfo
                                                        repeats:yesOrNo];
    return timerTarget.timer;
}


- (void)fire:(NSTimer*)timer{
    if (self.target) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.target performSelector:self.selector withObject:timer.userInfo];
#pragma clang diagnostic pop

    }else{
        [self.timer invalidate];
    }
}


- (void)dealloc{
    NSLog(@"%@-%s",[self class],__func__);
}
@end
