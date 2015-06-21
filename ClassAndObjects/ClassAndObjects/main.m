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


@property  (nonatomic) int balance;
@end

@implementation BankAccount

- (void) showBalance{
    
    NSString *description = [NSString stringWithFormat:@"%d", self.balance];
    NSLog(@"%@",description);
}

//- (void) withdraw:(int)money{
//    int balance = self.balance;
//    balance = balance - money;
//
//    NSLog(@"You withdrew, you have: $%d left in your account.", balance);
//}
//-(void) deposit:(int)money{
//    int balance = self.balance;
//    balance = balance + money;
//
//    NSLog(@"You deposited, you have: $%d left in your account.", balance);
//}

@end

@interface Patron : NSObject

- (void) showBalance;
- (void) getMoney:(int)money;
- (void) putMoney:(int)money;
- (void) showPocket;

@property (nonatomic) BankAccount * account;
@property (nonatomic) int pocket;
@property (nonatomic) NSString *name;



@end

@implementation Patron
- (void) showPocket{
    NSString *pocket = [NSString stringWithFormat:@"$%d is your current pocket change", self.pocket];
    NSLog(@"%@",pocket);
}

- (void) putMoney:(int)money {
    
    
    if(self.pocket < money){
        NSLog(@"You don't have enough money in your pocket");
        exit(0);
    }

    
    self.pocket -= money;
    
    self.account.balance += money;
    
    NSLog(@"You deposited $%d into your account, you now have $%d in your pocket",self.account.balance,self.pocket);
}

- (void) getMoney:(int)money {
    
    //Prevent a patron from performing an overwithdrawl
    
    if(self.account.balance < money){
        NSLog(@"You don't have enough money");
        exit(0);
    }
    else{
        self.pocket += money;
        self.account.balance -=money;
    }
    
    NSLog(@"You withdrew $%d from your account, you now have $%d in your pocket",money,self.pocket);
}

- (void) showBalance{
    NSString *balance = [NSString stringWithFormat:@"$%d is your current account balance", self.account.balance];
    NSLog(@"%@",balance);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BankAccount *b = [[BankAccount alloc]init];
        b.balance=0;
        Patron * p = [[Patron alloc]init];
        
        p.account = b;
        p.name = @"Charles";
        p.pocket = 500;
        
        [p showPocket];
        
        [p putMoney: 500];
        
//        NSLog(@"\n");
//        
//        [p getMoney:20];

        
       // [p showBalance];
        
        
        
        
        
    }
    return 0;
}