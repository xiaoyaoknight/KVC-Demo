//
//  ZLPerson.m
//  KVO-Demo
//
//  Created by 王泽龙 on 2019/4/28.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "ZLPerson.h"

@implementation ZLPerson

#pragma mark 查看valueForkey的查找顺序
//- (int)getAge {
//    return 11;
//}
//
//- (int)age {
//    return 12;
//}
//
//- (int)isAage {
//    return 13;
//}
//
//- (int)_age {
//    return 14;
//}

#pragma mark 查看setValueForkey的查找顺序
//- (void)setAge:(int)age {
//    _age = age;
//    NSLog(@"setAge: -%d", age);
//}
//
//- (void)_setAge:(int)age {
//    _age = age;
//    NSLog(@"_setAge: -%d", age);
//}

/**
 能不能直接访问成员变量
 */
//+ (BOOL)accessInstanceVariablesDirectly {
//    return YES;
//}

#pragma mark kvo调用方法
//- (void)willChangeValueForKey:(NSString *)key{
//    [super willChangeValueForKey:key];
//    NSLog(@"willChangeValueForKey");
//}
//
/**
 总结：didChangeValueForKey:内部会调用observer的observeValueForKeyPath:ofObject:change:context:方法
 */
//- (void)didChangeValueForKey:(NSString *)key {
//    NSLog(@"didChangeValueForKey - begin");
//    [super didChangeValueForKey:key];
//    NSLog(@"didChangeValueForKey - end");
//}
@end
