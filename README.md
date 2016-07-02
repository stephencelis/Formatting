# Formatting

Type-safe, functional string formatting in Swift.

Inspired by Chris Done's excellent [Haskell library](https://github.com/chrisdone/formatting).

``` swift
import Formatting

format("Hello, " % string % "!", "world")
// "Hello, world!"
```


## Introduction

Traditional string formatting methods (interpolation, `printf`, and template strings) can lead to subtle (and not so subtle) runtime bugs.

``` swift
print("Hello, \(thing)!")              // Hello, nil!
print("Hello, \(thing)!")              // Hello, Optional("world")!
```

``` objective-c
NSLog(@"Hello, %@!", thing);           // Hello, (null)!
```

**Formatting** brings compile-time checks.

``` swift
print("Hello, " % string % "!", thing) // Value of optional type String? not unwrapped
```

And composability.

``` swift
let greet =
  format("Hello, " % string % "!")

greet("world")                         // Hello, world!
```

<!-- ## Formatters -->

## Composing formatters

Use `%` to build a formatter with strings and other formatters.

``` swift
format(string % " is " % int % "years old.", "Alice", 25)
// "Alice is 25 years old."
```

Use `<>` to pass the previous formatter argument to the next formatter.

``` swift
format(yyyy % "-" <> MM % "-" <> dd, Date())
// "2016-06-28"
```

Use `.%` to feed the result of one formatter into another.

``` swift
format(left(2, "0") .% hex, 10)
// "0a"
```

Call `format` without arguments to return a curried formatter function.

``` swift
let log =
  format(right(5) % " -- [" % iso8601 % "] " % string)

let infoLog = log("INFO")
let debugLog = log("DEBUG")

infoLog(Date())("Logging in...")
// "INFO  -- [2016-06-28T12:34:56Z] Logging in..."
debugLog(Date())("Logged in successfully!")
// "DEBUG -- [2016-06-28T12:34:56Z] Logged in successfully!"
```

## License

Formatting is available under the MIT license. See [the LICENSE
file](./LICENSE.txt) for more information.
