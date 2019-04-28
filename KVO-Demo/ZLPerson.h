//
//  ZLPerson.h
//  KVO-Demo
//
//  Created by 王泽龙 on 2019/4/28.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLDog.h"

@interface ZLPerson : NSObject {
    
    @public
    int _age;
    int _isAge;
    int age;
    int isAge;
}

@property (nonatomic, strong) ZLDog *dog;
@end

