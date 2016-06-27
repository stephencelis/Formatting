import XCTest
@testable import Formatting

class FormattingTests: XCTestCase {
  func testComposition() {
    XCTAssertEqual("Got: 'a' (97)",
                   format("Got: '" % char % "' (" <> asInt % ")", "a"))

    XCTAssertEqual("2.3e6",
                   format(lower .% sci, 2_300_000))
  }

  func testString() {
    XCTAssertEqual("Hello, world!",
                   format("Hello, " % string % "!", "world"))
  }

  func testDescribe() {
    struct Foo: CustomStringConvertible {
      var description: String { return "foo" }
    }
    XCTAssertEqual("x = foo",
                   format("x = " % describe, Foo()))
  }

  func testDebug() {
    struct Foo: CustomDebugStringConvertible {
      var debugDescription: String { return "<foo>" }
    }
    XCTAssertEqual("x = <foo>",
                   format("x = " % debug, Foo()))
  }

  func testChar() {
    XCTAssertEqual("Got: 'a'",
                   format("Got: '" % char % "'", "a" as Character))
  }

  func testAsInt() {
    XCTAssertEqual("Got: 97",
                   format("Got: " % asInt, "a" as Character))
  }

  func testUpper() {
    XCTAssertEqual("HELLO, WORLD!",
                   format("HELLO, " % upper % "!", "world"))
  }

  func testLower() {
    XCTAssertEqual("dr. jones",
                   format("dr. " % lower, "Jones"))
  }

  func testInt() {
    XCTAssertEqual("100%",
                   format(int % "%", 100))
  }

  func testFloat() {
    XCTAssertEqual("98.6",
                   format(float, 98.6))
  }

  func testSci() {
    XCTAssertEqual("2.3e6",
                   format(lower .% sci, 2_300_000))
  }

  func testDelimit() {
    XCTAssertEqual("1,000,000",
                   format(delimit, 1_000_000))
  }

  func testOrd() {
    if #available(/*iOS 9, */OSX 10.11, tvOS 9, watchOS 2, *) {
      XCTAssertEqual("10th",
                     format(ord, 10))
    }
  }

  func testLeft() {
    XCTAssertEqual("0a",
                   format(left(2, "0") .% hex, 10))
  }

  func testRight() {
    XCTAssertEqual("1.  Introduction",
                   format(right(3) % " " % string, "1.", "Introduction"))
  }

  func testCenter() {
    XCTAssertEqual("       Hello        ",
                   format(center(20), "Hello"))
  }

  func testFitLeft() {
    XCTAssertEqual("Abra cadab",
                   format(fitLeft(10), "Abra cadabra"))
  }

  func testFitRight() {
    XCTAssertEqual("ra cadabra",
                   format(fitRight(10), "Abra cadabra"))
  }

  func testBase() {
    XCTAssertEqual("10",
                   format(base(6), 6))
  }

  func testBin() {
    XCTAssertEqual("10",
                   format(bin, 2))
  }

  func testOct() {
    XCTAssertEqual("10",
                   format(oct, 8))
  }

  func testHex() {
    XCTAssertEqual("10",
                   format(hex, 16))
  }

  func testPrefixBin() {
    XCTAssertEqual("0b10",
                   format(prefixBin, 2))
  }

  func testPrefixOct() {
    XCTAssertEqual("0o10",
                   format(prefixOct, 8))
  }

  func testPrefixHex() {
    XCTAssertEqual("0x10",
                   format(prefixHex, 16))
  }

  func testBytes() {
    XCTAssertEqual("1 KB",
                   format(bytes, 1024))
  }

  static var allTests : [(String, (FormattingTests) -> () throws -> Void)] {
    return [
      ("testComposition", testComposition),
      ("testString", testString),
      ("testDescribe", testDescribe),
      ("testDebug", testDebug),
      ("testChar", testChar),
      ("testAsInt", testAsInt),
      ("testUpper", testUpper),
      ("testLower", testLower),
      ("testInt", testInt),
      ("testFloat", testFloat),
      ("testSci", testSci),
      ("testDelimit", testDelimit),
      ("testOrd", testOrd),
      ("testLeft", testLeft),
      ("testRight", testRight),
      ("testCenter", testCenter),
      ("testFitLeft", testFitLeft),
      ("testFitRight", testFitRight),
      ("testBase", testBase),
      ("testBin", testBin),
      ("testOct", testOct),
      ("testHex", testHex),
      ("testPrefixBin", testPrefixBin),
      ("testPrefixOct", testPrefixOct),
      ("testPrefixHex", testPrefixHex),
      ("testBytes", testBytes),
    ]
  }
}
