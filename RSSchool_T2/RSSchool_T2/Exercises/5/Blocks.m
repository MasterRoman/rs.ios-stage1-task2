#import "Blocks.h"
@interface Blocks ()

@property (nonatomic, copy) NSArray *array;
@property (nonatomic, copy) Class class;

@end

@implementation Blocks

 - (BlockA)blockA {
     return ^void(NSArray *array) {
         self.array = array;
     };
 }
- (BlockB)blockB {
    return ^void(Class class) {
        self.class = class;
        NSMutableArray *arr = [self.array mutableCopy];
        [arr removeObjectIdenticalTo:[NSNull null]];
        [arr filterUsingPredicate:[NSPredicate predicateWithFormat: @"self isKindOfClass: %@", class]];
        
        if (class == [NSNumber class]) {
            __block NSInteger num = 0;
            [arr enumerateObjectsUsingBlock:^(NSNumber *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                num += [obj intValue];
            }];
            self.blockC(@(num));
        } else if (class == [NSString class]) {
            __block NSString *str = @"";
            [arr enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                str = [NSString stringWithFormat:@"%@%@", str, obj];
            }];
            self.blockC(str);
        } else if (class == [NSDate class]) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"dd.MM.yyyy";
            NSDate *resultDate = [arr firstObject];
            for (NSDate *currentDate in arr) {
                resultDate = [currentDate laterDate:resultDate];
            }
            self.blockC([formatter stringFromDate:resultDate]);
        }
    };
}
@end

