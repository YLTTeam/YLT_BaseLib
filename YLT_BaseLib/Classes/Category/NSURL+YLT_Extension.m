//
//  NSURL+YLT_Extension.m
//  YLT_BaseLib
//
//  Created by Alex on 2021/7/6.
//

#import "NSURL+YLT_Extension.h"
#import "NSObject+YLT_Extension.h"

@implementation NSURL (YLT_Extension)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self ylt_swizzleClassMethod:@selector(URLWithString:) withMethod:@selector(ylt_URLWithString:)];
        [self ylt_swizzleClassMethod:@selector(fileURLWithPath:) withMethod:@selector(ylt_fileURLWithPath:)];
    });
}

+ (NSURL *)ylt_URLWithString:(NSString *)urlString {
    NSString *charactersToEscape = @"?!@#$^&%*+,:;='\"`<>()[]{}/\\| ";
    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
    NSString *encodeString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    return [self ylt_URLWithString:encodeString];
}

+ (NSURL *)ylt_fileURLWithPath:(NSString *)urlString {
    NSString *charactersToEscape = @"?!@#$^&%*+,:;='\"`<>()[]{}/\\| ";
    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
    NSString *encodeString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    return [self ylt_fileURLWithPath:encodeString];
}

@end
