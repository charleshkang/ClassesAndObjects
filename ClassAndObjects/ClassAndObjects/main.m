//
//  main.m
//  ClassAndObjects
//
//  Created by Charles Kang on 6/21/15.
//  Copyright (c) 2015 Charles Kang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccount : NSObject

- (void) showBalance;
- (void) getMoney;
- (void) putMoney;

@property  (nonatomic) int balance;

@end

@implementation BankAccount

@end

@interface Patron : NSObject

- (void) showBalance;
- (void) getMoney;
- (void) putMoney;

@property (nonatomic) int account;
@property (nonatomic) int pocket;
@property (nonatomic) NSString *name;


@end

@implementation Patron


@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
