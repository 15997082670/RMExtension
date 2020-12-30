//
//  RMWeakTimerTarget.h
//  RMExtension
//
//  Created by 张斌斌 on 2020/12/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RMWeakTimerTarget : NSObject

@property (nonatomic,weak)id target;

@property (nonatomic,assign)SEL selector;

@property (nonatomic,strong)NSTimer * timer;

+ (NSTimer*)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                    target:(id)aTarget
                                  selector:(SEL)aSelector
                                  userInfo:(id)userInfo
                                   repeats:(BOOL)yesOrNo;
@end

NS_ASSUME_NONNULL_END
