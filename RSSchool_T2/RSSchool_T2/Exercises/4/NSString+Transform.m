
#import "NSString+Transform.h"

@implementation NSString (Transform)
-(NSString*)transform {
    NSCharacterSet *vovel = [NSCharacterSet characterSetWithCharactersInString:@"AEIOUYaeiouy"];
    NSCharacterSet *conSet =[NSCharacterSet characterSetWithCharactersInString:@"BCDFGHJKLMNPQRSTVWXZbcdfghjklmnpqrstvwxz"];
    NSString *capitalized = [self uppercaseString];
    NSCharacterSet *letterSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ"];
    NSCharacterSet *strSet = [NSCharacterSet characterSetWithCharactersInString:capitalized];
    NSMutableArray *wordArray =[[self componentsSeparatedByString:@" "] mutableCopy];
    NSMutableArray *resultArray = [NSMutableArray new];
    NSRange range = NSMakeRange(0, 1);
    if ([strSet isSupersetOfSet:letterSet]) {
        for (NSString *word in wordArray) {
            if ([word isEqualToString:@""]) continue;
            NSMutableString *tempString = [NSMutableString stringWithString:word];
            int counter=0;
            for (int i=0; i<[word length]; i++) {
                if ([vovel characterIsMember:[tempString characterAtIndex:i]]) {
                    range.location = i;
                    NSString *curChar = [word substringWithRange:range];
                    [tempString replaceCharactersInRange:range withString:[curChar uppercaseString]];
                    counter++;
                }
            }
            NSString *counterChar = [NSString stringWithFormat:@"%d" , counter];
            [tempString insertString:counterChar atIndex:0];
            [resultArray addObject:tempString];
        }
        
    }
    else
    {
        for (NSString *word in wordArray) {
            if ([word isEqualToString:@""]) continue;
            NSMutableString *tempString = [NSMutableString stringWithString:word];
            int counter=0;
            for (int i=0; i<[word length]; i++) {
                if ([conSet characterIsMember:[tempString characterAtIndex:i]]) {
                    range.location = i;
                    NSString *curChar = [word substringWithRange:range];
                    [tempString replaceCharactersInRange:range withString:[curChar uppercaseString]];
                    counter++;
                }
            }
            NSString *counterChar = [NSString stringWithFormat:@"%d" , counter];
            [tempString insertString:counterChar atIndex:0];
            [resultArray addObject:tempString];
        }
    }
    
    [resultArray sortUsingComparator:^NSComparisonResult(id _Nonnull obj1, id _Nonnull obj2) {
        
        NSString *word1 = (NSString *)obj1;
        NSString *word2 = (NSString *)obj2;
        
        int firstCharacterValue = [[word1 substringWithRange:NSMakeRange(0, 1)] intValue];
        int secondCharacterValue = [[word2 substringWithRange:NSMakeRange(0, 1)] intValue];
        
        if (firstCharacterValue < secondCharacterValue) {
            return NSOrderedAscending;
        } else if (firstCharacterValue == secondCharacterValue) {
            return NSOrderedSame;
        } else {
            return NSOrderedDescending;
        }
    }];
    
    
    NSString *stringToReturn = [resultArray componentsJoinedByString:@" "];
    return stringToReturn;
}
@end
