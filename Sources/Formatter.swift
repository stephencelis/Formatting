/**
 A formatter. The `Result` type means the returned value at the end. The more formatters you compose, the
 more this will build up arguments. _E.g._, from `Result` to `(Int) -> Result` to
 `(Character) -> (Int) -> Result`, etc.
 */

public typealias Formatter<Result, A> = ((String) -> Result) -> A

/**
 A formatter that transforms `Input` into `Result`.
 */
public typealias FormatterOf<Input, Result> = Formatter<Result, (Input) -> Result>

/**
 Run the formatter to produce a `String` value.
 */
public func format<A>(_ formatter: Formatter<String, A>) -> A {
  return formatter { string in string }
}

// MARK:

/**
 Composition operator. Combines two formatters.
 
 - parameters:
   - lhs: a formatter
   - rhs: a formatter
 - returns: A formatter combining the left-hand side with the right-hand side.
 */
public func % <A, B, C>(lhs: Formatter<B, A>, rhs: Formatter<C, B>) -> Formatter<C, A> {
  return { stringToResult in
    lhs { leftString in
      rhs { rightString in
        stringToResult(leftString + rightString)
      }
    }
  }
}

private func s<A>(_ string: String) -> Formatter<A, A> {
  return { stringToResult in stringToResult(string) }
}

/**
 Composition operator. Combines a formatter and a string.
 
     format(int % " luftballons")(99)
     // "99 luftballons"
 
 - parameters:
   - lhs: a formatter
   - rhs: a string
 - returns: A formatter appending the given formatter with the given string.
 */
public func % <R, A>(lhs: Formatter<R, A>, rhs: String) -> Formatter<R, A> {
  return lhs % s(rhs)
}

/**
 Composition operator. Combines a string and a formatter.
 
     format("hello " % string)("world")
     // "hello world"

 - parameters:
   - lhs: a string
   - rhs: a formatter
 - returns: A formatter with the given string prepended to the given formatter.
 */
public func % <R, A>(lhs: String, rhs: Formatter<R, A>) -> Formatter<R, A> {
  return s(lhs) % rhs
}

// MARK:

/**
 Monoidal composition. Will append previous formatter input to the right-hand formatter.
 
     format("It's day " % D % " of " <> y % ".")(Date())
     // "It's day 180 of 2016."
 
 - parameters:
   - lhs: a formatter
   - rhs: a formatter of the same type
 - returns: A combined formatter matching the types of the given formatters.
 */
public func <> <R, A>(lhs: FormatterOf<R, A>, rhs: FormatterOf<R, A>) -> FormatterOf<R, A> {
  return { stringToResult in
    { input in
      lhs { leftString in
        rhs { rightString in
          stringToResult(leftString + rightString)
        }(input)
      }(input)
    }
  }
}

// MARK:

/**
 Function compose two formatters. Will feed the result of one formatter into another.
 
     format(left(2, "0") .% hex)(10)
     // "0a"
 
 - parameters:
   - lhs: a formatter that takes a string
   - rhs: a formatter
 */
public func .% <A, B, C>(lhs: Formatter<C, (String) -> B>, rhs: Formatter<B, A>) -> Formatter<C, A> {
  return { stringToResult in rhs(lhs(stringToResult)) }
}

// MARK:
// paren-reducing overloads: these can go away when generic accessors (_e.g._, `var string<A>`) are supported

public func format<A>(_ formatter: () -> Formatter<String, A>) -> A {
  return formatter()({ $0 })
}

public func % <R, A>(lhs: () -> Formatter<R, A>, rhs: String) -> Formatter<R, A> {
  return lhs() % s(rhs)
}

public func % <R, A>(lhs: String, rhs: () -> Formatter<R, A>) -> Formatter<R, A> {
  return s(lhs) % rhs()
}

public func % <A, B, C>(lhs: Formatter<B, A>, rhs: () -> Formatter<C, B>) -> Formatter<C, A> {
  return lhs % rhs()
}

public func % <A, B, C>(lhs: () -> Formatter<B, A>, rhs: Formatter<C, B>) -> Formatter<C, A> {
  return lhs() % rhs
}

public func <> <R, A>(lhs: () -> FormatterOf<R, A>, rhs: FormatterOf<R, A>) -> FormatterOf<R, A> {
  return lhs() <> rhs
}

public func <> <R, A>(lhs: FormatterOf<R, A>, rhs: () -> FormatterOf<R, A>) -> FormatterOf<R, A> {
  return lhs <> rhs()
}

public func <> <R, A>(lhs: () -> FormatterOf<R, A>, rhs: () -> FormatterOf<R, A>) -> FormatterOf<R, A> {
  return lhs() <> rhs()
}

public func .% <A, B, C>(lhs: () -> Formatter<C, (String) -> B>, rhs: Formatter<B, A>) -> Formatter<C, A> {
  return lhs() .% rhs
}

public func .% <A, B, C>(lhs: Formatter<C, (String) -> B>, rhs: () -> Formatter<B, A>) -> Formatter<C, A> {
  return lhs .% rhs()
}

public func .% <A, B, C>(lhs: () -> Formatter<C, (String) -> B>, rhs: () -> Formatter<B, A>)
  -> Formatter<C, A> {

    return lhs() .% rhs()
}
