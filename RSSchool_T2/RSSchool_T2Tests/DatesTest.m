#import <XCTest/XCTest.h>
#import "Dates.h"

@interface DatesTest : XCTestCase
@end

@implementation DatesTest

- (void)test1 {
    XCTAssertEqualObjects([[Dates new] textForDay:@"15" month:@"3" year:@"2020"], @"15 марта, воскресенье");
}

- (void)test2 {
    XCTAssertEqualObjects([[Dates new] textForDay:@"29" month:@"2" year:@"2019"], @"Такого дня не существует");
}

- (void)test3 {
    XCTAssertEqualObjects([[Dates new] textForDay:@"19" month:@"11" year:@"1998"], @"19 ноября, четверг");
}

- (void)test4 {
    XCTAssertEqualObjects([[Dates new] textForDay:@"31" month:@"12" year:@"2024"], @"31 декабря, вторник");
}

- (void)test5 {
    XCTAssertEqualObjects([[Dates new] textForDay:@"1" month:@"13" year:@"2020"], @"Такого дня не существует");
}

@end
