import Foundation

// MARK: String types

/**
 Render a string.
 */
public func string<A>() -> FormatterOf<String, A> {
  return Formatter { f in { string in f(string) } }
}

/**
 Render the `description` of a `CustomStringConvertible`.
 */
public func describe<A, R: CustomStringConvertible>() -> FormatterOf<R, A> {
  return Formatter { f in { convertible in f(convertible.description) } }
}

/**
 Render the `debugDescription` of a `CustomDebugStringConvertible`.
 */
public func debug<A, R: CustomDebugStringConvertible>() -> FormatterOf<R, A> {
  return Formatter { f in { convertible in f(convertible.debugDescription) } }
}

/**
 Render a character.
 */
public func char<A>() -> FormatterOf<Character, A> {
  return Formatter { f in { char in f(String(char)) } }
}

/**
 Render a character code.

     format("Got: '" % char % "' (" <> asInt % ")")("a")
     // "Got: 'a' (92)"
 */
public func asInt<A>() -> FormatterOf<Character, A> {
  return Formatter { f in { char in f(String(String(char).utf8.first!)) } }
}

/**
 Render uppercased.
 */
public func upper<A>() -> FormatterOf<String, A> {
  return Formatter { f in { string in f(string.uppercased()) } }
}

/**
 Render lowercased.
 */
public func lower<A>() -> FormatterOf<String, A> {
  return Formatter { f in { string in f(string.lowercased()) } }
}

// MARK: Numbers

/**
 Render an integer.
 */
public func int<A>() -> FormatterOf<Int, A> {
  return Formatter { f in { int in f(String(int)) } }
}

/**
 Render a double.
 */
public func float<A>() -> FormatterOf<Double, A> {
  return Formatter { f in { double in f(String(double)) } }
}

public func number<A>(_ formatter: NumberFormatter) -> FormatterOf<Int, A> {
  return Formatter { f in { n in f(formatter.string(from: n)!) } }
}

public func number<A>(_ formatter: NumberFormatter) -> FormatterOf<Double, A> {
  return Formatter { f in { n in f(formatter.string(from: n)!) } }
}

private func number<A>(_ builder: (NumberFormatter) -> ()) -> FormatterOf<Int, A> {
  let nf = NumberFormatter()
  builder(nf)
  return number(nf)
}

private func number<A>(_ builder: (NumberFormatter) -> ()) -> FormatterOf<Double, A> {
  let nf = NumberFormatter()
  builder(nf)
  return number(nf)
}

public func sci<A>() -> FormatterOf<Double, A> {
  return number { $0.numberStyle = .scientific }
}

/**
 Add commas (or the current locale's grouping separator) to an integral.
 
     format(12_000)
     // "12,000"
 */
public func delimit<A>() -> FormatterOf<Int, A> {
  return number { ($0.numberStyle, $0.usesGroupingSeparator) = (.decimal, true) }
}

/**
 Add a suffix to an integral.
 
     format(ord)(1)
     // "1st"
 */
@available(/*iOS 9, */OSX 10.11, tvOS 9, watchOS 2, *)
public func ord<A>() -> FormatterOf<Int, A> {
  return number { $0.numberStyle = .ordinal }
}

// MARK: Padding

/**
 Pad the left-hand side of a string till it reaches `length` characters wide, if necessary filling with
 character `pad`.

     format(left(2, "0") .% hex)(10)
     // "0a"
 
 - parameters:
   - length: length rendered string is padded to
   - pad: character used for padding (defaults to a space)
 */
public func left<A>(_ length: Int, _ pad: Character = " ") -> FormatterOf<String, A> {
  return Formatter { f in
    { string in
      let pad = repeatElement(String(pad), count: max(0, length - string.characters.count))
        .joined(separator: "")
      return f(pad + string)
    }
  }
}

/**
 Pad the right-hand side of a string till it reaches `length` characters wide, if necessary filling with
 character `pad`.

 format(right(3) .% int % " | " string)(1)("import Formatting")
 // "1   | import Formatting"

 - parameters:
   - length: length rendered string is padded to
   - pad: character used for padding (defaults to a space)
 */
public func right<A>(_ length: Int, _ pad: Character = " ") -> FormatterOf<String, A> {
  return Formatter { f in
    { string in
      let pad = repeatElement(String(pad), count: max(0, length - string.characters.count))
        .joined(separator: "")
      return f(string + pad)
    }
  }
}

/**
 Pad the right- and left-hand side of a string till it reaches `length` characters wide, if necessary
 filling with character `pad`.

 format(left(2, "0") .% hex)(10)
 // "0a"

 - parameters:
   - length: length rendered string is padded to
   - pad: character used for padding (defaults to a space)
 
 - note: `center` is right-hand biased and will pad the right-hand side with an extra character when an odd
   number of characters are necessary for padding.
 */
public func center<A>(_ length: Int, _ pad: Character = " ") -> FormatterOf<String, A> {
  return Formatter { f in
    { string in
      let half = Double(max(0, length - string.characters.count)) / 2
      let p = String(pad)
      let l = repeatElement(p, count: Int(floor(half))).joined(separator: "")
      let r = repeatElement(p, count: Int(ceil(half))).joined(separator: "")
      return f(l + string + r)
    }
  }
}

/**
 Fit in the given length, truncating on the left.
 */
public func fitLeft<A>(_ length: Int) -> FormatterOf<String, A> {
  return Formatter { f in
    { string in f(String(string.characters.prefix(length))) }
  }
}

/**
 Fit in the given length, truncating on the right.
 */
public func fitRight<A>(_ length: Int) -> FormatterOf<String, A> {
  return Formatter { f in
    { string in f(String(string.characters.suffix(length))) }
  }
}

// MARK: Bases

/**
 Render an integral with the given base.
 */
public func base<A>(_ radix: Int) -> FormatterOf<Int, A> {
  return Formatter { f in { int in f(String(int, radix: radix)) } }
}

/**
 Render an integer using binary notation.
 */
public func bin<A>() -> FormatterOf<Int, A> {
  return base(2)
}

/**
 Render an integer using octal notation.
 */
public func oct<A>() -> FormatterOf<Int, A> {
  return base(8)
}

/**
 Render an integer using hexidecimal notation
 */
public func hex<A>() -> FormatterOf<Int, A> {
  return base(16)
}

/**
 Render an integer using binary notation with a leading `0b`.
 */
public func prefixBin<A>() -> FormatterOf<Int, A> {
  return "0b" % bin
}

/**
 Render an integer using octal notation with a leading `0o`.
 */
public func prefixOct<A>() -> FormatterOf<Int, A> {
  return "0o" % oct
}

/**
 Render an integer using hexidecimal notation with a leading `0x`.
 */
public func prefixHex<A>() -> FormatterOf<Int, A> {
  return "0x" % hex
}

/**
 Renders a given byte count using a given `Foundation.ByteCountFormatter`.
 */
public func bytes<A>(_ formatter: ByteCountFormatter) -> FormatterOf<Int, A> {
  return Formatter { f in { byteCount in f(formatter.stringFromByteCount(Int64(byteCount))) } }
}

/**
 Renders a given byte count using a `Foundation.ByteCountFormatter`.
 */
public func bytes<A>() -> FormatterOf<Int, A> {
  return bytes(ByteCountFormatter())
}
