//
//  CBLParseISO8601DateTests.m
//  CBLParseISO8601DateTests
//
//  Created by Kurry Tran on 10/31/13.
//
//
#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "CBLParseDate.h"

@interface CBLParseISO8601DateTests : XCTestCase
@end

@implementation CBLParseISO8601DateTests
// ISO 8601 Local timezone 1994-12-05T08:15:30-05:00
// ISO 8601 UTC 1994-12-05T13:15:30Z
static const double UNIX_TIME = 786633330;
// ISO 8601 Local timezone en_US_POSIX  2038-01-18T22:14:08-05:00
// ISO 8601 UTC 2038-01-19T03:14:08Z
static const double DISTANT_FUTURE_UNIX_TIME = 2147483648;
// ISO 8601 Local timezone en_US_POSIX  33658-09-26T21:46:39-04:00
// ISO 8601 UTC 33658-09-27T01:46:39Z
static const double DISTANT_INVALID_FUTURE_UNIX_TIME = 999999999999;
// ISO 8601 Local timezone en_US_POSIX  1969-12-31T19:00:00-05:00
// ISO 8601 UTC 1970-01-01T00:00:00Z
static const double BEGINNING_UNIX_TIME = 0;

static const NSString *UTC_FORMATTED_STRING = @"1994-12-05T13:15:30Z";
static const NSString *LOCAL_TIMEZONE_FORMATTED_STRING = @"1994-12-05T08:15:30-05:00";
static const NSString *DISTANT_VALID_FUTURE_UTC_TIME_STRING = @"2038-01-19T03:14:08Z";
static const NSString *DISTANT_INVALID_FUTURE_UTC_TIME_STRING = @"33658-09-26T21:46:39-04:00";
static const NSString *BEGINNING_OF_TIME_UTC_TIME_STRING = @"1970-01-01T00:00:00Z";

- (void)testThatFunctionReturnsNANIfPassedAnInvalidNonEmptyString
{
    XCTAssertTrue(isnan(CBLParseISO8601Date([@":*7vxck#sf#adsa" UTF8String])), @"Function Should Return NAN When Passed An Invalid Non Empty String");
}

- (void)testThatFunctionReturnsNANIfPassedAnEmptyString
{
    XCTAssertTrue(isnan(CBLParseISO8601Date([@"" UTF8String])), @"Function Should Return NAN When Passed An Empty String");
}

- (void)testThatFunctionReturnsCorrectTimeWhenPassedAnUTCFormatteedISO8601DateString
{
    XCTAssertTrue(CBLParseISO8601Date([UTC_FORMATTED_STRING UTF8String]) == UNIX_TIME, @"Function Should Return 786633330 When Passed A UTC Formatted date of %@", UTC_FORMATTED_STRING);
}

- (void)testThatFunctionReturnsCorrectTimeWhenPassedALocalTimeZoneFormatteedISO8601DateString
{
    XCTAssertTrue(CBLParseISO8601Date([LOCAL_TIMEZONE_FORMATTED_STRING UTF8String]) == UNIX_TIME, @"Function Should Return 786633330 When Passed A Local Timezone Formatted date of %@",LOCAL_TIMEZONE_FORMATTED_STRING);
}

- (void)testThatFunctionReturnsCorrectTimeWhenPassedDistantTimeInTheFutureZoneFormattedISO8601DateString
{
    XCTAssertTrue(CBLParseISO8601Date([DISTANT_VALID_FUTURE_UTC_TIME_STRING UTF8String]) == DISTANT_FUTURE_UNIX_TIME, @"Function Should Return 786633330 When Passed A Local Timezone Formatted date of %@", DISTANT_VALID_FUTURE_UTC_TIME_STRING);
}

- (void)testThatFunctionReturnsCorrectTimeWhenPassedBeginningOfTimeFormattedISO8601DateString
{
    XCTAssertTrue(CBLParseISO8601Date([BEGINNING_OF_TIME_UTC_TIME_STRING UTF8String]) == BEGINNING_UNIX_TIME, @"Function Should Return 0 When Passed A Local Timezone Formatted date of %@", BEGINNING_OF_TIME_UTC_TIME_STRING);
}

- (void)testThatFunctionReturnsNANWhenPassedInvalidUnixDistantFutureUTCFormattedISO8601DateString
{
    XCTAssertTrue(isnan(CBLParseISO8601Date([DISTANT_INVALID_FUTURE_UTC_TIME_STRING UTF8String])), @"Function Should Return NAN When Passed UTC Formatted date of %@", DISTANT_INVALID_FUTURE_UTC_TIME_STRING);
}

@end