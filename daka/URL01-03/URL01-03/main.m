//
//  main.m
//  URL01-03
//
//  Created by Mr Chan  on 2021/3/12.
//

#import <Foundation/Foundation.h>
void replaceSpace(NSString *s,int length);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        replaceSpace(@"Mr John Smith    ", 13);
        replaceSpace(@"          ", 5);
        NSLog(@"Hello, World!");
    }
    return 0;
}

void replaceSpace(NSString *s,int length)
{
    s = [s substringWithRange:NSMakeRange(0, length)];
//    const char *c1 = [s cStringUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"before s:%@",s);
//    int i  = length - 1;
//    do{
//        if (c1[i] == ' ') {
//            s = [s stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"%20"];
//        }
//        i--;
//    }while (i>=0);
    s = [s stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSLog(@"after s:%@",s);
}


