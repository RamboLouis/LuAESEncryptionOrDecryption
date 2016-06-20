//
//  ViewController.m
//  LuAESEncryptionOrDecryptionDemo
//
//  Created by 路政浩 on 16/6/20.
//  Copyright © 2016年 RamboLu. All rights reserved.
//

#import "ViewController.h"
#import "RNEncryptor.h"
#import "RNDecryptor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AESEncryptionOrDecryption];
}

- (void)AESEncryptionOrDecryption{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"superman.mp4" ofType:nil];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    /** 1. Encryption before */
    //NSData *data = [@"Data" dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    
    NSString *password = @"123456";
    
    /** 2. Encryption after */
    NSData *encryptedData = [RNEncryptor encryptData:data
                                        withSettings:kRNCryptorAES256Settings
                                            password:password
                                               error:&error];
    
    
    /** 3. Encryption to Sandbox */
    NSString *homepath =NSHomeDirectory();
    path = [homepath stringByAppendingPathComponent:@"xxxxx.mp4"];
    
    [encryptedData writeToFile:path atomically:YES];
    NSLog(@"%@",NSHomeDirectory());
//    /** 3. Decryption */
//    NSData *decryptedData = [RNDecryptor decryptData:encryptedData
//                                        withPassword:password
//                                               error:&error];
//    
//    // Decryption desktop
//    [decryptedData writeToFile:@"/Desktop/ooooo.mp4" atomically:YES];
//    
//



}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
