import Foundation

public func date<A>(_ formatter: DateFormatter) -> FormatterOf<Date, A> {
  return Formatter { f in { date in f(formatter.string(from: date)) } }
}

private func date<A>(builder: (DateFormatter) -> ()) -> FormatterOf<Date, A> {
  let df = DateFormatter()
  builder(df)
  return date(df)
}

public func date<A>(format: String) -> FormatterOf<Date, A> {
  return date { $0.dateFormat = format }
}

public func date<A>(_ dateStyle: DateFormatter.Style, time timeStyle: DateFormatter.Style = .noStyle)
  -> FormatterOf<Date, A> {
    assert(dateStyle != .noStyle, "use the `time()` formatter for time")
    return date { ($0.dateStyle, $0.timeStyle) = (dateStyle, timeStyle) }
}

public func time<A>(_ timeStyle: DateFormatter.Style) -> FormatterOf<Date, A> {
  return date(.noStyle, time: timeStyle)
}

/**
 An ISO8601 formatter.
 
 - parameter options: formatting options
 */
@available(iOS 10, OSX 10.12, tvOS 10, watchOS 3, *)
public func iso8601<A>(_ options: ISO8601DateFormatter.Options = []) -> FormatterOf<Date, A> {
  let df = ISO8601DateFormatter()
  if !options.isEmpty {
    df.formatOptions = options
  }
  return Formatter { f in { date in f(df.string(from: date)) } }
}

/**
 An ISO8601 formatter with default `Foundation.ISO8601DateFormatter.Options`.
 */
@available(iOS 10, OSX 10.12, tvOS 10, watchOS 3, *)
public func iso8601<A>() -> FormatterOf<Date, A> {
  return iso8601([])
}

// MARK: Era

/**
 Era. Abbreviated form.
 
     format(G)(Date())
     // "AD"
 */
public func G<A>() -> FormatterOf<Date, A> {
  return date(format: "G")
}

/**
 Era. Long form.

     format(GGGG)(Date())
     // "Anno Domini"
 */
public func GGGG<A>() -> FormatterOf<Date, A> {
  return date(format: "GGGG")
}

/**
 Era. Narrow form.

     format(GGGGG)(Date())
     // "A"
 */
public func GGGGG<A>() -> FormatterOf<Date, A> {
  return date(format: "GGGGG")
}

// MARK: Year

/**
 Year.

     format(y)(Date())
     // "2016"
 */
public func y<A>() -> FormatterOf<Date, A> {
  return date(format: "y")
}

/**
 Year. Zero-padded and truncated to 2 characters.

     format(yy)(ad1)
     // "01"
     format(yy)(Date())
     // "16"
 */
public func yy<A>() -> FormatterOf<Date, A> {
  return date(format: "yy")
}

/**
 Year. Zero-padded to 4 characters.

     format(yyyy)(ad1)
     // "0001"
     format(yyyy)(Date())
     // "2016"
 */
public func yyyy<A>() -> FormatterOf<Date, A> {
  return date(format: "yyyy")
}

/**
 Year (in "Week of Year" based calendars). May not always be the same value as calendar year.
 */
public func Y<A>() -> FormatterOf<Date, A> {
  return date(format: "Y")
}

/**
 Year (in "Week of Year" based calendars). May not always be the same value as calendar year. Padded and
 truncated to 2 characters.
 */
public func YY<A>() -> FormatterOf<Date, A> {
  return date(format: "YY")
}

/**
 Year (in "Week of Year" based calendars). May not always be the same value as calendar year. Zero-padded to
 4 characters.
 */
public func YYYY<A>() -> FormatterOf<Date, A> {
  return date(format: "YYYY")
}

// MARK: Quarter

/**
 Quarter. Numerical.
 */
public func Q<A>() -> FormatterOf<Date, A> {
  return date(format: "Q")
}

/**
 Quarter. Abbreviation.
 */
public func QQQ<A>() -> FormatterOf<Date, A> {
  return date(format: "QQQ")
}

/**
 Quarter. Full name.
 */
public func QQQQ<A>() -> FormatterOf<Date, A> {
  return date(format: "QQQQ")
}

/**
 **Stand-alone** quarter. Numerical.
 */
public func q<A>() -> FormatterOf<Date, A> {
  return date(format: "q")
}

/**
 **Stand-alone** quarter. Abbreviation.
 */
public func qqq<A>() -> FormatterOf<Date, A> {
  return date(format: "qqq")
}

/**
 **Stand-alone** quarter. Full name.
 */
public func qqqq<A>() -> FormatterOf<Date, A> {
  return date(format: "qqqq")
}

// MARK: Month

/**
 Month. Numerical.
 */
public func M<A>() -> FormatterOf<Date, A> {
  return date(format: "M")
}

/**
 Month. Numerical. Zero-padded.
 */
public func MM<A>() -> FormatterOf<Date, A> {
  return date(format: "MM")
}

/**
 Month. Abbreviation.
 */
public func MMM<A>() -> FormatterOf<Date, A> {
  return date(format: "MMM")
}

/**
 Month. Full name.
 */
public func MMMM<A>() -> FormatterOf<Date, A> {
  return date(format: "MMMM")
}

/**
 Month. Narrow name.
 */
public func MMMMM<A>() -> FormatterOf<Date, A> {
  return date(format: "MMMMM")
}

// MARK: Week

/**
 Week of year.
 */
public func w<A>() -> FormatterOf<Date, A> {
  return date(format: "w")
}

/**
 Week of year. Zero-padded.
 */
public func ww<A>() -> FormatterOf<Date, A> {
  return date(format: "ww")
}

/**
 Week of month.
 */
public func W<A>() -> FormatterOf<Date, A> {
  return date(format: "W")
}

// MARK: Day

/**
 Date (day of the month).
 */
public func d<A>() -> FormatterOf<Date, A> {
  return date(format: "d")
}

/**
 Date (day of the month). Zero-padded.
 */
public func dd<A>() -> FormatterOf<Date, A> {
  return date(format: "dd")
}

/**
 Day of year.
 */
public func D<A>() -> FormatterOf<Date, A> {
  return date(format: "D")
}

/**
 Day of year. Zero-padded.
 */
public func DDD<A>() -> FormatterOf<Date, A> {
  return date(format: "DDD")
}

/**
 Day of week in month.
 */
public func F<A>() -> FormatterOf<Date, A> {
  return date(format: "F")
}

// MARK: Week day

/**
 Day of week. Short day.
 
     format(E)(Date())
     // "Tues"
 */
public func E<A>() -> FormatterOf<Date, A> {
  return date(format: "E")
}

/**
 Day of week. Full name.

     format(E)(Date())
     // "Tuesday"
 */
public func EEEE<A>() -> FormatterOf<Date, A> {
  return date(format: "EEEE")
}

/**
 Day of week. Narrow name.

     format(E)(Date())
     // "T"
 */
public func EEEEE<A>() -> FormatterOf<Date, A> {
  return date(format: "EEEEE")
}

/**
 Day of week. Short name.

     format(E)(Date())
     // "Tu"
 */
public func EEEEEE<A>() -> FormatterOf<Date, A> {
  return date(format: "EEEEEE")
}

/**
 Day of week. Numeric value.

     format(e)(Date())
     // "1"
 */
public func e<A>() -> FormatterOf<Date, A> {
  return date(format: "e")
}

// MARK: Period

/**
 AM or PM.

     format(a)(Date())
     // "PM"
 */
public func a<A>() -> FormatterOf<Date, A> {
  return date(format: "a")
}

// MARK: Hour

/**
 Hour [1-12]. Use `hh` for zero padding.
 */
public func h<A>() -> FormatterOf<Date, A> {
  return date(format: "h")
}

/**
 Hour [0-12]. Zero-padded.
 */
public func hh<A>() -> FormatterOf<Date, A> {
  return date(format: "hh")
}

/**
 Hour [0-23]. Use `HH` for zero padding.
 */
public func H<A>() -> FormatterOf<Date, A> {
  return date(format: "H")
}

/**
 Hour [0-23]. Zero-padded.
 */
public func HH<A>() -> FormatterOf<Date, A> {
  return date(format: "HH")
}

/**
 Hour [0-11]. Use `KK` for zero padding.
 */
public func K<A>() -> FormatterOf<Date, A> {
  return date(format: "K")
}

/**
 Hour [0-11]. Zero-padded.
 */
public func KK<A>() -> FormatterOf<Date, A> {
  return date(format: "KK")
}

/**
 Hour [1-24]. Use `kk` for zero padding.
 */
public func k<A>() -> FormatterOf<Date, A> {
  return date(format: "k")
}

/**
 Hour [1-24]. Zero-padded.
 */
public func kk<A>() -> FormatterOf<Date, A> {
  return date(format: "kk")
}

// MARK: Minute

/**
 Minute. Use `mm` for zero padding.
 */
public func m<A>() -> FormatterOf<Date, A> {
  return date(format: "m")
}

/**
 Minute. Zero-padded.
 */
public func mm<A>() -> FormatterOf<Date, A> {
  return date(format: "mm")
}

// MARK: Second

/**
 Second. Use `ss` for zero padding.
 */
public func s<A>() -> FormatterOf<Date, A> {
  return date(format: "s")
}

/**
 Second. Zero-padded.
 */
public func ss<A>() -> FormatterOf<Date, A> {
  return date(format: "ss")
}

/**
 Fractional second truncated to 1 character.
 */
public func S<A>() -> FormatterOf<Date, A> {
  return date(format: "S")
}

/**
 Fractional second truncated to 2 characters.
 */
public func SS<A>() -> FormatterOf<Date, A> {
  return date(format: "SS")
}

/**
 Fractional second truncated to 3 characters.
 */
public func SSS<A>() -> FormatterOf<Date, A> {
  return date(format: "SSS")
}

/**
 Milliseconds in day. This field behaves _exactly_ like a composite of all time-related fields, not including
 the zone fields. As such, it also reflects discontinuities of those fields on DST transition days. On a day
 of DST onset, it will jump forward. On a day of DST cessation, it will jump backward. This reflects the fact
 that is must be combined with the offset field to obtain a unique local time value.
 */
public func A<A>() -> FormatterOf<Date, A> {
  return date(format: "A")
}

// MARK: Zone

/**
 Time zone. The _short specific non-location format_. Where that is unavailable, falls back to the short
 localized GMT format (`O`).
 
     format(z)(Date())
     // "EDT"
 */
public func z<A>() -> FormatterOf<Date, A> {
  return date(format: "z")
}

/**
 The _long specific non-location format_. Where that is unavailable, falls back to the long localized GMT
 format (`OOOO`).

     format(zzzz)(Date())
     // "Eastern Daylight Time"
 */
public func zzzz<A>() -> FormatterOf<Date, A> {
  return date(format: "zzzz")
}

/**
 The _ISO8601 basic format_ with hours, minutes and optional seconds fields. The format is equivalent to RFC
 822 zone format (when optional seconds field is absent). This is equivalent to the `xxxx` specifier.
 
     format(Z)(Date())
     // "-0400"
 */
public func Z<A>() -> FormatterOf<Date, A> {
  return date(format: "Z")
}

/**
 The _long localized GMT format_. This is equivalent to the `OOOO` specifier.
 
     format(ZZZZ)(Date())
     // "GMT-04:00"
 */
public func ZZZZ<A>() -> FormatterOf<Date, A> {
  return date(format: "ZZZZ")
}

/**
 The _ISO8601 extended format_ with hours, minutes and optional seconds fields. The ISO8601 UTC indicator "Z"
 is used when local time offset is 0. This is equivalent to the `XXXXX` specifier.

     format(ZZZZZ)(Date())
     // "-04:00"
 */
public func ZZZZZ<A>() -> FormatterOf<Date, A> {
  return date(format: "ZZZZZ")
}

/**
 The _short localized GMT format_.

     format(ZZZZZ)(Date())
     // "GMT-4"
 */
public func O<A>() -> FormatterOf<Date, A> {
  return date(format: "O")
}

/**
 The _long localized GMT format_.

     format(ZZZZZ)(Date())
     // "GMT-04:00"
 */
public func OOOO<A>() -> FormatterOf<Date, A> {
  return date(format: "OOOO")
}

/**
 The _short generic non-location format_. Where that is unavailable, falls back to the _generic location
 format_ (`VVVV`), then the _short localized GMT format_ as the final fallback.

     format(v)(Date())
     // "ET"
 */
public func v<A>() -> FormatterOf<Date, A> {
  return date(format: "v")
}

/**
 The _long generic non-location format_. Where that is unavailable, falls back to _generic location format_
 (`VVVV`).

     format(vvvv)(Date())
     // "Eastern Time"
 */
public func vvvv<A>() -> FormatterOf<Date, A> {
  return date(format: "vvvv")
}

/**
 The short time zone ID. Where that is unavailable, the special short time zone ID _unk_ (Unknown Zone) is
 used.

     format(V)(Date())
     // "usnyc"
 
 - note: This specifier was originally used for a variant of the short specific non-location format, but it
   was deprecated in the later version of this specification. In CLDR 23, the definition of the specifier was
   changed to designate a short time zone ID.
 */
public func V<A>() -> FormatterOf<Date, A> {
  return date(format: "V")
}

/**
 The long time zone ID.

     format(VV)(Date())
     // "America/New_York"
 */
public func VV<A>() -> FormatterOf<Date, A> {
  return date(format: "VV")
}

/**
 The exemplar city (location) for the time zone. Where that is unavailable, the localized exemplar city name
 for the special zone _Etc/Unknown_ is used as the fallback (for example, "Unknown City").

     format(VVV)(Date())
     // "New York"
 */
public func VVV<A>() -> FormatterOf<Date, A> {
  return date(format: "VVV")
}

/**
 The _generic location format_. Where that is unavailable, falls back to the _long localized GMT format_
 (`OOOO`).
 
 This is especially useful when presenting possible timezone choices for user selection, since the naming is
 more uniform than the `v` format.

     format(VVVV)(Date())
     // "New York Time"
 
 - note: Fallback is only necessary with a GMT-style Time Zone ID, like Etc/GMT-830
 */
public func VVVV<A>() -> FormatterOf<Date, A> {
  return date(format: "VVVV")
}

/**
 The _ISO8601 basic format_ with hours field and optional minutes field. The ISO8601 UTC indicator "Z" is
 used when local time offset is 0. (The same as `x`, plus "Z".)

     format(X)(Date())
     // "-04"
     format(X)(utc)
     // "Z"
 */
public func X<A>() -> FormatterOf<Date, A> {
  return date(format: "X")
}
/**
 The _ISO8601 basic format_ with hours and minutes fields. The ISO8601 UTC indicator "Z" is used when local
 time offset is 0. (The same as `xx`, plus "Z".)

     format(XX)(Date())
     // "-0400"
     format(XX)(utc)
     // "Z"
 */
public func XX<A>() -> FormatterOf<Date, A> {
  return date(format: "XX")
}
/**
 The _ISO8601 basic format_ with hours and minutes fields. The ISO8601 UTC indicator "Z" is used when local
 time offset is 0. (The same as `xxx`, plus `Z`.)

     format(XXX)(Date())
     // "-04:00"
     format(XXX)(utc)
     // "Z"
 */
public func XXX<A>() -> FormatterOf<Date, A> {
  return date(format: "XXX")
}
/**
 The _ISO8601 basic format_ with hours, minutes and optional seconds fields. The ISO8601 UTC indicator "Z" is
 used when local time offset is 0. (The same as `xxxx`, plus "Z".)

     format(XXXX)(Date())
     // "-0400"
     format(XXXX)(utc)
     // "Z"

 - note: The seconds field is not supported by the ISO8601 specification.
 */
public func XXXX<A>() -> FormatterOf<Date, A> {
  return date(format: "XXXX")
}
/**
 The _ISO8601 extended format_ with hours, minutes and optional seconds fields. The ISO8601 UTC indicator "Z"
 is used when local time offset is 0. (The same as `xxxxx`, plus "Z".)

     format(XXXXX)(Date())
     // "-04:00"
     format(XXXXX)(utc)
     // "Z"

 - note: The seconds field is not supported by the ISO8601 specification.
 */
public func XXXXX<A>() -> FormatterOf<Date, A> {
  return date(format: "XXXXX")
}

/**
 The _ISO8601 basic format_ with hours field and optional minutes field. (The same as `x`, plus "Z".)

     format(x)(Date())
     // "-04"
 */
public func x<A>() -> FormatterOf<Date, A> {
  return date(format: "x")
}
/**
 The _ISO8601 basic format_ with hours and minutes fields. (The same as `x`, plus "Z".)

     format(xx)(Date())
     // "-0400"
 */
public func xx<A>() -> FormatterOf<Date, A> {
  return date(format: "xx")
}
/**
 The _ISO8601 basic format_ with hours and minutes fields. (The same as `xxx`, plus `Z`.)

     format(xxx)(Date())
     // "-04:00"
 */
public func xxx<A>() -> FormatterOf<Date, A> {
  return date(format: "xxx")
}
/**
 The _ISO8601 basic format_ with hours, minutes and optional seconds fields. (The same as `xxxx`, plus "Z".)

     format(xxxx)(Date())
     // "-0400"

 - note: The seconds field is not supported by the ISO8601 specification.
 */
public func xxxx<A>() -> FormatterOf<Date, A> {
  return date(format: "xxxx")
}
/**
 The _ISO8601 extended format_ with hours, minutes and optional seconds fields. (The same as `xxxxx`, plus
 "Z".)

     format(xxxxx)(Date())
     // "-04:00"

 - note: The seconds field is not supported by the ISO8601 specification.
 */
public func xxxxx<A>() -> FormatterOf<Date, A> {
  return date(format: "xxxxx")
}
