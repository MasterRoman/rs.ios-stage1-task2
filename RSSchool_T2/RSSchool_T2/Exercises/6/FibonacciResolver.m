#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    NSMutableArray *a = [[NSMutableArray alloc]init];
    [a addObject:@"0"];
    [a addObject:@"1"];
    int i = 1;
    do {
        i++;
        [a addObject:[NSNumber numberWithInt:[[a objectAtIndex:(i-2)] intValue] + [[a objectAtIndex:(i-1)] intValue]]];
    } while (([[a objectAtIndex:i] intValue]*[[a objectAtIndex:i-1] intValue])<[number intValue]);
    if (([[a objectAtIndex:i] intValue]*[[a objectAtIndex:i-1] intValue])==[number intValue]){
        NSArray *outp = @[[a objectAtIndex:i-1],[a objectAtIndex:i],@1];
        return outp;
        
    }
    else {
        NSArray *outp = @[[a objectAtIndex:i-1],[a objectAtIndex:i],@0];
        return outp;
    }
}
@end
