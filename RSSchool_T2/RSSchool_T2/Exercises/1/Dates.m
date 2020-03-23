#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSCalendar *cal = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [[NSDateComponents alloc] init];
    comp.day = [day intValue];
    comp.month = [month intValue];
    comp.year = [year intValue];
    if ([comp isValidDateInCalendar:cal]){
        NSDateFormatter *dateForm = [[NSDateFormatter alloc]init];
        dateForm.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
        dateForm.dateFormat = @"dd MMMM, EEEE";
        NSDate *curDate = [cal dateFromComponents:comp];
        return [dateForm stringFromDate:curDate];
    } else {
        return @"Такого дня не существует";
    }
}
@end
