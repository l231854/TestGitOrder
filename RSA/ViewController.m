//
//  ViewController.m
//  RSA
//
//  Created by 雷王 on 2019/8/19.
//  Copyright © 2019 WL. All rights reserved.
//
//open ~/.ssh
#import "ViewController.h"
#import "RSA.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSString *publicKey = @"\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI2bvVLVYrb4B0raZgFP60VXY\ncvRmk9q56QiTmEm9HXlSPq1zyhyPQHGti5FokYJMzNcKm0bwL1q6ioJuD4EFI56D\na+70XdRz1CjQPQE3yXrXXVvOsmq9LsdxTFWsVBTehdCmrapKZVVx6PKl7myh0cfX\nQmyveT/eqyZK1gYjvQIDAQAB\n";
    NSString *privateKey = @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAL+UCqy31p46nbKJDjyKUaDW/MsVnYqpeeQqQvOmiSEyU1DOqQK3nDZYS+IH+xlU6NuzFBNWtaTw8snFMlNu2ngpy+hxef6XnDvM4s1r/HR7Mm5797noX7yVgiwzTyHjsv8TQkmecffictWkuBqyuoj/ULHLe9a5QHuFxvC+/Bz1AgMBAAECgYAPMGGYSAsQCH2wRgWG70CBjAoG3/PZpo4vdNpSDwYYR7ErWvcza/NKq714ckGKRJ0hrhUNY3aLWT8mmCfhTYysjwv7uaRBQkf9dpc0nskIxrLGjKcdpRyWkEfzhKx7wkwpf98dBdWJROM9Tp27QCRfxs25BmbDP/oLkFgEjbP9gQJBAO7v2e7AkN8gUdo0Oxhc6GHQljP+r7EDwQhtxcDJKwN6Jm5MSeyYkWtHb0TskqGZP/ppXunu8avuhSeqEIQn4l0CQQDNQmYg+e0aXl2A79eZTl/FQN80+LrIsL2gd1dwWvsTEjrJMUYzZfVsG7kN2/5qntNn9VMSb3MCBeoIAwPQxqt5AkEA5o/8NC8NnMGLOov8Gl5Mv1aQGkxBLQb6Vi/XC1kTcJ+GRhjHnM78RBEChffi5p0C55iWRhaUjdv0EXpBxcTW4QJAF1R5uTvPCFU7eYFJVyKCXjA+bo3q5Q65rviBlsKwkP1ccyvHl+X53DzWbs3XgBTnYISQ2aKTRuKXNCvrjhpWuQJBALa2YhyoQf/ztC9l3kmUCWuTMoiA5OB0vKua2kTZWvx/3DLzILNkeZ2TqTTJ1LwQtpPzh8XfkMvFDmEsoJ6ge80=";
    


    NSString *originString = @"张三";

    NSString *encWithPubKey;
    NSString *decWithPrivKey;
    NSString *encWithPrivKey;
    NSString *decWithPublicKey;
    
    //    // Demo: encrypt with public key
//    encWithPubKey = [RSA encryptString:originString publicKey:publicKey];
//    NSLog(@"Enctypted with public key: %@", encWithPubKey);
//    // Demo: decrypt with private key
//    decWithPrivKey = [RSA decryptString:encWithPubKey privateKey:privateKey];
//    NSLog(@"Decrypted with private key: %@", decWithPrivKey);
    
    // by PHP
//    encWithPubKey = @"CKiZsP8wfKlELNfWNC2G4iLv0RtwmGeHgzHec6aor4HnuOMcYVkxRovNj2r0Iu3ybPxKwiH2EswgBWsi65FOzQJa01uDVcJImU5vLrx1ihJ/PADUVxAMFjVzA3+Clbr2fwyJXW6dbbbymupYpkxRSfF5Gq9KyT+tsAhiSNfU6akgNGh4DENoA2AoKoWhpMEawyIubBSsTdFXtsHK0Ze0Cyde7oI2oh8ePOVHRuce6xYELYzmZY5yhSUoEb4+/44fbVouOCTl66ppUgnR5KjmIvBVEJLBq0SgoZfrGiA3cB08q4hb5EJRW72yPPQNqJxcQTPs8SxXa9js8ZryeSxyrw==";
    
    
 

 
    encWithPrivKey = [RSA encryptString:originString privateKey:publicKey];

    NSLog(@"Enctypted with private key: %@", encWithPrivKey);
    
    // Demo: decrypt with public key
    decWithPublicKey = [RSA decryptString:encWithPrivKey publicKey:privateKey];

    NSLog(@"(PHP enc)Decrypted with public key: %@", decWithPublicKey);
    [self old];
}
//普通字符串转换为十六进制的。
// Base64 2 Data
- (NSData*) base64Decode:(NSString *)string
{
    unsigned long ixtext, lentext;
    unsigned char ch, inbuf[4], outbuf[4];
    short i, ixinbuf;
    Boolean flignore, flendtext = false;
    const unsigned char *tempcstring;
    NSMutableData *theData;
    
    if (string == nil) {
        return [NSData data];
    }
    
    ixtext = 0;
    
    tempcstring = (const unsigned char *)[string UTF8String];
    
    lentext = [string length];
    
    theData = [NSMutableData dataWithCapacity: lentext];
    
    ixinbuf = 0;
    
    while (true) {
        if (ixtext >= lentext){
            break;
        }
        
        ch = tempcstring [ixtext++];
        
        flignore = false;
        
        if ((ch >= 'A') && (ch <= 'Z')) {
            ch = ch - 'A';
        } else if ((ch >= 'a') && (ch <= 'z')) {
            ch = ch - 'a' + 26;
        } else if ((ch >= '0') && (ch <= '9')) {
            ch = ch - '0' + 52;
        } else if (ch == '+') {
            ch = 62;
        } else if (ch == '=') {
            flendtext = true;
        } else if (ch == '/') {
            ch = 63;
        } else {
            flignore = true;
        }
        
        if (!flignore) {
            short ctcharsinbuf = 3;
            Boolean flbreak = false;
            
            if (flendtext) {
                if (ixinbuf == 0) {
                    break;
                }
                
                if ((ixinbuf == 1) || (ixinbuf == 2)) {
                    ctcharsinbuf = 1;
                } else {
                    ctcharsinbuf = 2;
                }
                
                ixinbuf = 3;
                
                flbreak = true;
            }
            
            inbuf [ixinbuf++] = ch;
            
            if (ixinbuf == 4) {
                ixinbuf = 0;
                
                outbuf[0] = (inbuf[0] << 2) | ((inbuf[1] & 0x30) >> 4);
                outbuf[1] = ((inbuf[1] & 0x0F) << 4) | ((inbuf[2] & 0x3C) >> 2);
                outbuf[2] = ((inbuf[2] & 0x03) << 6) | (inbuf[3] & 0x3F);
                
                for (i = 0; i < ctcharsinbuf; i++) {
                    [theData appendBytes: &outbuf[i] length: 1];
                }
            }
            
            if (flbreak) {
                break;
            }
        }
    }
    
    return theData;
    
}
- (NSString *)hexStringFromString:(NSString *)string{
    NSData *myD = [self base64Decode:string];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
        
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        
        if([newHexStr length]==1)
            
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        
        else
            
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
}
-(void)old{
//        NSString *pubkey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI2bvVLVYrb4B0raZgFP60VXY\ncvRmk9q56QiTmEm9HXlSPq1zyhyPQHGti5FokYJMzNcKm0bwL1q6ioJuD4EFI56D\na+70XdRz1CjQPQE3yXrXXVvOsmq9LsdxTFWsVBTehdCmrapKZVVx6PKl7myh0cfX\nQmyveT/eqyZK1gYjvQIDAQAB\n-----END PUBLIC KEY-----";
//        NSString *privkey = @"-----BEGIN PRIVATE KEY-----\nMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMMjZu9UtVitvgHS\ntpmAU/rRVdhy9GaT2rnpCJOYSb0deVI+rXPKHI9Aca2LkWiRgkzM1wqbRvAvWrqK\ngm4PgQUjnoNr7vRd1HPUKNA9ATfJetddW86yar0ux3FMVaxUFN6F0KatqkplVXHo\n8qXubKHRx9dCbK95P96rJkrWBiO9AgMBAAECgYBO1UKEdYg9pxMX0XSLVtiWf3Na\n2jX6Ksk2Sfp5BhDkIcAdhcy09nXLOZGzNqsrv30QYcCOPGTQK5FPwx0mMYVBRAdo\nOLYp7NzxW/File//169O3ZFpkZ7MF0I2oQcNGTpMCUpaY6xMmxqN22INgi8SHp3w\nVU+2bRMLDXEc/MOmAQJBAP+Sv6JdkrY+7WGuQN5O5PjsB15lOGcr4vcfz4vAQ/uy\nEGYZh6IO2Eu0lW6sw2x6uRg0c6hMiFEJcO89qlH/B10CQQDDdtGrzXWVG457vA27\nkpduDpM6BQWTX6wYV9zRlcYYMFHwAQkE0BTvIYde2il6DKGyzokgI6zQyhgtRJ1x\nL6fhAkB9NvvW4/uWeLw7CHHVuVersZBmqjb5LWJU62v3L2rfbT1lmIqAVr+YT9CK\n2fAhPPtkpYYo5d4/vd1sCY1iAQ4tAkEAm2yPrJzjMn2G/ry57rzRzKGqUChOFrGs\nlm7HF6CQtAs4HC+2jC0peDyg97th37rLmPLB9txnPl50ewpkZuwOAQJBAM/eJnFw\nF5QAcL4CYDbfBKocx82VX/pFXng50T7FODiWbbL4UnxICE0UBFInNNiWJxNEb6jL\n5xd0pcy9O2DOeso=\n-----END PRIVATE KEY-----";
//    NSString *pubkey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC8bIM17GoQ9OAjMbXJJuplii+BgRbb8SffWHLs\nejrJ0TkcGFytNWKrcop4QtIW940n8zsFf/HfHVfxuooljBPT+D8ImGxoXSsFJzlqDouryIL75bwf\nF01DX0u85+C5utOe5/AuR212S3Bs7P8Y+SpbLZKXUFAhVzBaquaLlaXcrwIDAQAB\n-----END PUBLIC KEY-----";
    NSString *pubkey = @"-----BEGIN PUBLIC KEY-----MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCZ0uqlBXA/Z7soq8zVucteajgiXVMdLQSbP+L0lLPR8OAOobykGqREYwsAVL1yvtLj4Royq9U/L7f7ljD9Q77Cw7TFPLBdZV/q1otlNejxSsKhW9q1+NTSpn6OgTFZ9HSrCPhOwX6QdAnLdUKtCTdqvIYxvDC/HtB65C6P+0z6PwIDAQAB-----END PUBLIC KEY-----";
    NSString *privkey = @"-----BEGIN PRIVATE KEY-----\nMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMMjZu9UtVitvgHS\ntpmAU/rRVdhy9GaT2rnpCJOYSb0deVI+rXPKHI9Aca2LkWiRgkzM1wqbRvAvWrqK\ngm4PgQUjnoNr7vRd1HPUKNA9ATfJetddW86yar0ux3FMVaxUFN6F0KatqkplVXHo\n8qXubKHRx9dCbK95P96rJkrWBiO9AgMBAAECgYBO1UKEdYg9pxMX0XSLVtiWf3Na\n2jX6Ksk2Sfp5BhDkIcAdhcy09nXLOZGzNqsrv30QYcCOPGTQK5FPwx0mMYVBRAdo\nOLYp7NzxW/File//169O3ZFpkZ7MF0I2oQcNGTpMCUpaY6xMmxqN22INgi8SHp3w\nVU+2bRMLDXEc/MOmAQJBAP+Sv6JdkrY+7WGuQN5O5PjsB15lOGcr4vcfz4vAQ/uy\nEGYZh6IO2Eu0lW6sw2x6uRg0c6hMiFEJcO89qlH/B10CQQDDdtGrzXWVG457vA27\nkpduDpM6BQWTX6wYV9zRlcYYMFHwAQkE0BTvIYde2il6DKGyzokgI6zQyhgtRJ1x\nL6fhAkB9NvvW4/uWeLw7CHHVuVersZBmqjb5LWJU62v3L2rfbT1lmIqAVr+YT9CK\n2fAhPPtkpYYo5d4/vd1sCY1iAQ4tAkEAm2yPrJzjMn2G/ry57rzRzKGqUChOFrGs\nlm7HF6CQtAs4HC+2jC0peDyg97th37rLmPLB9txnPl50ewpkZuwOAQJBAM/eJnFw\nF5QAcL4CYDbfBKocx82VX/pFXng50T7FODiWbbL4UnxICE0UBFInNNiWJxNEb6jL\n5xd0pcy9O2DOeso=\n-----END PRIVATE KEY-----";
    
    NSString *originString = @"张三";
//    for(int i=0; i<4; i++){
//        originString = [originString stringByAppendingFormat:@" %@", originString];
//    }
    NSString *encWithPubKey;
    NSString *decWithPrivKey;
    NSString *encWithPrivKey;
    NSString *decWithPublicKey;
    
    NSLog(@"Original string(%d): %@", (int)originString.length, originString);
    
    // Demo: encrypt with public key
    encWithPubKey = [RSA encryptString:originString publicKey:pubkey];
    NSLog(@"Enctypted with public key: %@", encWithPubKey);
//    encWithPubKey=@"d3V5GPnuxAOuYcoqc4i4us8WCJDncZKEn5Np0eEPIjGHm9IodU204xDESnUzMIcYUtu/FW09wOo63HuQ3ggWTZqdpGcCMz7fg8rbkmc3ZV1eVu5FHD/xJ0y1uvlSnH7pfsYAzv0ddHd6ZjAqUvz9erwEERTGDJGY4+HHJRdrSxI=";
    NSString *strencWithPubKey = [self hexStringFromString:encWithPubKey];
    // Demo: decrypt with private key
    decWithPrivKey = [RSA decryptString:encWithPubKey privateKey:privkey];
    NSLog(@"Decrypted with private key: %@", decWithPrivKey);
    
    // by PHP
//    encWithPubKey = @"CKiZsP8wfKlELNfWNC2G4iLv0RtwmGeHgzHec6aor4HnuOMcYVkxRovNj2r0Iu3ybPxKwiH2EswgBWsi65FOzQJa01uDVcJImU5vLrx1ihJ/PADUVxAMFjVzA3+Clbr2fwyJXW6dbbbymupYpkxRSfF5Gq9KyT+tsAhiSNfU6akgNGh4DENoA2AoKoWhpMEawyIubBSsTdFXtsHK0Ze0Cyde7oI2oh8ePOVHRuce6xYELYzmZY5yhSUoEb4+/44fbVouOCTl66ppUgnR5KjmIvBVEJLBq0SgoZfrGiA3cB08q4hb5EJRW72yPPQNqJxcQTPs8SxXa9js8ZryeSxyrw==";
//    decWithPrivKey = [RSA decryptString:encWithPubKey privateKey:privkey];
//    NSLog(@"(PHP enc)Decrypted with private key: %@", decWithPrivKey);
//
//    // Demo: encrypt with private key
//    encWithPrivKey = [RSA encryptString:originString privateKey:privkey];
//    NSLog(@"Enctypted with private key: %@", encWithPrivKey);
//
//    // Demo: decrypt with public key
//    decWithPublicKey = [RSA decryptString:encWithPrivKey publicKey:pubkey];
//    NSLog(@"(PHP enc)Decrypted with public key: %@", decWithPublicKey);
}


@end
