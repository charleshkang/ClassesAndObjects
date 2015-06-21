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


@property (nonatomic) int balance;
@property (nonatomic) NSString * bankName;
@end

@implementation BankAccount

- (void) showBalance{
    
    NSString *description = [NSString stringWithFormat:@"%d", self.balance];
    NSLog(@"%@",description);
}



@end

@interface Patron : NSObject

- (void) showBalance;
- (void) getMoney:(int)money:(BankAccount*)bankAccount;
- (void) putMoney:(int)money :(BankAccount*)bankAccount;
- (void) showPocket;

@property (nonatomic) BankAccount * account;
@property (nonatomic) int pocket;
@property (nonatomic) NSString *name;
@property (nonatomic) NSMutableArray * bankArray;


@end

@implementation Patron
-(NSMutableArray *) bankArray{
    if (!_bankArray) {
        _bankArray = [[NSMutableArray alloc]init];
    }
    return _bankArray;
}
- (void) showPocket{
    NSString *pocket = [NSString stringWithFormat:@"%@, $%d is your current pocket change",self.name, self.pocket];
    NSLog(@"%@",pocket);
}

- (void) putMoney:(int)money inAccount:(BankAccount*)bankAccount {
    
    if (![self.bankArray containsObject:bankAccount]) {
        NSLog(@"%@, you don't have an account with %@",self.name,bankAccount.bankName);
        return;
    }
    
    if(self.pocket < money){
        NSLog(@"%@ you don't have enough money in your pocket",self.name);
        return;
    }
    
    self.pocket -= money;
    
    bankAccount.balance += money;
    
    NSLog(@"%@ you deposited $%d into your %@ account, you now have $%d in your pocket",self.name,money,bankAccount.bankName,self.pocket);
}

- (void) getMoney:(int)money inAccount:(BankAccount*)bankAccount {
    
    if (![self.bankArray containsObject:bankAccount]) {
        NSLog(@"%@, you don't have an account with %@",self.name,bankAccount.bankName);
        return;
    }
    
    if(bankAccount.balance < money){
        NSLog(@"%@ you don't have enough money in your account",self.name);
        exit(0);
    }
    else{
        self.pocket += money;
        bankAccount.balance -=money;
    }
    
    NSLog(@"%@ you withdrew $%d from your %@ account, you now have $%d in your pocket",self.name,money,bankAccount.bankName,self.pocket);
    
}
- (void) showBalance{
    NSString *balance = [NSString stringWithFormat:@"$%d is your current account balance", self.account.balance];
    NSLog(@"%@",balance);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        //Declare Banks
        BankAccount *chase = [[BankAccount alloc]init];
        // chase.balance=500;
        chase.bankName = @"Chase";
        
        BankAccount * capitalOne = [[BankAccount alloc]init];
        // capitalOne.balance = 300;
        capitalOne.bankName = @"Capital One";
        
        
        BankAccount * bankOfAmerica = [[BankAccount alloc]init];
        // bankOfAmerica.balance = 3000;
        bankOfAmerica.bankName = @"Bank Of America";
        
        
        BankAccount * mAndT = [[BankAccount alloc]init];
        // mAndT.balance=3000;
        mAndT.bankName = @"M&T";
        
        Patron * charles = [[Patron alloc] init];
        Patron * mesfin = [[Patron alloc] init];
        
        charles.name = @"Charles";
        mesfin.name = @"Mesfin";
        
        //Pocket change
        mesfin.pocket = 1500;
        charles.pocket = 1500;
        
        //Charles' banks
        [charles.bankArray addObject:chase];
        [charles.bankArray addObject:capitalOne];
        [charles.bankArray addObject:bankOfAmerica];
        
        //mesfin's banks
        [mesfin.bankArray addObject:bankOfAmerica];
        [mesfin.bankArray addObject:chase];
        [mesfin.bankArray addObject:mAndT];
        
        //put money in a bank you don't an account with
        [mesfin putMoney:500 inAccount:capitalOne];
        [charles putMoney:500 inAccount:mAndT];
        
        //put money into a bank you have an account with
        [charles putMoney:400 inAccount:bankOfAmerica];
        [mesfin putMoney:400 inAccount:chase];
        
        //Get money from a bank you have an account with
        [mesfin getMoney:300 inAccount:chase];
        [charles getMoney:400 inAccount:bankOfAmerica];
        
        
        //Get money from a bank you don't have an account with
        //  [charles getMoney:4000 inAccount:mAndT];
        //  [mesfin getMoney:333 inAccount:capitalOne];
        
    }
    return 0;
}