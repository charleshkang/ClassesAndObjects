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
- (void) withdraw:(int)money;
- (void) deposit:(int)money;

@property  (nonatomic) int balance;
@property (nonatomic) int accountNumber;

@end

@implementation BankAccount

- (void) showBalance{
    NSString *description = [NSString stringWithFormat:@"%d",self.balance];
    NSLog(@"%@",description);
}

- (void) withdraw:(int)money{
    int balance = self.balance;
    balance = balance - money;
    
    NSLog(@"You now have: $%d left in your account.",balance);
}


@end

@interface Patron : NSObject

- (void) showBalance;
- (void) getMoney:(int)money;
- (void) putMoney:(int)money;

@property (nonatomic) int accountNumber;
@property (nonatomic) int pocket;
@property (nonatomic) NSString *name;


@end

@implementation Patron

- (void) putMoney:(int)money{
    
    
    BankAccount *b = [[BankAccount alloc] init];
    
    b.accountNumber = 2017;
    
    b.balance = 5000000;
    
    [b deposit:money];
    
    
    
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
