#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    int curPos = 0;
    int prevPos = 0;
    int i=0;
    int j=0;
    NSMutableString *aCoptyString = [a copy];
    NSString *aUppcaseString = [aCoptyString uppercaseString];
        while ((i<a.length) && (j<b.length)) {
            if ([b characterAtIndex:j] == [aUppcaseString characterAtIndex:i] ){
                curPos = i;
                j++;
                i=-1;
                if (curPos<prevPos){
                    return @"NO";
                } else
                {prevPos = curPos;}
            }
            
            i++;
        }
        if (j<b.length-1){
            return @"NO";
        }
    return @"YES";
}
@end
