//
//  ViewController.m
//  KVO-Demo
//
//  Created by 王泽龙 on 2019/4/28.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "ViewController.h"
#import "ZLPerson.h"

@interface ViewController ()
@property (nonatomic, strong) ZLPerson *person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self demo1];
    
    
    [self demo2];
    
    // 模拟valueForKey查找顺序
//    [self demo3];
}


/**
 kvc常见方法
 - (void)setValue:(id)value forKey:(NSString *)key;
 - (void)setValue:(id)value forKeyPath:(NSString *)keyPath;
 
 - (id)valueForKey:(NSString *)key;
 - (id)valueForKeyPath:(NSString *)keyPath;
 */
- (void)demo1 {
    
    self.person = [[ZLPerson alloc] init];
    
    // 通过kvc修改属性
    [self.person setValue:@10 forKey:@"age"];
    self.person.dog = [[ZLDog alloc] init];
    [self.person setValue:@100 forKeyPath:@"dog.height"];
    NSLog(@"----------");
    
    /*
     person     ZLPerson *    0x600002aa4fa0    0x0000600002aa4fa0
     _age       int    10
     _isAge     int    0
     age        int    0
     isAge      int    0
     _dog       ZLDog *    0x6000028efc90    0x00006000028efc90
     _height    int    100
     */
}


/**
 通过kvc修改成员变量值，会触发kvo
 本质：还是会调用
 - (void)willChangeValueForKey:(NSString *)key
         修改值
 - (void)didChangeValueForKey:(NSString *)key
 */
- (void)demo2 {
    
    self.person = [[ZLPerson alloc] init];
    [self.person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
//    [self.person setValue:@70 forKey:@"age"];
    [self.person setValue:@80 forKeyPath:@"age"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"监听到了%@的%@属性发生了改变%@",object,keyPath,change);
}


/**
 模拟valueForKey查找顺序
 */
- (void)demo3 {
    self.person = [[ZLPerson alloc] init];
    self.person->_age = 10;
//    self.person->_isAge = 11;
//    self.person->age = 13;
//    self.person->isAge = 14; 
    
    NSLog(@"%@", [self.person valueForKey:@"age"]);
}


- (void)dealloc {
    ///> 使用结束后记得移除
    [self.person removeObserver:self forKeyPath:@"age"];
}
@end
