CBLParseISO8601Date
===================

CBLParseISO8601Date exposes the C functions that implement date and time functions for SQLite, through one function, namely, CBLParseISO8601Date. CBLParseISO8601Date parses a C string as an ISO-8601 date-time, returning a UNIX timestamp (number of seconds since 1/1/1970), or a NAN if the string is not valid. These source files were extracted from the [Couchbase Lite Project](https://github.com/couchbase/couchbase-lite-ios). 

```objective-c
double CBLParseISO8601Date(const char* dateStr);
````

## Examples
### Usage
```objective-c
#import "CBLParseDate.h"

	NSString *string = @"1970-01-01T00:00:00Z";
	NSTimeInterval t = CBLParseISO8601Date(string.UTF8String) + [NSDate dateWithTimeIntervalSince1970:0.0];
	if (!isnan(t)){
		NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:t];
	}			
```
